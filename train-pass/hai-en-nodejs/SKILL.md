---
name: train-pass-nodejs
description: TrainPassAPI Node.js backend implementation and debugging guide. Use for Express route/controller/service updates, service registration, auth middleware, worker tasks, and migration-linked changes with conservative edits.
---

# train-pass-nodejs

## 何时使用
- 你在 Node.js 后端 `TrainPassAPI` 的 `routes/controllers/service/models/middlewares/worker` 做改动。
- 你需要按仓库既有结构新增接口、修复链路、排查鉴权或数据问题。

## 核心约束
- 路由只负责挂载与中间件，不堆业务逻辑。
- Controller 负责参数和响应；业务逻辑放 Service。
- Service 变更要检查统一注册导出（如 service factory/index 注册）。
- 鉴权与角色校验复用现有中间件模式，不另起一套。

## 推荐执行流程
1. 先定位改动层：route/controller/service/model/middleware/worker。
2. 搜索同类接口，对齐返回格式、错误处理、分页风格。
3. 若涉及 service 改名或新服务，联动检查注册和调用方。
4. 若涉及 DB 变更，先确认是否真的需要 migration。

## 必查清单
- `route -> controller -> service` 链路是否闭环。
- service 注册导出是否完整。
- 鉴权中间件和角色限制是否对齐现有写法。
- 回调/异步任务是否影响其他入口。

## 触发示例
- `使用 train-pass-nodejs 给 approval 模块新增列表查询接口`
- `用 train-pass-nodejs 排查 route 已加但接口 500 的原因`
