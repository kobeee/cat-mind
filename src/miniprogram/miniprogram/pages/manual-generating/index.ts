import { goTo } from '../../utils/navigation'

let timer: number | null = null

Component({
  data: {
    progress: 20,
    tips: [
      '猫咪的性格在6个月左右逐渐稳定。',
      '铲屎官的互动会持续影响猫咪社交能力。',
      '规律喂养和陪玩能提升主子幸福感。',
    ],
    tipIndex: 0,
  },
  lifetimes: {
    attached() {
      timer = setInterval(() => {
        const progress = this.data.progress + 8
        const tipIndex = (this.data.tipIndex + 1) % this.data.tips.length
        if (progress >= 100) {
          if (timer) {
            clearInterval(timer)
            timer = null
          }
          this.setData({ progress: 100 })
          setTimeout(() => goTo('manual'), 320)
          return
        }
        this.setData({ progress, tipIndex })
      }, 350) as unknown as number
    },
    detached() {
      if (timer) {
        clearInterval(timer)
        timer = null
      }
    },
  },
})
