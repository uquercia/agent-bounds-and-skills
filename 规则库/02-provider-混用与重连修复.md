# Provider 混用与重连修复

## 适用场景
- provider 混用
- 记忆异常或历史分裂
- 配置错乱
- `Reconnecting...`
- 桌面端和 CLI 行为不一致

## 约束
- 默认活跃 provider 必须与当前工作区主配置一致；若当前主配置是中转，则使用 `model_provider = "codex"`，不要自动切回 `openai`。
- 不要把 `openai_http` 作为长期默认配置；它只用于临时对比排查。
- 中转可以继续用，但应通过独立配置或独立工作区使用，不要和官号在同一工作区来回切换活跃 provider。
- 官号与中转不要在同一工作区来回切换 provider；这会造成记忆丢失，属于已确认的混用问题。
- 同一工作区不要在官号与中转之间混用 `model_provider`；如果必须切换，按全新会话和独立工作区处理。

## 排查顺序
- 先执行 `codex doctor`。
- 遇到 `Reconnecting...` 时，先确认是否为 `websocket connected (HTTP 101 Switching Protocols)`，不要直接禁用 WebSocket。
- 桌面端和 CLI 表现不一致时，优先排查系统代理与环境变量代理是否重复叠加。
- 当 memory 相关行为异常时，优先查看 `C:\Users\MT\.codex\skills\memory-repair\codex-provider-混用修复说明.md`。
