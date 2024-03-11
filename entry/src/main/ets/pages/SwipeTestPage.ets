
/**
 * 滑块视图容器，轮播显示。
 * */
@Entry
@Component
struct SwipeTestPage {
  private swipeController: SwiperController
  private data: MyDataSource = new MyDataSource([])

  aboutToAppear(){
    let list: number[] = []
    for (let index = 0; index < 10; index++) {
      list.push(index)
    }
    this.data = new MyDataSource(list)
  }

  build() {
    Column({space:5}){
      Swiper(this.swipeController){
        LazyForEach(this.data, (item: string)=>{
          Text(item.toString())
            .width('90%')
            .height(160)
            .backgroundColor(0xAFEEEE)
            .textAlign(TextAlign.Center)
            .fontSize(30)
        }, (item: string) => item)
      }
      .cachedCount(2)
      .index(1)
      .autoPlay(true)
      .interval(3000)
      .loop(true)
      .duration(1000)
      .itemSpace(0)

      Row({ space: 12 }) {
        Button('showNext')
          .onClick(() => {
            this.swipeController.showNext()
          })
        Button('showPrevious')
          .onClick(() => {
            this.swipeController.showPrevious()
          })
      }.margin(5)

    }.width('100%')
    .margin({top:5})

  }
}

/**
 * 数据源
 * */
class MyDataSource implements IDataSource{
  private list: number[] = []

  constructor(list: number[]) {
    this.list = list
  }
  totalCount():number{
    return this.list.length
  }

  getData(index: number): number{
    return this.list[index]
  }

  registerDataChangeListener(listener: DataChangeListener){
  }

  unregisterDataChangeListener(){

  }

}

