main(List<String> args) {
  // 打印
  print("hello world");

  // 声明变量
  //  明确声明
  String name = "bob";
  // 类型推导（var/final/const）

  // var
  var age = 20;
  // age = "12"; 报错
  age = 30;

  // final 声明常量
  final length = 100.0;
  // length = 11;  终值 不能修改

  // const 声明常量
  const address = "sdsd";
  // address = "ddd"; 不能修改

  // final和const的区别
  /**
   * const必须赋值，在编译期间需要一个确定的常量值
   * final可以通过函数/计算获得一个值，运行期间也可以
   */

  var newName = "tom";
  print(newName);
  newName = "jerry";
  print(newName);
  newName = null;
  newName ??= "Bob";
  print(newName);
}
