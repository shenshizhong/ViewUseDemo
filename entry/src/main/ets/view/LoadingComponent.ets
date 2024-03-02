
/**
 * 封装加载组件
 * */
@Component
export default struct LoadingComponent{
  private imageWidth: number | Resource = 0
  private imageHeight: number | Resource = 0

  build(){
    Column(){
      ImageAnimator()
        .images([
          {
            src: '/loading/loading01.png',
            duration: 200,
          },
          {
            src: '/loading/loading02.png',
            duration: 200,
          },
          {
            src: '/loading/loading03.png',
            duration: 200,
          },
          {
            src: '/loading/loading04.png',
            duration: 200,
          },
          {
            src: '/loading/loading05.png',
            duration: 200,
          },
          {
            src: '/loading/loading06.png',
            duration: 200,
          }
        ])
        .width(this.imageWidth)
        .height(this.imageHeight)
        .iterations(-1)
        .fixedSize(true) //设置图片为固定组件大小
        .reverse(false) //如果为true表示最后一张，播放到第一张。（当前是第一张到最后一张）
        .fillMode(FillMode.None) //设置动画开始前和结束后的状态
        .state(AnimationStatus.Running)//表示动画处于播放状态
    }
  }

}