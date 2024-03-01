
class Contact{
  name: string;
  icon: Resource;

  constructor(name: string, icon: Resource) {
    this.name = name;
    this.icon = icon;
  }

}

interface Person{
  name: string
  age:number
}
interface worker1 extends Person{
  id: number
}

let person: Person = {
  name: '20',
  age: 30
}

@Entry
@Component
struct Index {
  @State message: string = 'Hello World'
  private contacts = [
    new Contact('张三', $r("app.media.app_icon")),
    new Contact('李四', $r("app.media.app_icon")),
    new Contact('王五', $r("app.media.app_icon")),
    new Contact('张三1', $r("app.media.app_icon")),
    new Contact('李四2', $r("app.media.app_icon")),
    new Contact('王五3', $r("app.media.app_icon")),
    new Contact('张三4', $r("app.media.app_icon")),
    new Contact('李四5', $r("app.media.app_icon")),
    new Contact('王五6', $r("app.media.app_icon")),
    new Contact('张三7', $r("app.media.app_icon")),
    new Contact('李四8', $r("app.media.app_icon")),
    new Contact('王五9', $r("app.media.app_icon")),
    new Contact('张三10', $r("app.media.app_icon")),
    new Contact('李四11', $r("app.media.app_icon")),
    new Contact('王五12', $r("app.media.app_icon")),
    new Contact('张三13', $r("app.media.app_icon")),
    new Contact('李四14', $r("app.media.app_icon")),
    new Contact('王五15', $r("app.media.app_icon")),
    new Contact('张三16', $r("app.media.app_icon")),
    new Contact('李四17', $r("app.media.app_icon")),
    new Contact('王五18', $r("app.media.app_icon")),
    new Contact('张三19', $r("app.media.app_icon")),
    new Contact('李四20', $r("app.media.app_icon")),
    new Contact('王五21', $r("app.media.app_icon")),
  ]

  //实现列表
  build() {

    Column(){

      Row(){ //给个标题
        Text('联系人列表').fontSize(30).fontWeight(FontWeight.Bold)
      }
      .margin({top: 20,bottom:20})

      List({space: 20}){//联系人列表 (间隙是20)，listItem 数量过多，会自动提供滚动功能
        ForEach(this.contacts, //数据源
          (item: Contact)=>{
          ListItem(){ //List 中一定要包含ListItem
            // Row(){
            //   Image(item.icon)
            //     .width(40)
            //     .height(40)
            //     .margin(10)
            //   Text(item.name).fontSize(30)
            // }
            // .width('100%')
            // .padding(10)
            // .backgroundColor('#cdcdcd')
            // .borderRadius(20)

            // ItemBuilder(item)    //全局构建函数
            this.ItemBuilder1(item) //局部构建函数
          }
          .margin({left:10, right:10})//item与左右的间距
        },
          (item: Contact) => JSON.stringify(item))

      }
      .width('100%')
      .listDirection(Axis.Vertical) //列表的排列方向 默认垂直方向
      .layoutWeight(1) //布局权重  （没有高度的情况下，这个生效）
      .divider({strokeWidth:2, color: '#00f', startMargin: 10, endMargin: 10})//这个是分割线


    }
  }

  //局部的构建函数（只能内部调用）
  @Builder ItemBuilder1(item: Contact){
    Row(){
      Image(item.icon)
        .width(40)
        .height(40)
        .margin(10)
      Text(item.name).fontSize(30)
    }
    .width('100%')
    .padding(10)
    .backgroundColor('#f00')
    .borderRadius(20)
  }

}

//自定义全局构建函数
@Builder function ItemBuilder(item: Contact){
  Row(){
    Image(item.icon)
      .width(40)
      .height(40)
      .margin(10)
    Text(item.name).fontSize(30)
  }
  .width('100%')
  .padding(10)
  .backgroundColor('#cdcdcd')
  .borderRadius(20)
}
