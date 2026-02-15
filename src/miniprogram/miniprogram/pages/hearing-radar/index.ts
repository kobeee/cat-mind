import { hearingResult } from '../../mock'
import { backOrHome, goTo } from '../../utils/navigation'
import { StorageKeys, getStorage } from '../../utils/storage'

Component({
  data: {
    result: hearingResult,
    recordCount: 0,
  },
  lifetimes: {
    attached() {
      const records = getStorage(StorageKeys.hearingRecords)
      this.setData({ recordCount: records ? Object.keys(records).length : 0 })
    },
  },
  methods: {
    onBack() {
      backOrHome()
    },
    onRetry() {
      goTo('hearingTest')
    },
    onSharePoster() {
      goTo('sharePoster', { scene: 'hearing' })
    },
  },
})
