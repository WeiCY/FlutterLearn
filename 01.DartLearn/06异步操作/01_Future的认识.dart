import 'dart:io';

main(List<String> args) {
  print("main start");
  // 发送网络请求
  var result = FutureMNNetwork();
  print(result);

  // 2.拿到结果
  /**
   * then 后面的回掉函数在 future（函数）的回掉函数有了结果后才会调用
   */
  result.then((value) {
    print(value);
  }).catchError((error) {
    print(error);
  }).whenComplete(() => {print("code run end")});

  print("main end");
}

// 模拟网络请求
String MNNetwork() {
  sleep(Duration(seconds: 3));
  return "network end";
}

Future<String> FutureMNNetwork() {
  // 1.将耗时操作包裹到Future的回掉函数中
  /*
    1.只要有返回结果，就会调用future中对应的then的的回掉
    2.如果没有结果，或者有错误信息，需要在future中抛出异常
  */
  return Future<String>(() {
    sleep(Duration(seconds: 3));
    // print("  Future mnnetwork");
    // return "future mnnetwork";
    throw Exception("this is error");
  });
}
