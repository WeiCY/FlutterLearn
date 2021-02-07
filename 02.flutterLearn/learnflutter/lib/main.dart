import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

// void main() {
  // 1.runApp函数
  // runApp(
    // 老代码  代码较多  需要进行分级
   // MaterialApp(
   //   debugShowCheckedModeBanner: false,
   //   home:  Scaffold(
   //     appBar: AppBar(
   //       title: Text("first flutter demo"),
   //     ),
   //     body: Center(
   //       child:       Text(
   //         "hello dart",
   //         textDirection: TextDirection.rtl,
   //         style: TextStyle(
   //             fontSize: 50,
   //             color: Colors.red
   //         ),
   //       ),
   //     ),
   //   )
   // )
  // );
// }

void main() => runApp(WCYAPP());

/***
 * widget：
 * 有状态的widget：StatefulWidget 在运行过程中有一些状态（data）需要改变
 * 无状态的widget：StatelessWidget 内容是确定的 在运行过程没有状态（data）改变
 */

// 不推荐直接继承widget 需要重写好多
// class WCYHomePage extends Widget {
//   @override
//   Element createElement() {
//     // TODO: implement createElement
//     throw UnimplementedError();
//   }
// }

class WCYAPP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home:WCYHomePage()
      );
  }
}

class WCYHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("first flutter demo"),
      ),
      body: WCYContent()
    );
  }
}

class WCYContent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return WCYContentState();
  }
}

class WCYContentState extends State<WCYContent> {
  var flag = false;

  @override
  Widget build(BuildContext context) {
    return  Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("data"),
            Checkbox(
              value: flag,
              onChanged:(value) {
                setState(() {
                  flag = value;
                });
              },
            )
          ],
        )
    );
  }


}