
import promptAction from '@ohos.promptAction'
@Entry
@Component
struct Index {
  @State message: string = 'Hello World'
  @State high: number = 180

  build() {
    Column(){
      //图片组件
      Image($r('app.media.icon'))
      // Image($rawfile('test.png'))  //如果是rawFile 要加后缀名
        .width(50)
        .height(50)
        .borderRadius(10)
        .interpolation(ImageInterpolation.High) //图片的插值效果（去掉锯齿是图片清晰）
        .margin({bottom: 10})
        .onComplete(img =>{
          console.log("图片的宽度：" + img.width)
        })
        .onError(()=>{
           //图片加载报错，走这里
        })

      //文本组件
      Text($r('app.string.register'))
        .fontSize(20)  //字体大小
        .lineHeight(30) //行高
        .fontColor('#00f') //字体颜色
        .fontWeight(FontWeight.Medium)//字体粗细
        .margin({bottom: 10})
        .onClick(()=>{
          console.log('点击事件')
        })

      Row(){
        Image($r('app.media.phone'))
          .width(40)
          .height(40)
        //文本输入框
        TextInput({placeholder:'请输入用户名'}) //这里头是提示文本
          .width('80%')
          .height(40)
          .backgroundColor('#cdcdcd')
          .margin({left: 10})
      }.width('100%')
      .margin({bottom:10})


      Row(){
        Image($r('app.media.pwd'))
          .width(40)
          .height(40)
        TextInput({placeholder: '请输入密码'})
          .width('80%')
          .height(40)
          .backgroundColor('#cdcdcd')
          .type(InputType.Password) //输入文本类型
          .showPasswordIcon(true) //是否显示密码icon
          .margin({bottom: 10})
          .onChange(val=>{
            console.log('输入的值为：' + val)
          })
          .margin({left: 10})
      }.width('100%')
      .margin({bottom:10})

      Row(){
        Text('身高').fontSize(20).fontWeight(FontWeight.Medium)
        //滑动进度条
        Slider({
          value: this.high,
          min: 150,
          max: 190,
          step:1, //这里代表步长
          style: SliderStyle.InSet, //滑动头的是在里面，还是在里面
          direction: Axis.Horizontal, //滑动条的方向。默认是横向
          reverse: false //进度往哪个方向，是否是反向。默认是往右
        }).width('70%')
          .trackThickness(20) //滑轨的粗细
          .showTips(true) //是否显示进度条百分比
          .onChange(val =>{    //获取进度的值
            this.high = val
            console.log('进度长度：' + val)
          })
        Text(this.high.toString()).fontSize(20).fontWeight(FontWeight.Medium)
      }.width('100%')

      Row(){
        Text('地址：').fontSize(20).fontWeight(FontWeight.Medium)
        //下拉框组件
        Select([
          { value: '深圳'},
          { value: '广州'},
          { value: '北京'},
          { value: '上海'}
        ]).selected(1)  //默认选择的城市
          .value('请选择城市') //提示文本
          .font({size:20, weight: FontWeight.Medium})
          .onSelect((index,value) =>{
            console.log('选择的城市：' + value)
          })
      }.width('100%')
      .margin({bottom:10})

      Row(){
        Text('兴趣：').fontSize(20)
        //多选框群组
        CheckboxGroup({group: 'checkGroup'})//控制是否全选或者全不选
          .selectedColor('#f00')
          .selectAll(true)  //默认是否全部选中，如果Checkbox 中的select 有值，那么子组件优先级高，这边就不生效
          .onChange((itemName: CheckboxGroupResult) =>{ //被选中的组件名及状态。全部选中的状态是0，全不选是2，有选中是1
            console.log('选中的框是：'+ itemName.name + ' 状态是：'+ itemName.status.toString())
          })
        Text('全选').fontSize(20)
        Checkbox({name: 'checkbox1', group: 'checkGroup'})
          .selectedColor('#f00')//选中的颜色
          .select(false) //这个优先级高于多选框群组的selectAll
          .onChange((value: Boolean) =>{
            console.log('checkbox1 是否选中：' + value)
          })
        Text('看书').fontSize(20)
        Checkbox({name: 'checkbox2', group: 'checkGroup'})
          .selectedColor('#f00')//选中的颜色
          .select(false)
          .onChange((value: Boolean) =>{
            console.log('checkbox2 是否选中：' + value)
          })
        Text('跑步').fontSize(20)
        Checkbox({name: 'checkbox3', group: 'checkGroup'})
          .selectedColor('#f00')//选中的颜色
          .select(false)
          .onChange((value: Boolean) =>{
            console.log('checkbox3 是否选中：' + value)
          })
        Text('钓鱼').fontSize(20)
      }.width('100%')
      .margin({bottom:10})

      Row(){
        Text('性别：').fontSize(20)
        //单选框组件 （记得写多组，不然点击看不出效果）
        Radio({value: '男', group: 'sex'})
          .height(20)
          .width(20)
          .checked(true)
          .onChange((isChecked: Boolean)=>{
            if (isChecked) {
              console.log('男生 是否选中：' + isChecked)
            }
          })

        Text('男').fontSize(20)

        Radio({value: '女', group: 'sex'})
          .height(20)
          .width(20)
          .checked(true)
          .onChange((isChecked: Boolean)=>{
            if (isChecked) {
              console.log('女生 是否选中：' + isChecked)
            }
          })
        Text('女').fontSize(20)
      }.width('100%')
      .margin({bottom:10})

      //垂直方向布局容器
      Column({space:20}){ //组件间的间距
        Text('组件一').fontSize(20).fontColor('#00f').lineHeight(FontWeight.Medium)
        Text('组件二').fontSize(20).fontColor('#00f').lineHeight(FontWeight.Medium)
      }.backgroundColor('#f00')
        .width('100%')
        .height(100)
        .justifyContent(FlexAlign.Center)//这里是column里面组件  主轴的布局方式。有居中，有放在开始，有放在结束等。
        .alignItems(HorizontalAlign.Start) //这里是column里面组件 交叉轴的布局方式。

      Text('组件三').fontSize(20).fontColor('#00f').lineHeight(FontWeight.Medium)
      .margin({bottom: 20})

      //水平方向布局容器
      Row(){
        Text('组件一').fontSize(20).fontColor('#00f').lineHeight(FontWeight.Medium)
        Text('组件二').fontSize(20).fontColor('#00f').lineHeight(FontWeight.Medium)
      }.backgroundColor('#0f0')
      .width('100%')
      .height(50)
      .justifyContent(FlexAlign.Center)//主轴的布局方式，这是是居中
      .alignItems(VerticalAlign.Top) //交叉轴的布局方式，这里是放在顶部
      Text('组件三').fontSize(20).fontColor('#00f').lineHeight(FontWeight.Medium)
        .margin(20)

      Text('500￥')
        .fontSize(30)
        .fontColor('#f00')
        .decoration({type: TextDecorationType.LineThrough})

      //分割线，做成占位控件
      Divider()
        .height(15)
        .color(Color.Transparent)

      //toast
      Button('点我试试')
        .onClick(()=>{
          promptAction.showToast(
            {
              message: '记得加我v，成为你的专属终身顾问。我的v是hmssz1',
              duration: 3000
            }
          )
        })

    }.width('100%')
    .padding({left: 10, top: 10, right: 10})


  }

}