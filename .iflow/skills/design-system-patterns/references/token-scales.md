# Design Token Scales

## Color Palette

### Primary Colors

브랜드 메인 색상. 주요 액션, 링크, 강조에 사용.

```json
{
  "primary": {
    "50": "#EFF6FF",
    "100": "#DBEAFE",
    "200": "#BFDBFE",
    "300": "#93C5FD",
    "400": "#60A5FA",
    "500": "#3B82F6",
    "600": "#2563EB",
    "700": "#1D4ED8",
    "800": "#1E40AF",
    "900": "#1E3A8A"
  }
}
```

### Neutral Colors

텍스트, 배경, 보더에 사용.

```json
{
  "neutral": {
    "50": "#F8FAFC",
    "100": "#F1F5F9",
    "200": "#E2E8F0",
    "300": "#CBD5E1",
    "400": "#94A3B8",
    "500": "#64748B",
    "600": "#475569",
    "700": "#334155",
    "800": "#1E293B",
    "900": "#0F172A"
  }
}
```

### Semantic Colors

상태 및 피드백 색상.

```json
{
  "success": {
    "50": "#F0FDF4",
    "500": "#22C55E",
    "600": "#16A34A",
    "700": "#15803D"
  },
  "warning": {
    "50": "#FFFBEB",
    "500": "#F59E0B",
    "600": "#D97706",
    "700": "#B45309"
  },
  "error": {
    "50": "#FEF2F2",
    "500": "#EF4444",
    "600": "#DC2626",
    "700": "#B91C1C"
  },
  "info": {
    "50": "#EFF6FF",
    "500": "#3B82F6",
    "600": "#2563EB",
    "700": "#1D4ED8"
  }
}
```

## Typography Scale

### Font Sizes

Type scale based on 4px grid with 1.25 ratio:

```json
{
  "fontSize": {
    "xs": 12,
    "sm": 14,
    "base": 16,
    "lg": 18,
    "xl": 20,
    "2xl": 24,
    "3xl": 30,
    "4xl": 36,
    "5xl": 48,
    "6xl": 60
  }
}
```

### Font Weights

```json
{
  "fontWeight": {
    "normal": 400,
    "medium": 500,
    "semibold": 600,
    "bold": 700
  }
}
```

### Line Heights

```json
{
  "lineHeight": {
    "tight": 1.25,
    "normal": 1.5,
    "relaxed": 1.75
  }
}
```

### Typography Presets

미리 정의된 텍스트 스타일:

```json
{
  "typography": {
    "heading": {
      "h1": { "fontSize": 48, "fontWeight": 700, "lineHeight": 1.25 },
      "h2": { "fontSize": 36, "fontWeight": 700, "lineHeight": 1.25 },
      "h3": { "fontSize": 30, "fontWeight": 600, "lineHeight": 1.25 },
      "h4": { "fontSize": 24, "fontWeight": 600, "lineHeight": 1.25 },
      "h5": { "fontSize": 20, "fontWeight": 600, "lineHeight": 1.25 },
      "h6": { "fontSize": 18, "fontWeight": 600, "lineHeight": 1.25 }
    },
    "body": {
      "large": { "fontSize": 18, "fontWeight": 400, "lineHeight": 1.5 },
      "base": { "fontSize": 16, "fontWeight": 400, "lineHeight": 1.5 },
      "small": { "fontSize": 14, "fontWeight": 400, "lineHeight": 1.5 }
    },
    "caption": { "fontSize": 12, "fontWeight": 400, "lineHeight": 1.5 },
    "overline": { "fontSize": 12, "fontWeight": 600, "lineHeight": 1.5, "textTransform": "uppercase", "letterSpacing": 0.5 }
  }
}
```

## Spacing Scale

4px 기반 스페이싱 시스템:

```json
{
  "spacing": {
    "0": 0,
    "0.5": 2,
    "1": 4,
    "1.5": 6,
    "2": 8,
    "2.5": 10,
    "3": 12,
    "3.5": 14,
    "4": 16,
    "5": 20,
    "6": 24,
    "7": 28,
    "8": 32,
    "9": 36,
    "10": 40,
    "11": 44,
    "12": 48,
    "14": 56,
    "16": 64,
    "20": 80,
    "24": 96,
    "28": 112,
    "32": 128
  }
}
```

### 사용 가이드

| Token | Value | 용도 |
|-------|-------|------|
| 1 (4px) | 4 | 아이콘-텍스트 간격 |
| 2 (8px) | 8 | 인라인 요소 간격 |
| 3 (12px) | 12 | 작은 컴포넌트 내부 패딩 |
| 4 (16px) | 16 | 기본 컴포넌트 패딩 |
| 6 (24px) | 24 | 섹션 간 간격 |
| 8 (32px) | 32 | 큰 섹션 간격 |
| 12 (48px) | 48 | 페이지 여백 |

## Border Radius Scale

```json
{
  "radii": {
    "none": 0,
    "sm": 4,
    "md": 8,
    "lg": 12,
    "xl": 16,
    "2xl": 24,
    "full": 9999
  }
}
```

### 사용 가이드

| Token | Value | 용도 |
|-------|-------|------|
| sm | 4px | 작은 요소 (태그, 배지) |
| md | 8px | 기본 요소 (버튼, 인풋) |
| lg | 12px | 카드, 패널 |
| xl | 16px | 모달, 다이얼로그 |
| full | 9999px | 원형 요소 (아바타) |

## Shadow Scale

```json
{
  "shadows": {
    "sm": {
      "color": "rgba(0, 0, 0, 0.05)",
      "offsetX": 0,
      "offsetY": 1,
      "blur": 2,
      "spread": 0
    },
    "md": {
      "color": "rgba(0, 0, 0, 0.1)",
      "offsetX": 0,
      "offsetY": 4,
      "blur": 6,
      "spread": -1
    },
    "lg": {
      "color": "rgba(0, 0, 0, 0.1)",
      "offsetX": 0,
      "offsetY": 10,
      "blur": 15,
      "spread": -3
    },
    "xl": {
      "color": "rgba(0, 0, 0, 0.1)",
      "offsetX": 0,
      "offsetY": 20,
      "blur": 25,
      "spread": -5
    }
  }
}
```

### 사용 가이드

| Token | 용도 |
|-------|------|
| sm | 버튼, 인풋 |
| md | 카드, 드롭다운 |
| lg | 모달, 팝오버 |
| xl | 대화상자, 플로팅 요소 |

## Z-Index Scale

레이어 스태킹 순서:

```json
{
  "zIndex": {
    "base": 0,
    "dropdown": 1000,
    "sticky": 1100,
    "fixed": 1200,
    "modalBackdrop": 1300,
    "modal": 1400,
    "popover": 1500,
    "tooltip": 1600
  }
}
```

## Breakpoints

반응형 디자인 브레이크포인트:

```json
{
  "breakpoints": {
    "sm": 640,
    "md": 768,
    "lg": 1024,
    "xl": 1280,
    "2xl": 1536
  }
}
```

### 사용 가이드

| Breakpoint | Value | Device |
|------------|-------|--------|
| sm | 640px | 모바일 (가로) |
| md | 768px | 태블릿 |
| lg | 1024px | 작은 데스크톱 |
| xl | 1280px | 데스크톱 |
| 2xl | 1536px | 큰 데스크톱 |

## Complete Token Set

모든 토큰을 포함한 전체 변수 설정:

```javascript
// set_variables로 설정
mcp__pencil__set_variables({
  filePath: "design.pen",
  variables: {
    colors: { /* ... */ },
    typography: { /* ... */ },
    spacing: { /* ... */ },
    radii: { /* ... */ },
    shadows: { /* ... */ }
  }
})
```
