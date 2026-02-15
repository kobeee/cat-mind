import { manualData } from '../../mock'
import { backOrHome, goTo } from '../../utils/navigation'
import { successFeedback, tapFeedback } from '../../utils/haptics'

Component({
  data: {
    manual: manualData,
  },
  methods: {
    onBack() {
      backOrHome()
    },
    onSave() {
      successFeedback()
      wx.showToast({ title: '说明书已保存到档案', icon: 'none' })
    },
    onInvite() {
      tapFeedback()
      goTo('match')
    },
    onSharePoster() {
      goTo('sharePoster', { scene: 'manual' })
    },
  },
})
