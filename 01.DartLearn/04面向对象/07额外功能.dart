main(List<String> args) {
  final color = Colors.red;

  switch (color) {
    case Colors.red:
      print("red");
      break;
    case Colors.blue:
      print("blue");
      break;
    case Colors.yellow:
      print("yellow");
      break;
  }

  print(Colors.values);

  print(Colors.red.index);
}

// 1.枚举
enum Colors { red, blue, yellow }
