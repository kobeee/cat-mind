import { backOrHome, goTo } from '../../utils/navigation'
import { successFeedback, tapFeedback } from '../../utils/haptics'
import { StorageKeys, setStorage } from '../../utils/storage'

interface TargetDot {
  id: number
  x: number
  y: number
}

let gameTimer: number | null = null
let motionTimer: number | null = null

const createTargets = (): TargetDot[] =>
  Array.from({ length: 4 }, (_, i) => ({
    id: i + 1,
    x: 8 + Math.floor(Math.random() * 80),
    y: 8 + Math.floor(Math.random() * 72),
  }))

Component({
  data: {
    targets: createTargets(),
    totalHits: 0,
    combo: 0,
    bestCombo: 0,
    timeLeft: 15,
    finished: false,
  },
  lifetimes: {
    attached() {
      this.startGame()
    },
    detached() {
      this.stopTimers()
    },
  },
  methods: {
    startGame() {
      this.stopTimers()
      this.setData({ targets: createTargets(), totalHits: 0, combo: 0, bestCombo: 0, timeLeft: 15, finished: false })
      gameTimer = setInterval(() => {
        const next = this.data.timeLeft - 1
        if (next <= 0) {
          this.finishGame()
          return
        }
        this.setData({ timeLeft: next })
      }, 1000) as unknown as number

      motionTimer = setInterval(() => {
        if (!this.data.finished) {
          this.setData({ targets: createTargets() })
        }
      }, 650) as unknown as number
    },
    stopTimers() {
      if (gameTimer) {
        clearInterval(gameTimer)
        gameTimer = null
      }
      if (motionTimer) {
        clearInterval(motionTimer)
        motionTimer = null
      }
    },
    finishGame() {
      this.stopTimers()
      const score = Math.max(1, Math.round(this.data.totalHits * 2.5))
      setStorage(StorageKeys.pawResult, {
        totalHits: this.data.totalHits,
        bestCombo: this.data.bestCombo,
        score,
      })
      this.setData({ finished: true })
      successFeedback()
    },
    onHit() {
      if (this.data.finished) {
        return
      }
      const totalHits = this.data.totalHits + 1
      const combo = this.data.combo + 1
      const bestCombo = Math.max(combo, this.data.bestCombo)
      this.setData({ totalHits, combo, bestCombo, targets: createTargets() })
      tapFeedback()
    },
    onBack() {
      backOrHome()
    },
    onReplay() {
      this.startGame()
    },
    onSharePoster() {
      goTo('sharePoster', { scene: 'paw' })
    },
  },
})
