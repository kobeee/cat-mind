import { backOrHome, goTo } from '../../utils/navigation'
import { tapFeedback } from '../../utils/haptics'

Component({
  data: {
    tags: ['橘色花纹', '易胖体质', '鄙视链顶端', '干饭机器'],
  },
  methods: {
    onBack() {
      backOrHome()
    },
    onCbti() {
      tapFeedback()
      goTo('cbtiTest')
    },
    onSharePoster() {
      goTo('sharePoster', { scene: 'aiDiagnosis' })
    },
  },
})
