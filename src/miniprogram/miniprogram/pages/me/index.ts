import { meSettings } from '../../mock'
import { StorageKeys, getStorage, removeStorage } from '../../utils/storage'

Component({
  data: {
    nickname: '铲屎官',
    userId: 'MEOW_2024_868',
    stats: [7, 3, 12],
    settings: meSettings,
  },
  pageLifetimes: {
    show() {
      const profile = getStorage(StorageKeys.userProfile)
      if (!profile) {
        return
      }
      this.setData({
        nickname: profile.nickname,
        stats: [profile.testCount, profile.badges, profile.streakDays],
      })
    },
  },
  methods: {
    onOpenSetting(e: WechatMiniprogram.BaseEvent) {
      const label = String(e.currentTarget.dataset.label)
      wx.showToast({ title: `${label}功能开发中`, icon: 'none' })
    },
    onLogout() {
      removeStorage(StorageKeys.cbtiAnswers)
      removeStorage(StorageKeys.hearingRecords)
      wx.showToast({ title: '已退出（Mock）', icon: 'none' })
    },
  },
})
