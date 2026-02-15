export const ROUTES = {
  home: '/pages/home/index',
  aiFace: '/pages/ai-face/index',
  aiScanning: '/pages/ai-scanning/index',
  aiDiagnosis: '/pages/ai-diagnosis/index',
  cbtiTest: '/pages/cbti-test/index',
  manualGenerating: '/pages/manual-generating/index',
  manual: '/pages/manual/index',
  hearingTest: '/pages/hearing-test/index',
  hearingRadar: '/pages/hearing-radar/index',
  pawReady: '/pages/paw-ready/index',
  pawChallenge: '/pages/paw-challenge/index',
  match: '/pages/match/index',
  matchInvite: '/pages/match-invite/index',
  sharePoster: '/pages/share-poster/index',
  archive: '/pages/archive/index',
  rankSpeed: '/pages/rank-speed/index',
  rankBeauty: '/pages/rank-beauty/index',
  me: '/pages/me/index',
} as const

export type RouteKey = keyof typeof ROUTES
