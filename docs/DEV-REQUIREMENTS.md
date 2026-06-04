# Dayone APP — iOS 开发需求文档

> 项目：Dayone — 身份驱动的习惯养成 App
> 目标平台：iOS（Flutter 跨平台）
> 给 Codex/Claude Code 的开发指引

---

## 1. 项目概述

### 1.1 核心理念
基于 **Dan Cok 的身份驱动理论**，用户不是"养成习惯"，而是"成为某种身份的人"。
- 不要"我要每天跑步" → 而是"我是一个跑者"
- 不要"我要读书" → 而是"我是一个读者"

### 1.2 技术栈
| 技术 | 版本 | 用途 |
|------|------|------|
| Flutter | 3.10+ | 跨平台框架 |
| Dart | 3.0+ | 开发语言 |
| flutter_riverpod | ^2.5.0 | 状态管理 |
| go_router | ^13.0.0 | 路由 |
| hive | ^2.2.3 | 本地存储 |
| lucide_flutter | ^0.563.0 | 图标库 |
| intl | ^0.20.2 | 国际化 |
| google_fonts | ^6.2.0 | 字体 |
| shared_preferences | ^2.2.0 | 偏好设置 |

### 1.3 项目结构
```
dayone/
├── lib/
│   ├── main.dart              # 应用入口
│   ├── core/                  # 核心层
│   │   ├── theme/             # 主题配置
│   │   ├── router/            # 路由配置
│   │   ├── constants/         # 常量
│   │   └── utils/             # 工具函数
│   ├── features/              # 功能模块
│   │   ├── identity/          # 身份模块
│   │   ├── habits/            # 习惯管理
│   │   ├── tracker/           # 进度追踪
│   │   ├── achievements/      # 成就系统
│   │   └── settings/          # 设置
│   ├── shared/                # 共享组件
│   │   ├── widgets/           # 通用组件
│   │   ├── models/            # 数据模型
│   │   └── providers/         # 全局 providers
│   └── l10n/                  # 国际化
├── assets/
│   ├── fonts/                 # 自定义字体
│   └── images/                # 图片资源
└── pubspec.yaml               # 依赖配置
```

---

## 2. 功能需求

### 2.1 身份模块（核心）
用户通过定义"身份"来驱动行为改变。

| 功能 | 说明 |
|------|------|
| 身份创建 | 用户创建身份陈述（如"我是一个跑者"）|
| 身份列表 | 展示所有已创建的身份 |
| 身份激活 | 选择当前聚焦的身份 |
| 身份编辑 | 修改身份名称和描述 |
| 数据模型 | `id`, `title`, `description`, `isActive`, `createdAt` |

### 2.2 习惯管理
每个身份下关联的习惯列表。

| 功能 | 说明 |
|------|------|
| 习惯创建 | 为身份添加习惯（如"每天跑2公里"）|
| 习惯打卡 | 每日完成打卡 |
| 打卡日历 | 月视图显示打卡记录 |
| 习惯频率 | 每日/每周/自定义 |
| 提醒通知 | 本地推送提醒 |

### 2.3 进度追踪
| 功能 | 说明 |
|------|------|
| 连续天数统计 | Streak 计数 |
| 完成率 | 日/周/月完成百分比 |
| 数据可视化 | 图表展示趋势 |

### 2.4 成就系统
| 功能 | 说明 |
|------|------|
| 成就解锁 | 里程碑触发 |
| 等级系统 | 经验值成长 |
| 庆祝动画 | confetti 特效 |

### 2.5 国际化
- 中英双语支持
- 使用 `flutter_localizations` + `intl`
- 当前已生成本地化文件

---

## 3. 设计规范

### 3.1 设计风格
- **风格**: 极简、温暖、激励性
- **参考**: Habitica 的 gamification × Day One 的极简美学
- **配色**: 柔和色调，主色为温暖的琥珀/橙色系
- **字体**: Google Fonts（已配置）

### 3.2 主题定义
```dart
// 核心颜色
primary: warm amber/orange
secondary: soft teal
background: clean white / dark mode variant
surface: card backgrounds
text: high contrast for readability
```

### 3.3 设计文件位置
```
dayone/assets/
├── images/        # 应用图片资源
├── fonts/         # 自定义图标字体（DayOneIcons.ttf）
```

### 3.4 UI 组件规范
- 卡片式布局，圆角 12-16px
- 柔和阴影，轻质感
- 按钮：圆角 20px，渐变背景
- 列表项：左图标 + 标题 + 右箭头
- 弹窗：居中模态，毛玻璃背景

---

## 4. 数据模型

### 4.1 Identity（身份）
```dart
@HiveType(typeId: 0)
class Identity extends HiveObject {
  String id;
  String title;        // "我是一个跑者"
  String description;  // 可选描述
  bool isActive;       // 当前激活
  DateTime createdAt;
  int habitCount;      // 关联习惯数
  int streak;          // 连续天数
}
```

### 4.2 Habit（习惯）
```dart
@HiveType(typeId: 1)
class Habit extends HiveObject {
  String id;
  String identityId;   // 所属身份
  String title;
  String description;
  HabitFrequency frequency; // daily/weekly
  List<DateTime> completedDates;
  TimeOfDay? reminderTime;
  bool isEnabled;
}
```

### 4.3 Achievement（成就）
```dart
@HiveType(typeId: 2)
class Achievement {
  String id;
  String title;
  String description;
  int requiredStreak;
  String iconName;
  bool unlocked;
}
```

---

## 5. 路由设计
```dart
/                    → 首页（身份列表）
/identity/new        → 创建身份
/identity/:id        → 身份详情（含习惯列表）
/identity/:id/edit   → 编辑身份
/habit/:id           → 习惯打卡详情
/habit/:id/edit      → 编辑习惯
/settings            → 设置
/achievements        → 成就页面
```

使用 `go_router` 实现，支持深度链接。

---

## 6. 现有代码状态

| 模块 | 状态 | 说明 |
|------|------|------|
| 项目脚手架 | ✅ 完成 | Flutter 项目已初始化 |
| 国际化(i18n) | ✅ 完成 | 中英文已配置 |
| 主题系统 | ✅ 基础版 | 需要进一步完善 |
| 数据模型 | ⚠️ 待完善 | 需确认 Hive 模型 |
| 身份模块 UI | ❌ 待开发 | |
| 习惯打卡 UI | ❌ 待开发 | |
| 成就系统 | ❌ 待开发 | |
| 本地通知 | ❌ 待开发 | |

---

## 7. 开发优先级

### Phase 1: 核心体验（MVP）
1. 身份 CRUD + 列表页面
2. 习惯打卡 + 日历视图
3. 本地存储（Hive）
4. 基础主题和样式

### Phase 2: 激励系统
5. Streak 统计
6. 成就/等级系统
7. 推送提醒

### Phase 3: 体验增强
8. 数据统计图表
9. 自定义主题
10. iCloud 同步

---

## 8. 开放问题

- [ ] 是否需要后端 API？目前纯本地
- [ ] iOS 推送通知证书配置
- [ ] App Store 上架准备
- [ ] 是否需要登录系统？

---

> 本文件由 H妹 整理，2026-06-05
> 基于 `D:\DAY1Project\APP\` 现有 Flutter 项目分析
