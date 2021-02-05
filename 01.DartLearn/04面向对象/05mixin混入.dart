main(List<String> args) {
  final sp = SuperMan();
  sp.running();
  sp.flying();
}

// 由于隐式接口需要实现全部方法  如果只有有方法实现了  需要重新实现
mixin Runner {
  void running() {
    print("run  run");
  }
}

mixin Flyer {
  void flying() {
    print("fly");
  }
}

class SuperMan with Runner, Flyer {
  // 不需要重新实现里面的方法

// 这样相当于重写 用自己的

// 优先使用自己的或者重写的，最后
  @override
  void running() {
    print("run  run");
  }

  void flying() {
    print("object");
  }
}
