@Entry
@Component
struct SlideBarContainerTestPage {
  normalIcon: Resource = $r('app.media.icon') //侧边栏中的item 的默认icon
  selectedIcon: Resource = $r('app.media.phone') //选中时，侧边栏item中的icon

  @State arr: number[] = [1,2,3]  //侧边栏，左侧想要滚动，用List替代即可
  @State current: number = 1
  @State isShowSlideBar: boolean = true

  build() {
    Column(){
      SideBarContainer(SideBarContainerType.Embed) { //侧边栏和内容并列显示，Overlay是侧边栏浮在内容上面
        //侧边栏的布局
        Column(){
          ForEach(this.arr, (item, index)=>{
            Column({space:5}){
              Image(this.current === index ? this.selectedIcon : this.normalIcon)
                .width(64)
                .height(64)

              Text('index0' + item)
                .fontSize(25)
                .fontColor(this.current === index ?  '#0A59F7' : '#999')
            }
            .onClick(()=>{
              this.current = index
            })
          }, item => item)
        }.width('100%')
        .margin({
          top: 90
        })
        .backgroundColor(Color.Red)
        .justifyContent(FlexAlign.SpaceEvenly)

        //右边 内容的布局
        List(){
          ForEach(this.arr,(item, index)=>{
            ListItem(){
              Text(item + '文本')
                .height(50)

            }
          }, (item)=>item)
        }
        .margin({
          top: 90
        })
        .height('100%')

      }.controlButton({//控制侧边栏显示隐藏的按钮
        icons:{
          hidden: $r('app.media.ic_broadside_close'),
          shown:$r('app.media.ic_broadside_default'),
          switching: $r('app.media.ic_broadside_close')
        },
        width:32,
        height:32
      })
      .sideBarWidth(150)
      .minSideBarWidth(50)
      .maxSideBarWidth('100%')
      .onChange((value)=>{ //侧边栏是否显示的值
        console.log('当前的值：' + value)
      })
      .backgroundColor(Color.Green)

    }
    .margin({
      top: -40
    })


  }
}