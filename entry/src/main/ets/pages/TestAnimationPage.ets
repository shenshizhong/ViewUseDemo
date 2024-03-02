@Entry
@Component
struct TestAnimationPage {
  @State message: string = 'Hello World'
  @State i : number = 0
  aboutToAppear(){
    setInterval(()=>{
      this.i = this.i + 10
      if (this.i == 150) {//这里可以让它无限循环下去
        this.i = 0
      }
    }, 200)
  }

  build() {
    Row() {
      Column() {
        //通过Image直接加载gif图，显示动画
        Image('loading/OpenHarmony.gif')
          .objectFit(ImageFit.Auto)
          .width('100%')
          .height('40%')

        Progress({value: this.i, total: 150, type: ProgressType.ScaleRing})
          .color(Color.Green)
          .value(this.i)
          .style({strokeWidth: 15, scaleCount: 15, scaleWidth: 5})
          .width(50)
          .margin({top:30})

      }
      .width('100%')
    }
    .height('100%')
  }
}