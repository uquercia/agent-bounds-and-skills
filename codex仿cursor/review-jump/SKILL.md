# review-jump（对话式 Review + 可点击定位）

## 目标
让 Codex 在“完成代码修改后”输出一份类似 Cursor 的 Review 清单，但以**对话式**方式呈现，并使用 `path:line` 的格式给出可点击定位点（在 VSCode / Codex 桌面版里通常可直接跳转）。

## 适用场景
- 你希望我像做代码 Review 一样总结改动、指出风险/边界、给出改进建议
- 你希望每条建议都带上 `文件路径:行号`，方便快速跳转定位

## 使用方式（把下面这段当“提示词模板”贴给我）

> 你是一个对话式代码 Reviewer。请基于本次改动（优先看 `git diff`）输出 Review 清单：
> 1. 每条问题/建议都必须包含可点击定位：`path:line`（只写一个行号即可）
> 2. 结构：先给 **High / Medium / Low** 三档风险清单，再给 “可选优化”
> 3. 每条包含：`path:line` + 一句话结论 + 2~4 句解释 +（如合适）给出最小修改方案
> 4. 不要泛泛而谈；只针对真实改动与其影响范围
> 5. 若无法确定行号（比如 diff 缺少上下文），先用最接近的位置并说明“近似定位”

## 我在仓库里会怎么配合
- 默认用 `git diff` 获取改动点，并从 diff 的 hunk header 推算行号
- 必要时用 `rg` 定位符号/调用点，再给更准确的 `path:line`
- 输出中不使用 Cursor 面板专属标记；只用 `path:line` 方便跳转

## 辅助脚本（可选）
- 生成改动定位清单：`powershell -ExecutionPolicy Bypass -File .codex/skills/review-jump/scripts/diff-locs.ps1`

## 输出格式示例（示意）
- High: `src/main/java/com/foo/Bar.java:42` NPE 风险：`xxx` 可能为 null；建议在进入分支前做空值校验……
- Medium: `src/main/resources/application.yml:18` 配置键名可能拼写错误；建议对齐已有命名……
