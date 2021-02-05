main(List<String> args) {}

// Dart中没有关键字是用来定义接口的
// 没有别的语言中的interface/protoc等
// 默认是所有的类都是隐式接口
class Runner {
  void running() {}
}

class Flyer {
  void flying() {}
}

class Animal {
  void eating() {
    print("eat");
  }
}

// 超人既能飞又能跑 但是dart只能单继承。 为了达到这个目的把类当作接口使用。
// 当一个类被当做接口使用时，那么实现这个接口的类 必须实现这个接口的所有方法
class SuperMan extends Animal implements Runner, Flyer {
  @override
  void eating() {
    super.eating();
  }

  @override
  void running() {
    // 不能这样写，继承的可以
    // super.runing()
  }

  @override
  void flying() {}
}
