
import LoadingComponent from '../view/LoadingComponent'
/**
 * 测试自定义的Loading
 * */
@Entry
@Component
struct TestLoadingPage {
  @State message: string = 'Hello World'
  //通过 CustomDialogController 自定义弹框
  private loadingDialog: CustomDialogController = new CustomDialogController({
    builder:  LoadingCustom(),
    alignment: DialogAlignment.Center,
    autoCancel: false,
    customStyle: true  //自定义样式，这样弹窗的宽，就能改变了。
  })

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Button('开始播放').onClick(()=>{
          this.loadingDialog.open()
          setTimeout(()=>{
            this.loadingDialog.close()
          },5000)
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}

//自定义一个dialog 的builder，控制弹窗的样式
@CustomDialog
struct LoadingCustom{
  controller: CustomDialogController;
  build(){
    Column(){
      LoadingComponent({imageWidth: 80, imageHeight: 80})
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
    .backgroundColor(Color.White)
  }
}