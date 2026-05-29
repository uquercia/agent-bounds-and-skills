# AGENTS.md（全局核心约束）

## 语言
- 默认使用中文回复、说明、总结与协作。
- 除非用户明确要求英文，或代码/协议字段必须保持英文，否则不要切换为英文输出。
- 写代码时默认添加中文注释；仅在协议字段、第三方接口名、保留字等必须英文时例外。
- `git commit` 默认使用中文提交信息。

## 高优先级技能与协作方式
- 用户要求“像 Cursor 一样做代码 Review、给风险清单、带可点击定位”时，优先使用 `codex-cursor-style` 或 `review-jump`。
- 前端页面、组件、后台界面、落地页、可视化界面美化任务，优先使用 `frontend-design`。
- 用户明确要求深度教学、逐步剖析技术原理时，可启用 `deep-teach`。
- 用户要求“先问清楚需求，再做阶段计划，再执行与验收”的规范推进时，优先使用 `spec-skill`。
- 输出代码结论或交付说明时，默认采用接近 Cursor 的方式：先结论，再风险与定位，尽量提供 `path:line`。

## 执行原则
- 优先做最小必要改动，先理解上下文，再修改代码或配置。
- 涉及删除、清理、覆盖、回滚、移动目录结构的操作，默认视为高风险操作；优先“停用、断开引用、标记废弃、备份改名”。
- 修改前先判断是否影响现有目录结构、脚本链路、部署链路和技能文件加载路径。
- 长期偏好可依赖 Codex memory；可执行流程、修复步骤、项目约束不能只依赖 memory，必须同时落到 `AGENTS.md`、`SKILL.md` 或说明文档。

## 防误删与系统保护
- 未获用户明确确认前，不删除重要文档，如 `README.md`、`AGENTS.md`、`SKILL.md`、设计文档、接口文档、迁移说明。
- 永远不删除任何 `AGENTS.md`，尤其是 `C:\Users\MT\.codex\AGENTS.md`，除非用户明确要求并再次确认。
- 未获用户明确确认前，不删除关键目录树，如 `.git`、`.codex`、`docs`、`scripts`、`src`、`config`、`migrations`、`database`、`assets`、`public`、`deploy`、`infra`。
- 未获用户明确确认前，不删除任何包含“技能、规范、脚本、部署、数据、配置、证书、密钥”语义的文件或目录。
- 严禁删除、移动、覆盖或批量清理 `C:\Windows`、`C:\Program Files`、`C:\Program Files (x86)`、`C:\ProgramData`、`C:\Users` 等系统关键目录及其内容。
- 任何删除目录树、批量删除、通配删除、覆盖式清理前，必须先列出受影响的精确路径；路径较多时先给摘要和后果说明，再等待确认。
- 未确认时，不执行 `Remove-Item -Recurse`、`del /s`、`rd /s`、`git clean`、`git reset --hard`、大范围覆盖式同步等高风险命令。
- 删除范围超出当前工作区时，默认停止并改为提供备份、改名隔离、断开引用等低风险方案。

## 同步与 Shell 约束
- 只要修改全局 `AGENTS.md`、`skills` 或 `G:\codex_skills\存档`，都要同步到 `G:\codex_skills` 对应文件或目录，并按约定提交推送。
- 默认使用 PowerShell 7（`pwsh`）执行脚本与命令；仅在明确要求兼容旧环境时才回退到 `powershell.exe`。
- 命令示例优先采用 `pwsh -NoLogo -NoProfile -Command "<command>"`。

## 按需读取规则库
- 以下场景触发时，先读取 `C:\Users\MT\.codex\规则库\00-索引.md`，再进入对应专题文档：
  - provider 混用、记忆异常、`Reconnecting...`、配置错乱
  - 项目存档、会话续接、日志留痕、项目档案维护
  - 修改全局 `AGENTS.md`、`skills`、`G:\codex_skills\存档` 后的同步、提交、推送
  - 用户要求按 Cursor 风格输出 Review 清单和 `path:line`
  - 大批量删除、跨工作区清理、目录树调整
  - 需要查看已安装本地技能清单或特定技能路径
