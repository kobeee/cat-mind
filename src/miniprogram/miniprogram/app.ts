import { StorageKeys, getStorage, setStorage } from './utils/storage'

App<IAppOption>({
  globalData: {
    userInfo: undefined,
  },
  onLaunch() {
    const profile = getStorage(StorageKeys.userProfile)
    if (!profile) {
      setStorage(StorageKeys.userProfile, {
        nickname: '铲屎官',
        testCount: 7,
        badges: 3,
        streakDays: 12,
      })
    }
  },
})
