import { relaunchTo } from '../../utils/navigation'

const routeByTab = {
  home: 'home',
  archive: 'archive',
  ranking: 'rankSpeed',
  me: 'me',
} as const

type TabKey = keyof typeof routeByTab

Component({
  properties: {
    active: {
      type: String,
      value: 'home',
    },
  },
  methods: {
    onTap(e: WechatMiniprogram.BaseEvent) {
      const { key } = e.currentTarget.dataset as { key: TabKey }
      if (!key || key === this.data.active) {
        return
      }
      relaunchTo(routeByTab[key])
    },
  },
})
