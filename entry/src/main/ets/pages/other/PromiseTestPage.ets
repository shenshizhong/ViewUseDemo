
/**
 * Promise 使用
 * async，await，还有Promise 联合使用
 * */

@Entry
@Component
struct PromiseTestPage {

  build() {
    Row() {
      Column() {
        Button('点击获取随机数')
          .onClick(()=>{
            promise.then(
                (result: number)=>{
                console.log('获取的结果：' + result)
                },
                (err)=>{ //这里是执行reject会执行的
                  console.log('获取的结果出错了')
                }
              )
              // .catch((error)=>{//这里是执行reject会执行的，但如果上面的有(err)，这块就不执行。
              //   console.log('获取的结果出错了1')
              // })
          })
          .margin({bottom: 15})

        Button('执行异步操作')
          .onClick(()=>{
            myAsyncFunction()
          })
      }
      .width('100%')
    }
    .height('100%')
  }



}

/**
 * 处理异步操作
 * */
const promise: Promise<number> = new Promise((resolve: Function, reject: Function) =>{
  setTimeout(()=>{
    const randomNumber: number = Math.random()
    if (randomNumber > 0.5){
      resolve(randomNumber)
    }else{
      reject(new Error('随机数是太小'))
    }
  }, 1000)
})

/**
 * 可以用同步的方法，写异步代码。
 * */
async function myAsyncFunction(): Promise<void>{
  const result: string = await new Promise((resolve, reject)=>{
    setTimeout(()=>{
      resolve('耗时3秒')
    }, 3000)
  })
  console.log(result)
}

/**
 * 通过try/catch 捕获异步操作中的异常。
 * */
async function myAsyncFunction2(): Promise<void>{
  try {
    const result: string = await new Promise((resolve: Function, reject)=>{
      resolve('Hello world!')
      // reject('出错了')
    })
  }catch (e){
    console.error(`异常：${e}`); //如果上面只执行reject('出错了')， 这里就会执行。
  }
}


