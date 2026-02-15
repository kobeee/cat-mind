import { beautyList, beautyTop3 } from '../../mock'
import { backOrHome } from '../../utils/navigation'

Component({
  data: {
    top3: beautyTop3,
    list: beautyList,
  },
  methods: {
    onToSpeed() {
      wx.navigateBack({
        fail() {
          wx.reLaunch({ url: '/pages/rank-speed/index' })
        },
      })
    },
    onBack() {
      backOrHome()
    },
  },
})
