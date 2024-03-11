@Entry
@Component
struct SearchPage {
  @State changeValue: string = ''
  @State submitValue: string = ''
  controller: SearchController = new SearchController();

  build() {
    Column(){
      Text('搜索值: ' + this.submitValue).fontSize(18).margin(15)
      Text('输入值:' + this.changeValue).fontSize(18).margin(15)

      Search({
        value: this.changeValue,
        placeholder: '输入搜索词',
        controller: this.controller
      })
        .searchButton('搜索')  //最右边的提示文本
        .width('90%')
        .height(40)
        .backgroundColor('#f5f5f5') //整个搜索条的背景颜色。
        .placeholderColor(Color.Grey)  //搜索框内的文本背景
        .placeholderFont({size: 14, weight: 400})
        .textFont({size: 14, weight:400})
        .onSubmit((value: string)=>{ //搜索按钮的监听
          this.submitValue = value
          console.log('点击了搜索按钮')
        })
        .onChange((value: string) =>{
          this.changeValue = value
          console.log('输入的搜索词：' + value)
        })
        .margin(20)

      Button('设置光标位置')
        .onClick(()=>{
          this.controller.caretPosition(2) //将光标移到第二个字符之后
        })


    }

  }
}