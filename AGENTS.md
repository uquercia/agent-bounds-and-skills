# AGENTS.md（全局兜底规则）

## 语言
- 默认使用中文回复、说明、总结与协作。
- 除非用户明确要求英文，或代码/协议字段必须保持英文，否则不要切换为英文输出。
- 写代码时默认添加中文注释；仅在协议字段、第三方接口名、保留字等必须英文时例外。
- `git commit` 默认使用中文提交信息。

## 技能使用优先级
- 默认优先使用 `code-mentor` 进行教学式协作、需求拆解、调试讲解和代码辅导，除非任务明确更适合其他技能。
- 当用户要“教学、带练、调试讲解、概念拆解、算法练习、代码辅导”时，优先使用 `code-mentor`。
- 当用户要求“像 Cursor 一样做代码 Review、给风险清单、带可点击定位”时，优先使用 `codex-cursor-style` 或 `review-jump`。
- 当任务是前端页面、组件、后台界面、落地页、可视化界面美化时，优先使用 `frontend-design`。
- 当任务涉及记忆异常、provider 混用、配置错乱、登录模式混用时，先阅读 `memory-repair/codex-provider-混用修复说明.md`。
- 当用户明确要深度教学、逐步剖析技术原理时，可启用 `deep-teach`。
- 当用户要做“先问清楚需求→再做阶段计划→再执行与验收”的规范化项目推进时，优先使用 `spec-skill`。
- 当任务落在海恩 train-pass Java 单体/多模块仓库时，优先使用 `train-pass-java`。
- 当任务落在海恩 TrainPassAPI Node.js 后端时，优先使用 `train-pass-nodejs`。

## 固定协作偏好
- 写代码或交付改动时，默认采用接近 Cursor 的协作方式：先给结论，再给风险与定位，尽量提供 `path:line`。
- 需要教学时，不只给答案，要优先按 `code-mentor` 的方式做引导式讲解。
- 做前端时，默认追求明确视觉方向、非模板化、避免 AI 味过重的普通界面。

## 执行原则
- 优先做最小必要改动，先理解上下文，再修改代码或配置。
- 涉及删除、清理、覆盖、回滚、移动目录结构的操作，默认视为高风险操作；优先“停用、断开引用、标记废弃、备份改名”。
- 修改前先判断是否影响现有目录结构、脚本链路、部署链路和技能文件加载路径。

## 防误删规则
- 未获用户明确确认前，不删除重要文档，如 `README.md`、`AGENTS.md`、`SKILL.md`、设计文档、接口文档、迁移说明。
- 永远不删除全局 `C:\Users\MT\.codex\AGENTS.md`，也不删除任何 `AGENTS.md`，除非用户明确要求并再次确认。
- 未获用户明确确认前，不删除关键目录树，如 `.git`、`.codex`、`docs`、`scripts`、`src`、`config`、`migrations`、`database`、`assets`、`public`、`deploy`、`infra`。
- 未获用户明确确认前，不删除任何包含“技能、规范、脚本、部署、数据、配置、证书、密钥”语义的文件或目录。

## 删除前强制检查
- 任何删除目录树、批量删除、通配删除、覆盖式清理前，必须先列出将受影响的精确路径。
- 如果路径较多，先给摘要和后果说明，再等待用户确认。
- 未确认时，不执行 `Remove-Item -Recurse`、`del /s`、`rd /s`、`git clean`、`git reset --hard`、大范围覆盖式同步等高风险命令。

## 记忆与沉淀
- 长期个人偏好优先依赖 Codex memory，例如：默认中文、Review 风格偏好、教学优先、前端风格偏好。
- 可执行流程、修复步骤、项目约束不能只依赖 memory，必须同时写入 `AGENTS.md`、`SKILL.md` 或说明文档。
- 当 memory 相关行为异常时，优先查看 `C:\Users\MT\.codex\skills\memory-repair\codex-provider-混用修复说明.md`。
- 同一工作区不要在官号与中转之间混用 `model_provider`，否则会导致 Codex 记忆和历史分裂；如果必须切换，按全新会话和独立工作区处理。

## 项目存档与续接约束
- 每次执行完一个项目任务后，必须在 `G:\codex_skills\存档` 下维护该项目的存档目录，用于防止会话丢失。
- 项目首次进入时：创建项目文件夹（建议名：`项目名` 或 `项目名_仓库名`），并创建 `项目信息.md`，至少记录：项目名称、仓库路径、技术栈、启动/构建命令、关键环境变量、当前里程碑、负责人/协作人（如有）。
- 每个工作日都要在项目目录追加或新建当日日志（建议：`YYYY-MM-DD.md`），至少记录两部分：`任务需求`、`落地情况`。
- `落地情况`必须包含：实际改动文件路径、关键命令、结果状态（完成/部分完成/阻塞）、阻塞原因与下一步。
- 如果当日无代码改动，也要记录分析结论和建议动作，保证会话中断后可快速续接。
- 会话恢复时，优先先读 `G:\codex_skills\存档\<项目文件夹>\项目信息.md` 与最近日期日志，再继续执行任务。
## 同步约束
- 只要修改全局 `AGENTS.md` 或 `skills` 相关内容，都要同步到 `G:\codex_skills` 对应文件或目录，保持两处一致。

## Provider 与重连修复约束
- 默认活跃 provider 必须与当前工作区的主配置一致；若当前主配置是中转，则使用 `model_provider = "codex"`，不要自动切回 `openai`。
- 不要把 `openai_http` 作为长期默认配置；它只能用于临时对比排查。
- 中转可以继续用，但应通过独立配置或独立工作区使用，不要和官号在同一工作区来回切换活跃 provider。
- 官号与中转不要在同一工作区来回切换 provider；这会造成记忆丢失，属于已确认的混用问题。
- 遇到 `Reconnecting...` 时，先执行 `codex doctor` 并检查是否为 `websocket connected (HTTP 101 Switching Protocols)`，不要直接禁用 WebSocket。
- 桌面端和 CLI 表现不一致时，优先排查系统代理与环境变量代理是否重复叠加。

## 已安装本地技能路径
- `C:\Users\MT\.codex\skills\code-mentor\SKILL.md`
- `C:\Users\MT\.codex\skills\review-jump\SKILL.md`
- `C:\Users\MT\.codex\skills\codex-cursor-style\SKILL.md`
- `C:\Users\MT\.codex\skills\frontend-design\SKILL.md`
- `C:\Users\MT\.codex\skills\deep-teach\SKILL.md`
- `C:\Users\MT\.codex\skills\train-pass-java\SKILL.md`
- `C:\Users\MT\.codex\skills\train-pass-nodejs\SKILL.md`
- `C:\Users\MT\.codex\skills\skill-creator-local\SKILL.md`
- `C:\Users\MT\.codex\skills\spec-skill\SKILL.md`

## 系统文件保护（强制）
- 严禁删除、移动、覆盖或批量清理系统关键目录及其内容，尤其是 `C:\Windows`、`C:\Program Files`、`C:\Program Files (x86)`、`C:\ProgramData`、`C:\Users` 下的系统与用户关键文件。
- 严禁执行可能破坏系统的高风险命令，包括但不限于：针对系统盘路径的 `Remove-Item -Recurse`、`del /s`、`rd /s`、`takeown`、`icacls /reset`、大范围通配删除或覆盖式同步。
- 未经用户明确授权且再次确认，不得对 `C:` 根目录及系统目录执行任何删除类、清空类、覆盖类操作。
- 若任务涉及清理磁盘或删除文件，默认仅允许在当前项目工作区内操作；超出工作区路径时必须先停止并征得用户确认。
- 如发现请求可能影响操作系统稳定性或用户数据安全，必须拒绝直接执行删除，并提供“停用/断开引用/备份改名”等低风险替代方案。
## 批量删除防护（强制）
- 严禁执行可能导致大量磁盘文件被删除的操作，包括但不限于：全盘/跨盘递归删除、通配符大范围删除、基于搜索结果直接批量删除、清空整目录树。
- 未经用户明确确认，不执行以下高风险命令形态：`Remove-Item -Recurse`（大路径）、`del /s`、`rd /s`、`git clean -fdx`、`forfiles` 批量删除、脚本化循环删除。
- 任何涉及“批量删除”的请求，必须先给出“将删除的精确路径清单 + 预估数量 + 不可逆后果”，并等待用户确认后才可继续。
- 即使已确认，也必须先做低风险替代：优先移动到回收站/临时备份目录/改名隔离；默认禁止直接永久删除。
- 当待删除数量较大（如超过 20 个文件或任一目录树）时，必须拆分为可回滚的小批次执行，并在每批次后复核结果。
- 只要删除范围超出当前工作区，默认拒绝执行并改为提供手动确认与备份方案。
## 技能仓库同步与推送约束
- 每次修改 `AGENTS.md` 且手动新增或调整 `skills` 内容后，必须将 `G:\codex_skills` 的最新变更提交并推送到远端仓库：`git@github.com:uquercia/agent-bounds-and-skills.git`。
- 推送前必须检查变更范围，仅提交与规则、技能、说明文档相关文件；提交信息默认使用中文，并清晰说明本次规则/技能更新内容。
- 推送完成后需在交付说明中明确：修改文件清单、每个文件的核心改动点、提交哈希与推送结果。
- 若远端不可达、鉴权失败或分支冲突，需立即说明阻塞原因，并给出可执行的后续处理步骤。
## 存档仓库提交约束
- `G:\codex_skills\存档` 目录发生新增、修改或整理后，也必须同步写入 `G:\codex_skills` 的 git 仓库并提交推送，不得只停留在本地文件系统。
- 提交信息必须明确写出本次变更属于“项目”还是“skill”，并说明涉及的具体目录或文件；例如：`更新项目存档：demo-mpxgenerator`、`更新skill：spec-skill`。
- 若本次仅调整 `存档` 内的项目记录，也要在提交信息中标明具体项目名；若是规则或技能文档变更，则标明对应 skill 名称。
- 推送前要确认变更范围，避免把无关临时文件一并提交。