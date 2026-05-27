# Codex 403 / Provider 混用最终修复说明（覆盖旧方案）

## 最终结论
- 本机这次最终有效的修复方案，不是强制 HTTP，也不是把 `model_provider` 固定成 `openai_http`。
- 正确做法是：恢复 Codex 内建 `openai` provider。
- 当前生效配置文件：`C:\Users\MT\.codex\config.toml`

## 正确配置
文件：`C:\Users\MT\.codex\config.toml`

```toml
model_provider = "openai"
model = "gpt-5.3-codex"
model_reasoning_effort = "medium"
personality = "pragmatic"
```

## 可保留但不要启用的旧配置
- 可以保留旧的 `[model_providers.openai_http]` 配置块，方便回滚或对比。
- 但不要再把下面这一行设为活跃配置：

```toml
model_provider = "openai_http"
```

## 本次问题的真实原因
- 之前的旧方案把 Codex 从内建 `openai` provider 切到了自定义 `openai_http` provider。
- 该 provider 通过：
  - `base_url = "https://chatgpt.com/backend-api"`
  - `wire_api = "responses"`
  - `supports_websockets = false`
  强制走 HTTP。
- 在当前这台机器和当前网络环境下，这条自定义 HTTP 链路虽然“能到达” `chatgpt.com/backend-api`，但实际对 `responses` 请求稳定返回 `HTTP 403`。
- 所以根因不是“WebSocket 一定有问题”，而是“旧的自定义 provider 方案在当前环境下已经不适配”。
- 另外，系统代理和环境变量代理同时开启，会增加排查复杂度，但这次它不是首要根因。

## 本次实际验证结果
- 使用旧配置 `openai_http` 时，`codex doctor` 显示：
  - `ChatGPT base URL ... reachable (HTTP 403)`
- 切回内建 `openai` 后，`codex doctor` 显示：
  - `websocket connected (HTTP 101 Switching Protocols)`
- 随后 Codex 恢复正常使用。

## 为什么旧方案要废弃
旧方案的核心思路是：
- 只要出现 `Reconnecting...`，就把 WebSocket 禁掉，强制改走 HTTP。

这次验证说明该思路并不通用，甚至会把原本可用的官方链路改坏：
- 旧方案：`openai_http` -> `HTTP 403`
- 最终有效方案：`openai` -> `WebSocket 101 Switching Protocols`

因此，今后不要再把“重连 5 次”直接等同于“必须禁用 WebSocket”。

## 推荐的代理配置方式
- 确保 Clash 正在运行，且 `127.0.0.1:7897` 正常监听。
- 代理配置尽量只保留一套入口，推荐二选一：
  - 方案 A：系统代理 / TUN / 全局模式
  - 方案 B：环境变量代理
- 不推荐在系统代理已经开启的情况下，再长期叠加完整的 `HTTP_PROXY` / `HTTPS_PROXY` / `ALL_PROXY`，否则 CLI、Electron、内建网络栈可能表现不一致。

## 如果你确实要用环境变量代理
```powershell
$env:HTTP_PROXY='http://127.0.0.1:7897'
$env:HTTPS_PROXY='http://127.0.0.1:7897'
$env:ALL_PROXY='socks5://127.0.0.1:7897'
$env:NO_PROXY='localhost,127.0.0.1'
codex
```

## 不再推荐作为默认修复方案的旧配置
```toml
model_provider = "openai_http"

[model_providers.openai_http]
name = "OpenAI HTTP"
base_url = "https://chatgpt.com/backend-api"
requires_openai_auth = true
wire_api = "responses"
supports_websockets = false
```

## 正确排查顺序
1. 先看 `C:\Users\MT\.codex\config.toml` 当前活跃的是不是 `model_provider = "openai"`。
2. 再确认 Clash / 代理端口是否正常监听。
3. 运行 `codex doctor`：
   - 如果看到 `websocket connected (HTTP 101 Switching Protocols)`，说明 provider 链路正常。
   - 如果仍然异常，再处理代理重复配置问题。
4. 如果桌面端和 CLI 表现不一致，优先排查是否同时启用了系统代理和环境变量代理。

## 已执行的最终修复
- 将 `C:\Users\MT\.codex\config.toml` 中的：

```toml
model_provider = "openai_http"
```

改回：

```toml
model_provider = "openai"
```

- 保留原自定义配置块，不作为当前活跃 provider。
- 修复后 Codex 已恢复正常使用。

## 回滚说明
- 如果将来需要对比测试，可以临时切回旧配置。
- 但本机当前最终确认可用、应长期保留的配置，仍然是：

```toml
model_provider = "openai"
```
