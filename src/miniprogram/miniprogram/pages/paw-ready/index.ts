import { backOrHome, goTo } from '../../utils/navigation'
import { tapFeedback } from '../../utils/haptics'

Component({
  methods: {
    onBack() {
      backOrHome()
    },
    onStart() {
      tapFeedback()
      goTo('pawChallenge')
    },
  },
})
