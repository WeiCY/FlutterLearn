import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  ScrollController controller = ScrollController(initialScrollOffset: 300);
bool _isShowFloatButton = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller.addListener(() {
      print("列表滚动 ${controller.offset}");

      setState(() {
        _isShowFloatButton = controller.offset > 1000;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*
        两种监听滚动的方式
        1.controller
        可以设置默认值offset，可以监听，也可以监听滚动的位置
        2.NotificationListenner
        监听开始滚动和结束滚动
       */
        appBar: AppBar(title: Text("Scroll Widget")),
        body: NotificationListener(

          onNotification: (ScrollNotification nitification) {
            print("noticfication 监听滚动");

            if (nitification is ScrollStartNotification) {
              print("start scroll");
            } else if (nitification is ScrollEndNotification) {
              print("end scroll  current is ${nitification.metrics.pixels}");
            } else if (nitification is ScrollUpdateNotification) {
              print("scrolling");
            }
            return false;
          },

          child: ListView.builder(
              itemCount: 100,
              controller: controller,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: Icon(Icons.people),
                  title: Text("联系人${index + 1}"),
                );
              }
              ),
        ),
      floatingActionButton: _isShowFloatButton ? FloatingActionButton(
        child: Icon(Icons.arrow_upward),
        onPressed: () {
          controller.animateTo(0, duration: Duration(seconds: 1), curve: Curves.bounceIn);
        },
      ) : null,
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }
}
