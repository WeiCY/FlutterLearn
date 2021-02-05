main(List<String> args) {
  // final sh = shape();
}

// 抽象类
// 注意点2：抽象类不能实例化 但是可以通过工厂方法实现
abstract class shape {
  // 可以只声明方法 不写实现
  void getArea();

  // 也可以实现方法
  String getNews() {
    return "dddd";
  }

  // factory shape() {
  //   return null;
  // }
}

class Person {
  // 普通类 不可以只声明方法不写实现
  // void getInfo();
}

// 注意点1:继承抽象类，必须实现抽象类中的抽象方法
class single extends shape {
  @override
  void getArea() {
    print("object");
  }
}
