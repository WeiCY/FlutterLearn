// 可以自动倒入
// import 'utils/math_utils.dart';
// import 'utils/math_utils.dart' as mu;

// import 'utils/math_utils.dart' as mu show sum;
import 'utils/math_utils.dart' as mu hide sum;

// 默认情况：导入一个库回导入这个库中所有的公共属性和方法
// _是区分私有和共有的一种方式。如果在工具类中方法前面有_那么这个方法是私有的

/**
 *  show：执行要导入的内容
 *  hide：隐藏某个要导入的内容，导入其他内容
 */

// 公共dart文件抽取使用export  类似于iOS的公共头文件

main(List<String> args) {
  // print(sum(20, 2));
  // print(mu.sum(20, 30));

  // print(mu.mul(20, 30));
}

// 如果本类有方法 会导致冲突 可以使用as来给倒入的库命名

void sum(num1, num2) {
  print(num1 + num2);
}
