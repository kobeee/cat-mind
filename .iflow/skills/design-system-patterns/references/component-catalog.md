# Component Catalog

디자인 시스템에서 자주 사용되는 공통 컴포넌트 패턴 카탈로그.

## Buttons

### Primary Button

```javascript
button=I(document, {
  type: "frame",
  name: "Button/Primary",
  reusable: true,
  layout: "horizontal",
  padding: [12, 24, 12, 24],
  alignItems: "center",
  justifyContent: "center",
  gap: 8,
  fill: "var(colors/primary/500)",
  cornerRadius: "var(radii/md)"
})
iconSlot=I(button, {
  type: "frame",
  name: "iconSlot",
  width: 20,
  height: 20,
  placeholder: true
})
label=I(button, {
  type: "text",
  name: "label",
  content: "Button",
  fontSize: "var(typography/fontSize/base)",
  fontWeight: "var(typography/fontWeight/medium)",
  textColor: "#FFFFFF"
})
```

### Secondary Button

```javascript
button=I(document, {
  type: "frame",
  name: "Button/Secondary",
  reusable: true,
  layout: "horizontal",
  padding: [12, 24, 12, 24],
  alignItems: "center",
  justifyContent: "center",
  gap: 8,
  fill: "transparent",
  stroke: "var(colors/primary/500)",
  strokeWidth: 1,
  cornerRadius: "var(radii/md)"
})
label=I(button, {
  type: "text",
  name: "label",
  content: "Button",
  fontSize: "var(typography/fontSize/base)",
  fontWeight: "var(typography/fontWeight/medium)",
  textColor: "var(colors/primary/500)"
})
```

### Ghost Button

```javascript
button=I(document, {
  type: "frame",
  name: "Button/Ghost",
  reusable: true,
  layout: "horizontal",
  padding: [12, 24, 12, 24],
  alignItems: "center",
  justifyContent: "center",
  gap: 8,
  fill: "transparent",
  cornerRadius: "var(radii/md)"
})
label=I(button, {
  type: "text",
  name: "label",
  content: "Button",
  fontSize: "var(typography/fontSize/base)",
  fontWeight: "var(typography/fontWeight/medium)",
  textColor: "var(colors/primary/500)"
})
```

## Form Elements

### Input Field

```javascript
field=I(document, {
  type: "frame",
  name: "InputField",
  reusable: true,
  layout: "vertical",
  gap: 8,
  width: "fill_container"
})
label=I(field, {
  type: "text",
  name: "label",
  content: "Label",
  fontSize: "var(typography/fontSize/sm)",
  fontWeight: "var(typography/fontWeight/medium)",
  textColor: "var(colors/neutral/700)"
})
input=I(field, {
  type: "frame",
  name: "input",
  layout: "horizontal",
  width: "fill_container",
  height: 44,
  padding: [0, 16, 0, 16],
  alignItems: "center",
  fill: "#FFFFFF",
  stroke: "var(colors/neutral/300)",
  strokeWidth: 1,
  cornerRadius: "var(radii/md)"
})
placeholder=I(input, {
  type: "text",
  name: "placeholder",
  content: "Enter value...",
  fontSize: "var(typography/fontSize/base)",
  textColor: "var(colors/neutral/400)"
})
helperText=I(field, {
  type: "text",
  name: "helperText",
  content: "",
  fontSize: "var(typography/fontSize/xs)",
  textColor: "var(colors/neutral/500)"
})
```

### Select

```javascript
select=I(document, {
  type: "frame",
  name: "Select",
  reusable: true,
  layout: "vertical",
  gap: 8,
  width: "fill_container"
})
label=I(select, {
  type: "text",
  name: "label",
  content: "Label",
  fontSize: "var(typography/fontSize/sm)",
  fontWeight: "var(typography/fontWeight/medium)"
})
trigger=I(select, {
  type: "frame",
  name: "trigger",
  layout: "horizontal",
  width: "fill_container",
  height: 44,
  padding: [0, 16, 0, 16],
  alignItems: "center",
  justifyContent: "space-between",
  fill: "#FFFFFF",
  stroke: "var(colors/neutral/300)",
  strokeWidth: 1,
  cornerRadius: "var(radii/md)"
})
value=I(trigger, {
  type: "text",
  name: "value",
  content: "Select option...",
  textColor: "var(colors/neutral/400)"
})
chevron=I(trigger, {
  type: "text",
  name: "chevron",
  content: "▼",
  fontSize: 12,
  textColor: "var(colors/neutral/400)"
})
```

### Checkbox

```javascript
checkbox=I(document, {
  type: "frame",
  name: "Checkbox",
  reusable: true,
  layout: "horizontal",
  gap: 12,
  alignItems: "center"
})
box=I(checkbox, {
  type: "frame",
  name: "box",
  width: 20,
  height: 20,
  fill: "#FFFFFF",
  stroke: "var(colors/neutral/300)",
  strokeWidth: 1,
  cornerRadius: 4
})
label=I(checkbox, {
  type: "text",
  name: "label",
  content: "Checkbox label",
  fontSize: "var(typography/fontSize/base)"
})
```

## Cards

### Basic Card

```javascript
card=I(document, {
  type: "frame",
  name: "Card",
  reusable: true,
  layout: "vertical",
  width: 320,
  padding: 24,
  gap: 16,
  fill: "#FFFFFF",
  cornerRadius: "var(radii/lg)"
})
title=I(card, {
  type: "text",
  name: "title",
  content: "Card Title",
  fontSize: "var(typography/fontSize/lg)",
  fontWeight: "var(typography/fontWeight/semibold)"
})
description=I(card, {
  type: "text",
  name: "description",
  content: "Card description text...",
  textColor: "var(colors/neutral/600)"
})
actionsSlot=I(card, {
  type: "frame",
  name: "actionsSlot",
  layout: "horizontal",
  gap: 12,
  placeholder: true
})
```

### Card with Image

```javascript
card=I(document, {
  type: "frame",
  name: "Card/Image",
  reusable: true,
  layout: "vertical",
  width: 320,
  fill: "#FFFFFF",
  cornerRadius: "var(radii/lg)",
  clipContent: true
})
mediaSlot=I(card, {
  type: "frame",
  name: "mediaSlot",
  width: "fill_container",
  height: 180,
  fill: "var(colors/neutral/100)",
  placeholder: true
})
content=I(card, {
  type: "frame",
  name: "content",
  layout: "vertical",
  padding: 24,
  gap: 12
})
title=I(content, {
  type: "text",
  name: "title",
  content: "Card Title",
  fontSize: "var(typography/fontSize/lg)",
  fontWeight: "var(typography/fontWeight/semibold)"
})
description=I(content, {
  type: "text",
  name: "description",
  content: "Description...",
  textColor: "var(colors/neutral/600)"
})
```

## Navigation

### Nav Item

```javascript
navItem=I(document, {
  type: "frame",
  name: "NavItem",
  reusable: true,
  layout: "horizontal",
  padding: [12, 16, 12, 16],
  gap: 12,
  alignItems: "center",
  cornerRadius: "var(radii/md)"
})
iconSlot=I(navItem, {
  type: "frame",
  name: "iconSlot",
  width: 20,
  height: 20,
  placeholder: true
})
label=I(navItem, {
  type: "text",
  name: "label",
  content: "Menu Item",
  fontSize: "var(typography/fontSize/base)"
})
```

### Tab

```javascript
tab=I(document, {
  type: "frame",
  name: "Tab",
  reusable: true,
  layout: "horizontal",
  padding: [12, 24, 12, 24],
  alignItems: "center",
  justifyContent: "center"
})
label=I(tab, {
  type: "text",
  name: "label",
  content: "Tab",
  fontSize: "var(typography/fontSize/base)",
  fontWeight: "var(typography/fontWeight/medium)"
})
```

## Feedback

### Badge

```javascript
badge=I(document, {
  type: "frame",
  name: "Badge",
  reusable: true,
  layout: "horizontal",
  padding: [4, 12, 4, 12],
  alignItems: "center",
  justifyContent: "center",
  fill: "var(colors/primary/100)",
  cornerRadius: "var(radii/full)"
})
label=I(badge, {
  type: "text",
  name: "label",
  content: "Badge",
  fontSize: "var(typography/fontSize/xs)",
  fontWeight: "var(typography/fontWeight/medium)",
  textColor: "var(colors/primary/700)"
})
```

### Alert

```javascript
alert=I(document, {
  type: "frame",
  name: "Alert",
  reusable: true,
  layout: "horizontal",
  padding: 16,
  gap: 12,
  alignItems: "start",
  fill: "var(colors/info/50)",
  stroke: "var(colors/info/200)",
  strokeWidth: 1,
  cornerRadius: "var(radii/md)"
})
iconSlot=I(alert, {
  type: "frame",
  name: "iconSlot",
  width: 20,
  height: 20,
  placeholder: true
})
content=I(alert, {
  type: "frame",
  name: "content",
  layout: "vertical",
  gap: 4,
  width: "fill_container"
})
title=I(content, {
  type: "text",
  name: "title",
  content: "Alert Title",
  fontSize: "var(typography/fontSize/base)",
  fontWeight: "var(typography/fontWeight/medium)"
})
message=I(content, {
  type: "text",
  name: "message",
  content: "Alert message...",
  fontSize: "var(typography/fontSize/sm)",
  textColor: "var(colors/neutral/600)"
})
```

### Avatar

```javascript
avatar=I(document, {
  type: "frame",
  name: "Avatar",
  reusable: true,
  width: 40,
  height: 40,
  fill: "var(colors/neutral/200)",
  cornerRadius: "var(radii/full)",
  alignItems: "center",
  justifyContent: "center"
})
initials=I(avatar, {
  type: "text",
  name: "initials",
  content: "AB",
  fontSize: "var(typography/fontSize/sm)",
  fontWeight: "var(typography/fontWeight/medium)",
  textColor: "var(colors/neutral/600)"
})
```

## Usage

컴포넌트 인스턴스 생성:

```javascript
// 버튼 인스턴스
btn=I("formId", { type: "ref", ref: "Button/Primary" })
U(btn+"/label", { content: "Submit" })

// 인풋 필드 인스턴스
input=I("formId", { type: "ref", ref: "InputField" })
U(input+"/label", { content: "Email" })
U(input+"/placeholder", { content: "Enter your email" })

// 카드 인스턴스
card=I("gridId", { type: "ref", ref: "Card/Image" })
U(card+"/title", { content: "Product Name" })
U(card+"/description", { content: "Product description..." })
G(card+"/mediaSlot", "stock", "product photography")
```
