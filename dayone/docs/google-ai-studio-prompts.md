# DayOne - Google AI Studio 提示词集合

**版本**: v0.1
**日期**: 2026-02-04
**模型**: Gemini 2.0 Flash / Gemini 1.5 Pro

---

## 使用说明

1. 打开: https://aistudio.google.com
2. 选择 **Gemini 2.0 Flash** (推荐)
3. Temperature: **0.7-1.0**
4. Language: **English**
5. 复制下方提示词粘贴使用

---

## 目录

- [1️⃣ 整体风格定义](#1️⃣-整体风格定义)
- [2️⃣ dan cok 理论介绍页](#2️⃣-dan-cok-理论介绍页)
- [3️⃣ 首次引导（4步问题）](#3️⃣-首次引导4步问题)
- [4️⃣ 每日选择页面](#4️⃣-每日选择页面)
- [5️⃣ 游戏化系统](#5️⃣-游戏化系统)
- [6️⃣ 进度追踪页面](#6️⃣-进度追踪页面)
- [7️⃣ 成就弹窗组件](#7️⃣-成就弹窗组件)

---

## 1️⃣ 整体风格定义

```
Design the complete UI/UX style system for a self-improvement habit app called "DayOne".

Style Reference: quittr (minimalist, focus-driven habit tracker)

REQUIREMENTS:

Color Palette:
- Background: Deep Black #0D0D0D
- Surface: Dark Gray #1A1A1A
- Primary Accent: Warm Amber/Gold #F59E0B
- Secondary Accent: Soft Coral #F97316
- Text Primary: White #FFFFFF
- Text Secondary: Light Gray #A1A1AA
- Success Green: #22C55E

Typography:
- Headline: ExtraBold, large, impactful
- Body: Regular, readable, comfortable line height
- Numbers: Bold, prominent (streak counter)

Design Principles:
- Minimalist, no distractions
- Lots of whitespace
- Large typography for key messages
- Single focus per screen
- Smooth, subtle animations
- Emotional connection through design

SHOW ME:
1. Main dashboard with:
   - Large streak counter ("7 DAYS")
   - Circular XP progress ring
   - Today's identity question
   - Big check-in button

2. Navigation style:
   - Bottom nav bar
   - Simple icons
   - Active state indicator

3. Card components:
   - Daily question card
   - Achievement badge
   - Progress stat card

Return: Detailed design specs with color codes, typography hierarchy, and layout structure.
```

---

## 2️⃣ dan cok 理论介绍页

```
Create a Flutter page for DayOne - the theoretical introduction explaining identity-driven change.

Core Philosophy: "Identity drives behavior, not willpower"

CONTENT STRUCTURE:

Screen 1 - Emotional Hook:
Title: "Tried to 'change' but always fail?"
Subtitle: "Gym memberships. Side hustles. Early mornings. Giving up after a few days."

Screen 2 - The Problem:
Title: "The root problem isn't willpower"
Body: "It's your 'identity'"
Insight: "Your behaviors are a reflection of who you believe you are"

Screen 3 - The Solution:
Title: "Identity drives behavior"
Subtitle: "Not willpower"
Key Point: "When you change who you believe you are, your behaviors naturally follow"

Screen 4 - Call to Action:
Title: "Start with Day One"
Button: "Start Exploring" (large, prominent)

STYLE REQUIREMENTS:
- Dark theme (#0D0D0D background)
- Minimalist, quittr-style
- Large, emotional typography
- Smooth scroll between sections
- Warm amber accent (#F59E0B)
- Lots of whitespace
- Subtle fade-in animations

Return: Complete Flutter widget code with this 4-section introduction page.
```

---

## 3️⃣ 首次引导（4步问题）

```
Design Flutter onboarding flow for DayOne - 4 core identity questions.

CONTEXT:
User is defining their identity through 4 questions.
Reference: quittr's one-question-at-a-time approach.

THE 4 QUESTIONS:

1. Vision Setting
Question: "Who do you want to become in 3 years?"
Hint: "Imagine a specific person, not an abstract goal"
Input: Text field (multi-line)

2. Daily Behaviors
Question: "What does that person do every day?"
Hint: "Daily actions define identity"
Input: Text field (multi-line)

3. Identity Trade-offs
Question: "What do you need to give up to become them?"
Hint: "What no longer fits who you're becoming?"
Input: Text field (multi-line)

4. Declaration
Question: "Write your declaration"
Prefix: "I am the type of person who..."
Hint: "This is your identity anchor"
Input: Large text field, prominent

LAYOUT:
- Progress indicator: "1/4", "2/4", etc.
- Large question number
- Big, bold question text
- Large text input with dark background
- Smooth "Next" button (amber #F59E0B)
- Bottom navigation
- Keyboard-aware scrolling

ANIMATIONS:
- Smooth fade-in for each question
- Slide transition between questions
- Success pulse when completing

Return: Complete Flutter widget code for this 4-step onboarding flow.
```

---

## 4️⃣ 每日选择页面

```
Design Flutter page for DayOne - daily identity selection flow.

USER FLOW:
1. User opens app
2. Sees: "Who do you want to be today?"
3. Selects from their declaration
4. Chooses 1-3 key actions
5. Clicks big check-in button

UI COMPONENTS:

Header:
- Greeting with time-based message
  - Morning: "Good Morning"
  - Afternoon: "Good Afternoon"
  - Evening: "Good Evening"
- Streak counter: "🔥 7 DAYS"

Main Question:
- Large text: "Who do you want to be today?"
- Subtle reminder of their identity declaration

Declaration Card:
- Shows their declaration
- "I am the type of person who..."
- Collapsible/expandable

Action Selector:
- 1-3 action items
- Checkbox style selection
- XP value shown per action

Check-in Button:
- Large, prominent button
- Amber gradient (#F59E0B → #F97316)
- Confetti animation on tap
- "CHECK IN" text

STYLE:
- Dark theme (#0D0D0D)
- Minimalist, focused
- Large tap targets
- Smooth micro-interactions
- Celebration animation on completion

Return: Complete Flutter widget code for daily flow.
```

---

## 5️⃣ 游戏化系统

```
Design Flutter gamification system for DayOne habit app.

COMPONENTS:

1. XP System Display:
- XP counter (top right)
- Current Level: "LEVEL 5"
- XP Progress bar (100XP per level)
- XP gained per action (+10 XP)
- Daily completion bonus (+50 XP)

2. Level Badge:
- Circular badge design
- Large number (5)
- Subtle glow effect
- Level title (optional)
- Unlocked at: 100XP, 500XP, 1000XP, etc.

3. Achievement System:
Achievement Types:
- "Identity Awakening" - Complete onboarding
- "7 Day Streak" - 7 consecutive days
- "30 Day Streak" - 30 consecutive days
- "Declaration Keeper" - 7 days of actions
- "Early Bird" - Check in before 8AM
- "Night Owl" - Complete evening reflection

Badge Design:
- Minimalist icon style
- Locked state: Grayed out
- Unlocked state: Gold/amber glow
- Notification popup when earned

4. Streak Counter:
- Large flame icon 🔥
- Bold number (7)
- "DAYS" label
- Personal best highlight

STYLE:
- Dark theme
- Gold/amber accent (#F59E0B)
- Smooth animations
- Confetti on achievement unlock
- Subtle glow effects
- No clutter

Return: Complete Flutter widget code showing XP, levels, achievements, and streak display.
```

---

## 6️⃣ 进度追踪页面

```
Design Flutter progress screen for DayOne habit app.

SECTIONS:

1. Weekly Overview:
- 7-day horizontal grid
- Each day shows:
  - Check-in status (✓ or empty)
  - XP earned
  - Streak indicator
- Current day highlighted

2. Monthly Calendar View:
- Full month calendar
- Color-coded days:
  - Green: Complete
  - Gray: Not started
  - Amber: Partial
- Month name prominent

3. Statistics Cards:
Grid layout with:
- Current Streak: "7 DAYS" (large flame icon)
- Total XP: "2,450"
- Level: "LEVEL 5" (badge)
- Best Streak: "14 DAYS"
- This Week: "+350 XP"
- Completion Rate: "95%"

4. Achievements Section:
- Horizontal scroll
- 3-4 achievement badges
- Locked vs unlocked states
- "View All" button

5. Level Progress:
- Circular XP ring
- "350 / 500 XP"
- "Level 6 in 2 days"

STYLE:
- Dark theme (#0D0D0D)
- Minimalist cards
- Large numbers
- Warm amber accents
- Smooth scroll
- No clutter

Return: Complete Flutter widget code for progress page.
```

---

## 7️⃣ 成就弹窗组件

```
Design Flutter achievement unlock popup for DayOne.

TRIGGER: User earns an achievement

ANIMATION SEQUENCE:
1. Scale up from center (elastic bounce)
2. Confetti burst effect
3. Glow pulse
4. Sound effect (optional, commented out)

POPUP LAYOUT:

Background:
- Dark overlay (70% opacity)
- Rounded corners (24px)
- Smooth scale-in

Icon Area:
- Large achievement badge (80x80)
- Gold gradient border
- Subtle glow behind

Text Area:
- "ACHIEVEMENT UNLOCKED" (small, amber)
- Achievement Name (large, bold white)
- Description (medium, light gray)

Button:
- "AWESOME!" or "CONTINUE"
- Amber gradient background
- Tap to dismiss

ACHIEVEMENT EXAMPLES:
- "Identity Awakening" - Completed your first declaration
- "7 Day Warrior" - 7 day streak achieved
- "Early Bird" - Checked in before 7AM
- "Consistency King" - 30 day streak

STYLE:
- Dark theme
- Gold/amber accents
- Celebration energy
- Smooth easing animations
- Mobile-optimized size (width: 320px)

Return: Complete Flutter widget code for achievement popup with animation.
```

---

## 快速选择指南

| 序号 | 页面/组件 | 优先级 | 预计生成代码量 |
|------|----------|--------|---------------|
| 1 | 整体风格定义 | P0 | 风格指南 |
| 2 | 理论介绍页 | P0 | ~200行 |
| 3 | 首次引导 | P0 | ~300行 |
| 4 | 每日选择 | P0 | ~250行 |
| 5 | 游戏化系统 | P1 | ~300行 |
| 6 | 进度页面 | P1 | ~250行 |
| 7 | 成就弹窗 | P1 | ~150行 |

---

## 建议执行顺序

```
1. 整体风格定义 (先定基调)
2. 理论介绍页 (核心hook)
3. 首次引导 (核心功能)
4. 每日选择 (核心闭环)
5. 游戏化系统 (留存增强)
6. 进度追踪 (数据展示)
7. 成就弹窗 (反馈机制)
```

---

*文档版本: v0.1 | 最后更新: 2026-02-04*
