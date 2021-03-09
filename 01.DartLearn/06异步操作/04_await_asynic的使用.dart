import 'dart:io';

main(List<String> args) {
  print("main start");
  // var result = getNetworkData();
  var result = getNetworkData().then((value) => print(value));
  print(result);
  print("main end");
}

// 原写法 会阻塞线程
// String getNetworkData() {
//   sleep(Duration(seconds: 3));
//   return "hello world";
// }

// future
// Future getNetworkData() {
//   return Future(() {
//     sleep(Duration(seconds: 3));
//     return "hello world";
//   });
// }

/**
 * 使用await需要满足两个条件
 * 1.await必须包含着async函数中
 * 2.async函数的返回结果必须是一个future
 */
Future getNetworkData() async {
  await sleep(Duration(seconds: 3));
  // 内部自动包裹将返回结果包一个future
  return "hello world";
}
