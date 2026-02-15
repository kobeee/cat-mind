import { speedList, speedTop3 } from '../../mock'
import { goTo } from '../../utils/navigation'

Component({
  data: {
    top3: speedTop3,
    list: speedList,
  },
  methods: {
    onToBeauty() {
      goTo('rankBeauty')
    },
  },
})
