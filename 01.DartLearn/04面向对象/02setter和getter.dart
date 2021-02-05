main(List<String> args) {
  final p = Person();
  // 直接访问属性
  p.name = "ddd";
  print(p.name);

  // get set
  p.setName = "23";
  print(p.getName);
}

class Person {
  // 没有public private等属性 只能加_ 来保证当前模块私有
  String name;

  // setter
  set setName(String name) {
    this.name = name;
  }

  // getter
  String get getName {
    return name;
  }
}

class Animale {
  String name;

  Animale(this.name);
}

// 类的继承
class Tom extends Animale {
  int age;

  Tom(String name, this.age) : super(name);
}
