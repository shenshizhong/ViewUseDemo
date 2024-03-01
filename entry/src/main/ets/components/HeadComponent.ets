@Component
export struct HeaderComponent{
  private title: ResourceStr
  build(){
    Row(){
      Image($r('app.media.app_icon')).width(50).height(50)
      Text(this.title).fontSize(30)
      Blank()
      Image($r('app.media.pwd')).width(30).height(30)
    }.width('100%')

}
}
