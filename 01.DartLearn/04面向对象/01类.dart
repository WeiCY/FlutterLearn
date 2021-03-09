main(List<String> args) {
  const f1 = Fish("name");
  const f2 = Fish("name");

  print(identical(f2, f1));
}

class Person {
  String name;
  String age;

  // 如果后期新增参数 希望有新的方法，由于只能有一个构造函数
  double height;

  // Person(this.name, this.age);

  //  下面的这种写法会报错
  //  Person(this.name, this.age, this.height);
  // 可以改为下面的方法 可选参数
  Person(this.name, this.age, {this.height});
  // 也可以命名构造函数
  Person.withNameAgeHeight(this.name, this.age, this.height);

  // 重写打印信息
  @override
  String toString() {
    return "$name $age";
  }
}

class Dog {
  final String name;
  final int age;

  // Dog(this.name);

  // 如果想要 age有初始值 可以在 age初始化的时候赋值 int age = 10
  // 也可以 Dog(this.name) { this.age = 10; };
  // 但是如果是final 字段就会出问题

  // 初始化列表
  // Dog(this.name) : age = 10;

  Dog(this.name, {int age}) : this.age = age ?? 10;
  // 可以简写为下面的语句 但是下面的语句只能进行赋值操作 赋值一个确定值或赋值确定值
  // Dog(this.name, {this.age = 10});

}

class Cat {
  String name;
  int age;

  // 重定向构造函数
  Cat._internal(this.name, this.age);
  Cat(String name) : this._internal(name, 10);
}

// 常量构造函数
class Fish {
  // 一类中一般只有一个常量构造函数
  final String name;
  const Fish(this.name);
}

// 普通构造函数特点；会自动返回创造的对象，不能手动返回
// 工厂构造函数 最大特点：可以手动返回一个对象
class People {
  String name;
  String color;

  // 需求 同一个名字 或 肤色 返回同一个对象
  // 相当于类属性 直接People._nameCache  不同于普通属性 p1.name
  static final Map<String, People> _nameCache = {};
  static final Map<String, People> _colorCache = {};

  factory People.withName(String name) {
    if (_nameCache.containsKey(name)) {
      return _nameCache[name];
    } else {
      final p = People(name, "default");
      _nameCache[name] = p;
      return p;
    }
  }

  factory People.withColor(String color) {
    if (_colorCache.containsKey(color)) {
      return _colorCache[color];
    } else {
      final p = People("default", color);
      _colorCache[color] = p;
      return p;
    }
  }

  // 如果有自己的构造函数，就不会自动生成构造函数
  People(this.name, this.color);
}
