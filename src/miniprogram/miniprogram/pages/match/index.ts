import { matchData } from '../../mock'
import { backOrHome, goTo } from '../../utils/navigation'
import { tapFeedback } from '../../utils/haptics'

Component({
  data: {
    dataSource: matchData,
  },
  methods: {
    onBack() {
      backOrHome()
    },
    onInvite() {
      tapFeedback()
      goTo('matchInvite')
    },
    onAgain() {
      wx.showToast({ title: '已刷新匹配结果', icon: 'none' })
    },
    onSharePoster() {
      goTo('sharePoster', { scene: 'match' })
    },
  },
})
