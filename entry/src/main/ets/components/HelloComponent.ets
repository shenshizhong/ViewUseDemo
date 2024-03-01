@Component
export struct HelloComponent{
  @State message: string = 'Hello, World!'
  build(){
    Row(){
      Text(this.message)
        .onClick(()=>{
          this.message = '你好'
        })
    }
  }
}