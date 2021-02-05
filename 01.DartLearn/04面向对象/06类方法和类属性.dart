import '01类.dart';

main(List<String> args) {
  Person.courseTime = "08:00";
  final p = Person();
  p.name = "dd";

  p.eating();

  Person.gotoCpurse();
}

class Person {
  // 成员变量
  String name;

  // 静态属性(类属性)
  static String courseTime;

  // 对象方法
  void eating() {
    print("eat");
  }

  // 类方法
  static void gotoCpurse() {
    print("object");
  }
}
