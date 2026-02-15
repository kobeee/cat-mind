import { ROUTES } from './routes'

export const buildShareMessage = (title: string, imageUrl?: string): WechatMiniprogram.Page.ICustomShareContent => ({
  title,
  path: ROUTES.home,
  imageUrl: imageUrl || '',
})
