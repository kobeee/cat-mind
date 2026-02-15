import { ROUTES } from '../utils/routes'
import type { DailyCard, FeatureEntry } from './types'

export const homeDailyCard: DailyCard = {
  title: '今日猫历',
  weather: '🌧️ 雨天 · 气压低',
  description: '您的【怂包型】主子可能电量不足',
  good: '躲在纸箱里、喂冻干',
  bad: '吸尘器、强行抱抱',
}

export const homeFeatureGrid: FeatureEntry[] = [
  { key: 'aiFace', title: 'AI喵相学', desc: '面相速测', emoji: '🌞', route: ROUTES.aiFace },
  { key: 'cbti', title: 'CBTI测试', desc: '性格深度分析', emoji: '🧡', route: ROUTES.cbtiTest },
  { key: 'hearing', title: '喵语听力', desc: '听觉敏感度测试', emoji: '✨', route: ROUTES.hearingTest },
  { key: 'paw', title: '爪速挑战', desc: '反应速度测试', emoji: '☀️', route: ROUTES.pawReady },
]

export const homeMoreEntries: FeatureEntry[] = [
  { key: 'match', title: '双猫匹配', desc: '测测缘分', emoji: '💞', route: ROUTES.match },
]
