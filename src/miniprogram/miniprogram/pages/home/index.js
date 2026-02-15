const homeDailyCard = {
  date: '今天',
  title: '🐱 今日喵语',
  subtitle: '点击了解你的喵',
}

const homeFeatureGrid = [
  { icon: '🔮', title: 'AI喵相学', route: '/pages/ai-face/index' },
  { icon: '🧠', title: 'CBTI测试', route: '/pages/cbti-test/index' },
  { icon: '📖', title: '喵星说明书', route: '/pages/manual/index' },
  { icon: '👂', title: '喵语听力统考', route: '/pages/hearing-test/index' },
  { icon: '⚡', title: '爪速大挑战', route: '/pages/paw-ready/index' },
  { icon: '💕', title: '双猫匹配', route: '/pages/match/index' },
]

const homeMoreEntries = [
  { icon: '🏆', title: '颜值榜', route: '/pages/rank-beauty/index' },
  { icon: '⚡', title: '手速榜', route: '/pages/rank-speed/index' },
]

Component({
  data: {
    today: '',
    daily: homeDailyCard,
    features: homeFeatureGrid,
    moreEntries: homeMoreEntries,
  },
  methods: {
    onGo(e) {
      const route = e.currentTarget.dataset.route || ''
      if (!route) {
        return
      }
      wx.navigateTo({ url: route })
    },
  },
  pageLifetimes: {
    show() {
      const now = new Date()
      const months = ['一', '二', '三', '四', '五', '六', '七', '八', '九', '十', '十一', '十二']
      const month = months[now.getMonth()]
      const date = now.getDate()
      this.setData({ today: `${month}月${date}日` })
    },
  },
})
