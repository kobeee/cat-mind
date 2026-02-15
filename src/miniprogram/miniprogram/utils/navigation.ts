import { ROUTES, type RouteKey } from './routes'

export const goTo = (key: RouteKey, query?: Record<string, string | number>) => {
  const route = ROUTES[key]
  const suffix = query
    ? `?${Object.keys(query)
        .map((k) => `${k}=${encodeURIComponent(String(query[k]))}`)
        .join('&')}`
    : ''
  wx.navigateTo({ url: `${route}${suffix}` })
}

export const relaunchTo = (key: RouteKey) => {
  wx.reLaunch({ url: ROUTES[key] })
}

export const backOrHome = () => {
  const pages = getCurrentPages()
  if (pages.length > 1) {
    wx.navigateBack()
    return
  }
  wx.reLaunch({ url: ROUTES.home })
}
