main(List<String> args) {
  // test(bar);

  // // 匿名函数
  // test(() {
  //   print("匿名函数");
  //   return 10;
  // });

  // 箭头函数 （条件：函数体只有一行）
  // test(() => print("jian tou"));

  caluate((num1) {
    return num1 * 2;
  });
}

// 函数可以作为另外一个函数的参数
void test(Function foo) {
  var result = foo();
  print(result);
}

void bar() {
  print("object");
}

// 带参数和返回值
void caluate(int foo(int num1)) {
  foo(20);
}
