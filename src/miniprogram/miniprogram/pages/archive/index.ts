import { profileCard, recordList } from '../../mock'
import { goTo } from '../../utils/navigation'

Component({
  data: {
    profile: profileCard,
    records: recordList,
  },
  methods: {
    onViewManual() {
      goTo('manual')
    },
    onOpenRecord(e: WechatMiniprogram.BaseEvent) {
      const title = String(e.currentTarget.dataset.title)
      if (title.includes('听力')) {
        goTo('hearingRadar')
        return
      }
      if (title.includes('爪速')) {
        goTo('pawChallenge')
        return
      }
      goTo('match')
    },
  },
})
