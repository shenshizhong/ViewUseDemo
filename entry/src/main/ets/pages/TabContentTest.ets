
import FaultLogger from '@ohos.faultLogger'
/**
 * TabContent 使用
 * */
@Entry
@Component
struct TabContentTest {
  //声明一些属性
  @State fontColor: string = '#182431'
  @State selectedFontColor: string = '#007DFF'
  @State currentIndex: number = 0
  private controller: TabsController = new TabsController()

  @Builder TabBuilder(index: number){
    Column(){
      Image(this.currentIndex === index ? $r('app.media.phone') : $r('app.media.pwd'))
        .width(24)
        .height(24)
        .margin({bottom: 4})
        .objectFit(ImageFit.Contain)

      Text(`Tab${index + 1}`)
        .fontColor(this.currentIndex === index ? this.selectedFontColor: this.fontColor)
        .fontSize(10)
        .fontWeight(500)
        .lineHeight(14)
    }.width('100%')
  }


  build() {
    Column(){
      Blank().layoutWeight(1)
      //这里开始实现tab
      Tabs({barPosition: BarPosition.End, controller: this.controller}){
        //第一个tab
        TabContent(){//包含两部分，一个是上面content 和 下面tab
          Column(){
            Text('Tab1')
              .fontSize(36)
              .fontColor('#182431')
              .fontWeight(500)
              .opacity(0.4) //不透明度
              .margin({top: 30, bottom: 56.5})

            Divider()    //这个地方是加一个间隔线
              .strokeWidth(14)
              .color('#f00')
              .opacity(0.05)
          }.width('100%')
        }.tabBar(this.TabBuilder(0))

        //第二个tab
        TabContent(){
          Column(){
            Text('Tab2')
              .fontSize(36)
              .fontColor('#182431')
              .fontWeight(500)
              .opacity(0.4)
              .margin({top: 30, bottom: 56.5})
            Divider()
              .strokeWidth(0.5)
              .color('#182431')
              .opacity(0.05)
          }.width('100%')
        }.tabBar(this.TabBuilder(1))


      }
      .vertical(false) //tab是否是竖直方向的
      .barHeight(56) //TabBar 的高度。
      .onChange((index: number) => { //点击tab的监听事件
        this.currentIndex = index
        console.log('当前点击的位置： ' + index)

      })
      .width('100%')
      .height(190)//顶部加tab，整块的高度
      .backgroundColor('#F1F3F5')
      .margin({top: 38})
    }.width('100%')
  }
}