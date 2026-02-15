import { cbtiQuestions } from '../../mock'
import { backOrHome, goTo } from '../../utils/navigation'
import { tapFeedback } from '../../utils/haptics'
import { StorageKeys, getStorage, setStorage } from '../../utils/storage'

const TOTAL = cbtiQuestions.length

Component({
  data: {
    questions: cbtiQuestions,
    current: 0,
    answers: Array(TOTAL).fill(-1),
  },
  lifetimes: {
    attached() {
      const saved = getStorage(StorageKeys.cbtiAnswers)
      if (saved && saved.length === TOTAL) {
        this.setData({ answers: saved })
      }
    },
  },
  methods: {
    onBack() {
      backOrHome()
    },
    onPick(e: WechatMiniprogram.BaseEvent) {
      const idx = Number(e.currentTarget.dataset.idx)
      const updated = [...this.data.answers]
      updated[this.data.current] = idx
      this.setData({ answers: updated })
      setStorage(StorageKeys.cbtiAnswers, updated)
      tapFeedback()
    },
    onPrev() {
      if (this.data.current === 0) {
        wx.showToast({ title: '已经是第一题', icon: 'none' })
        return
      }
      this.setData({ current: this.data.current - 1 })
    },
    onNext() {
      if (this.data.answers[this.data.current] === -1) {
        wx.showToast({ title: '请选择一个选项', icon: 'none' })
        return
      }
      if (this.data.current === TOTAL - 1) {
        goTo('manualGenerating')
        return
      }
      this.setData({ current: this.data.current + 1 })
      tapFeedback()
    },
  },
})
