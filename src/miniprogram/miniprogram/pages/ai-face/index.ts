import { backOrHome, goTo } from '../../utils/navigation'
import { tapFeedback } from '../../utils/haptics'

Component({
  data: {
    imagePath: '',
    scanPercent: 78,
    tags: ['易胖体质', '干饭机器'],
  },
  methods: {
    onBack() {
      backOrHome()
    },
    onPick() {
      wx.chooseMedia({
        count: 1,
        mediaType: ['image'],
        sourceType: ['album', 'camera'],
        success: (res) => {
          const file = res.tempFiles[0]
          this.setData({ imagePath: file.tempFilePath })
          tapFeedback()
        },
      })
    },
    onStart() {
      if (!this.data.imagePath) {
        wx.showToast({ title: '请先上传猫咪照片', icon: 'none' })
        return
      }
      tapFeedback()
      goTo('aiScanning')
    },
  },
})
