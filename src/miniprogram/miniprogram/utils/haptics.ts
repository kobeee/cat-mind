export const tapFeedback = () => {
  wx.vibrateShort({ type: 'light' })
}

export const successFeedback = () => {
  wx.vibrateShort({ type: 'medium' })
}
