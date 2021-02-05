main(List<String> args) {
  sayHello("ddd", address: "kdkodkodk");
}

// // 必选参数必须传
// void sayHello(String name) {
//   print("$name hello");
// }

// 可选参数  位置可选参数 命名可选参数

// 只有可选参数才有默认值

// 位置可选参数 [int phone, String address]
// 位置相对应 不能错乱
// void sayHello(String name, [int phone, String address]) {
//   print("$name hello");
// }

// void sayHello(String name, [int phone = 1221222, String address]) {
//   print("$name hello");
// }

// 命名可选参数 {}
// 顺序不固定 最常用 可全写 可不写  关键字要写
void sayHello(String name, {int phone = 1222, String address}) {
  print("$name hello $phone");
}
