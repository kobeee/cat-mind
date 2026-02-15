import { backOrHome, goTo } from '../../utils/navigation'

Component({
  methods: {
    onBack() {
      backOrHome()
    },
    onSend() {
      wx.showToast({ title: '请使用右上角转发', icon: 'none' })
    },
    onSave() {
      goTo('sharePoster', { scene: 'matchInvite' })
    },
  },
})
