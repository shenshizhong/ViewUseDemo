import UIAbility from '@ohos.app.ability.UIAbility';
import hilog from '@ohos.hilog';
import window from '@ohos.window';

export default class EntryAbility extends UIAbility {
  onCreate(want, launchParam) {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onCreate');
  }

  onDestroy() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage) {
    // Main window is created, set main page for this ability
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageCreate');
    console.log('开始打印')
    windowStage.loadContent('pages/Index', (err, data) => {
      if (err.code) {
        hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'testTag', 'Succeeded in loading the content. Data: %{public}s', JSON.stringify(data) ?? '');

      //数组类型
      let arr: string[] = ['java','python','c++']
      arr.forEach(item => console.log('打印的长度：' + item.length))

      //函数表达式类型注解，箭头函数 （参数和返回值分开注解）
      const add1 = (a: number, b: number): number =>{
        return a+b
      }

      //整体注解 一般用于库文件的编写
      type AddFunc = (a: number, b: number) => number
      const add2 : AddFunc = (a, b) =>{
        return a + b
      }
      console.log('相加结果：'+ add2(1,2))

      //可以选参数，必须写在必填参数类型之后。
      function test(name1: string, name2?: string){
        return name1 + name2
      }
      console.log(test('da'));

    });
  }

  onWindowStageDestroy() {
    // Main window is destroyed, release UI related resources
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
  }

  onForeground() {
    // Ability has brought to foreground
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onForeground');
  }

  onBackground() {
    // Ability has back to background
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onBackground');
  }
}
