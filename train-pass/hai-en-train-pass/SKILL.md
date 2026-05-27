---
name: train-pass-java
description: Java train-pass monorepo implementation and debugging guide for management/customer/common/xxl-job modules. Use when changing controller/service/mapper/remote chains, RBAC/data-scope behavior, or cross-module integration with minimal-risk edits.
---

# train-pass-java

## 何时使用
- 你在 `management`、`customer`、`common`、`xxl-job-task` 中开发或排障。
- 需求涉及 `controller/api -> service -> mapper/remote` 链路联动。
- 涉及 RBAC、数据权限、组织/用户/员工、双端同步逻辑。

## 核心约束
- 保持最小改动，优先复用现有实现模式。
- 不跨业务域直接互调 Mapper；跨域走远程或协调层。
- `@Transactional` 放在 Service 层。
- 不手写拼接 SQL，不引入无关重构。

## 推荐执行流程
1. 先确认归属模块与影响面（management/customer/公共模块）。
2. 搜索同类实现并对齐返回结构、命名、异常风格。
3. 再落地改动，检查接口/实现/DTO/VO/Mapper 是否需要联动。
4. 对 RBAC/数据权限问题，先区分功能权限与数据范围过滤层。

## 必查清单
- Service 接口与实现是否一致。
- Remote 调用契约是否同步。
- Converter/Assembler 映射字段是否完整。
- 双端镜像逻辑是否需要同步修改。

## 触发示例
- `使用 train-pass-java 帮我改 management 的分页查询并补全 mapper 字段`
- `用 train-pass-java 排查 employee 接口 403 是权限还是数据范围问题`
