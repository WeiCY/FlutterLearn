main(List<String> args) {
  // Future(() {
  //   return "dad";
  // }).then((value) => print(value));

  // 等同于上面的
  Future.value("dada").then((value) => print(value));

  Future.error("error").catchError((err) {
    print(err);
  });

  Future.delayed(Duration(seconds: 2), () {
    return "hellp";
  }).then((value) {
    print(value);
    return "world";
  }).then((value) => print(value));
}
