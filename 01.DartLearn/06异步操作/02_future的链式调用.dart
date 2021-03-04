import 'dart:io';

main(List<String> args) {
  print("main start");

  Future(() {
    sleep(Duration(seconds: 3));
    return "第一次调用结束";
  }).then((value) {
    print(value);

//  以下方法可以实现多次请求  但是嵌套太多 不推荐
    // Future(() {
    //   sleep(Duration(seconds: 3));
    //   return "第二次调用结束";
    // }).then((value) {
    //   print(value);
    // });

    sleep(Duration(seconds: 2));
    // return "第二次调用结束";
    throw Exception("第二次抛出异常");
  }).then((value) {
    print(value);
  }).catchError((error) {
    print(error);
  });

  print("main end");
}
