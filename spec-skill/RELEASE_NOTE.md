# Release Notes

## v1.0.0 (Initial Release)

**日期**: 2026-03-29

### 🎉 新特性 (Features)
- **核心工作流同步**: 与知名开源项目 `gsd-build/get-shit-done` 的最新改进保持同步，包含最新的模板设计、`must_haves` 验证机制和优化的 Ask-Plan-Execute 工作流 (`5c6da10`)。
- **无缝互通**: 生成的规划内容（`.planning` 目录下的各类文档）与官方 Claude Code 中的 `gsd` 技能完全互通互融。
- **上下文工程**: 提供结构化的 `PROJECT.md`, `REQUIREMENTS.md`, `ROADMAP.md`, `STATE.md`, `PLAN.md` 和 `SUMMARY.md` 模板，解决大模型长上下文腐化问题。

### 📖 文档 (Documentation)
- **README 优化**: 引入原 `gsd` 项目的核心特性介绍，详细阐述了“上下文工程”机制、使用场景和核心工作流 (`653a5ab`)。
- **配置与指引更新**: 更新了项目的仓库地址为 `spec-skill` (`2d85620`)。

### 🛠 优化与重构 (Chores & Refactoring)
- **目录结构扁平化**: 优化了项目目录结构，将其扁平化到项目根目录，更便于管理和打包发布 (`687c3c2`)。
- **构建配置清理**: 将 `dist` 目录移出版本控制，并更新 `.gitignore` 保持代码仓库整洁 (`451c705`)。
