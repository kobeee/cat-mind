import { hearingCategories, hearingReactions, hearingSounds } from '../../mock'
import { backOrHome, goTo } from '../../utils/navigation'
import { StorageKeys, getStorage, setStorage } from '../../utils/storage'
import { tapFeedback } from '../../utils/haptics'

Component({
  data: {
    categories: hearingCategories,
    sounds: hearingSounds,
    reactions: hearingReactions,
    activeCategory: 0,
    activeSound: hearingSounds[0].id,
    showModal: false,
  },
  methods: {
    onBack() {
      backOrHome()
    },
    onPickCategory(e: WechatMiniprogram.BaseEvent) {
      const idx = Number(e.currentTarget.dataset.idx)
      this.setData({ activeCategory: idx })
    },
    onPlaySound(e: WechatMiniprogram.BaseEvent) {
      const id = String(e.currentTarget.dataset.id)
      this.setData({ activeSound: id, showModal: true })
      tapFeedback()
    },
    onPickReaction(e: WechatMiniprogram.BaseEvent) {
      const reaction = String(e.currentTarget.dataset.reaction)
      const saved = getStorage(StorageKeys.hearingRecords) || {}
      saved[this.data.activeSound] = reaction
      setStorage(StorageKeys.hearingRecords, saved)
      this.setData({ showModal: false })
      wx.showToast({ title: '反应已记录', icon: 'none' })
    },
    onCloseModal() {
      this.setData({ showModal: false })
    },
    onBuildRadar() {
      goTo('hearingRadar')
    },
    noop() {},
  },
})
