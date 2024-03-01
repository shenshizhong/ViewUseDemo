
/*
 *
 * Stack 的使用
 *
 **/

@Entry
@Component
struct StackTest {
  build() {
    Column(){

      Stack(){
        Image($r('app.media.icon'))
          .width(50)
          .height(50)

        Text('hello world')//这个控件覆盖在image上面
      }
      .width('90%')
      .border({radius: 20})
      .backgroundColor('#f00')

    }
    .width('100%')
    .alignItems(HorizontalAlign.Center)

  }
}