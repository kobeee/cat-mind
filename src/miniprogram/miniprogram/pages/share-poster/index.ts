import { posterData } from '../../mock'
import { backOrHome } from '../../utils/navigation'

Component({
  data: {
    poster: posterData,
  },
  methods: {
    onBack() {
      backOrHome()
    },
    onSave() {
      wx.showToast({ title: '海报已保存到相册（Mock）', icon: 'none' })
    },
    onSend() {
      wx.showToast({ title: '请使用右上角发送', icon: 'none' })
    },
  },
})
