export interface DailyCard {
  title: string
  weather: string
  description: string
  good: string
  bad: string
}

export interface FeatureEntry {
  key: string
  title: string
  desc: string
  emoji: string
  route: string
}

export interface CbtiQuestion {
  id: number
  title: string
  options: string[]
}

export interface RankItem {
  rank: number
  name: string
  subtitle: string
  score: string
  color: string
}

export interface ManualData {
  modelTag: string
  modelName: string
  modelCode: string
  score: string
  quote: string
  specs: Array<{ label: string; value: string }>
  guideGood: string
  guideBad: string
}
