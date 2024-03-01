
/**
 *
 * 下拉刷新
 *
 * */
@Entry
@Component
struct FreshTest {
  //声明成员变量
  @State isRefreshing: boolean = false
  @State counter: number = 0

  build() {
    Column(){
      Refresh({
        refreshing: $$this.isRefreshing,
        offset: 120,
        friction: 100
      }){
        Text('下拉刷新： ' + this.counter)
          .fontSize(30)
          .margin(10)
          .backgroundColor('#0f0')

      }.onStateChange((refreshStatus: RefreshStatus) =>{
        console.info('刷新的状态：' + refreshStatus)
      })
      .onRefreshing(()=>{
        let timeOut = setTimeout(()=>{//定时器
          this.counter++
          this.isRefreshing = false;
          console.log('++')
        },1000)
        console.log('刷新测试')
        // clearTimeout(timeOut)  //取消定时，那么上面的定时任务就不执行。
      })
      .width('100%')
      .height('100%')
      .backgroundColor('#f00')
      .align(Alignment.Top)
    }

  }
}