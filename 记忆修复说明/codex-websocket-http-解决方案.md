# Codex WebSocket / HTTP 最终结论（覆盖旧的强制 HTTP 方案）

## 最终结论
- 这次问题的正确修复，不是“禁用 WebSocket”。
- 本机最终有效方案是恢复内建 `openai` provider，而不是继续使用自定义 `openai_http`。
- 旧的“WebSocket 重连 5 次就强制 HTTP”方案，在当前环境下已经被验证为不适用。

## 正确配置
文件：`C:\Users\MT\.codex\config.toml`

```toml
model_provider = "openai"
model = "gpt-5.3-codex"
model_reasoning_effort = "medium"
personality = "pragmatic"
```

## 为什么旧的强制 HTTP 方案不再成立
旧方案假设：
- 只要出现 `Reconnecting...`
- 就说明 WebSocket 不可用
- 因此应当强制：

```toml
supports_websockets = false
```

但这次实际验证结果不是这样：
- 使用 `openai_http` 时：`codex doctor` 对 active provider 给出 `HTTP 403`
- 切回 `openai` 后：`codex doctor` 显示 `HTTP 101 Switching Protocols`
- 最终 Codex 恢复正常

这说明：
- 旧问题并不是“必须禁用 WebSocket”
- 真正的问题是：之前那条自定义 HTTP provider 链路在当前环境下会稳定打到 `403`

## 本次问题原因
- `openai_http` 自定义 provider 指向 `https://chatgpt.com/backend-api`
- 并通过 `wire_api = "responses"` 强制走 HTTP responses 链路
- 在当前网络与认证状态下，这条链路稳定返回 `403`
- 因此重连、403、看似代理问题的现象，本质上被旧 provider 方案放大了

## 当前已验证有效的事实
- `model_provider = "openai"`
- `codex doctor` 中出现：

```text
websocket connected (HTTP 101 Switching Protocols)
```

- 这说明官方内建 provider 的 WebSocket 握手是成功的
- 因而不应继续默认禁用 WebSocket

## 代理配置建议
- 确保 Clash 正在运行，`127.0.0.1:7897` 可用。
- 优先保证只有一套代理入口在主导网络行为：
  - 系统代理 / TUN
  - 或环境变量代理
- 不建议长期系统代理和全量环境变量代理同时叠加。

## 如果要用环境变量代理
```powershell
$env:HTTP_PROXY='http://127.0.0.1:7897'
$env:HTTPS_PROXY='http://127.0.0.1:7897'
$env:ALL_PROXY='socks5://127.0.0.1:7897'
$env:NO_PROXY='localhost,127.0.0.1'
codex
```

## 不再推荐的旧配置
```toml
model_provider = "openai_http"

[model_providers.openai_http]
name = "OpenAI HTTP"
base_url = "https://chatgpt.com/backend-api"
requires_openai_auth = true
wire_api = "responses"
supports_websockets = false
```

## 现在应该怎么排查
1. 先确认 `config.toml` 里活跃 provider 是 `openai`。
2. 再看 `codex doctor` 是否出现 `HTTP 101 Switching Protocols`。
3. 如果还有问题，再查代理监听和重复代理配置。
4. 不要再把“有重连”直接当成“必须强制 HTTP”的证据。

## 最终保留方案
- 长期保留：`model_provider = "openai"`
- 旧的 `openai_http` 只作为历史方案记录，不再作为默认修复方案使用
