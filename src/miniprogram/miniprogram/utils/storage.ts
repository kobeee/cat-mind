const KEYS = {
  cbtiAnswers: 'cbti_answers_v1',
  hearingRecords: 'hearing_records_v1',
  pawResult: 'paw_result_v1',
  userProfile: 'user_profile_v1',
} as const

type ValueMap = {
  [KEYS.cbtiAnswers]: number[]
  [KEYS.hearingRecords]: Record<string, string>
  [KEYS.pawResult]: { totalHits: number; bestCombo: number; score: number }
  [KEYS.userProfile]: { nickname: string; testCount: number; badges: number; streakDays: number }
}

export const getStorage = <T extends keyof ValueMap>(key: T): ValueMap[T] | null => {
  const value = wx.getStorageSync(key)
  return value ? (value as ValueMap[T]) : null
}

export const setStorage = <T extends keyof ValueMap>(key: T, value: ValueMap[T]) => {
  wx.setStorageSync(key, value)
}

export const removeStorage = <T extends keyof ValueMap>(key: T) => {
  wx.removeStorageSync(key)
}

export const StorageKeys = KEYS
