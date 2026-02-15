import { backOrHome, goTo } from '../../utils/navigation'

let timer: number | null = null

Component({
  data: {
    progress: 18,
    steps: ['花色识别完成', '瞳孔分析完成', '面相评分计算中...'],
  },
  lifetimes: {
    attached() {
      timer = setInterval(() => {
        const next = this.data.progress + 6
        if (next >= 100) {
          if (timer) {
            clearInterval(timer)
            timer = null
          }
          this.setData({ progress: 100 })
          setTimeout(() => goTo('aiDiagnosis'), 280)
          return
        }
        this.setData({ progress: next })
      }, 260) as unknown as number
    },
    detached() {
      if (timer) {
        clearInterval(timer)
        timer = null
      }
    },
  },
  methods: {
    onBack() {
      backOrHome()
    },
  },
})
