import emitter from '@ohos.events.emitter';
/**
 * 发送和处理事件的能力
 *
 * */

//接收事件
let subscribeEvent = {
  eventId: 1
}
let callback = (eventData: emitter.EventData)=>{
  console.log('真正返回值的地方' + eventData.data.content)
}
emitter.on(subscribeEvent, callback)

//发送事件
let event = {eventId: 1, priority: emitter.EventPriority.LOW}
let eventData = {
  data:{
    "content": "c",
    "id": 1,
    "isEmpty": 0
  }
}


@Entry
@Component
struct EmitterTest {

  build() {

    Column(){
      Text('Emitter测试')

      Button('点击事件').onClick(()=>{
        emitter.emit(event, eventData)

      })
    }
  }
}