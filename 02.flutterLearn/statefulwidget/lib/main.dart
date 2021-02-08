import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("次数"),
      ),
      body: HomeContent("测试数据"),
    );
  }
}

// widget 不加下划线：是暴漏给别人的
class HomeContent extends StatefulWidget {
  final String message;

  HomeContent(this.message);

  @override
  _HomeContentState createState() => _HomeContentState();
}

// state 加下划线 表示只给这个类使用
/**
 * 为什么flutter在设计statefulwidget的时候build方法放在了state中？
 * 1、build出的widget是需要依赖state中的变量（状态、数据）
 * 2、在flutter的运行过程中：
 *    widget是不断销毁和创建的，如果写在了stateful中就会不断创建
 *    当我们的状态改变的时候，并不希望重新创建一个新的widget
 *
 */
class _HomeContentState extends State<HomeContent> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RaisedButton(
                child: Text(
                  "+",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  setState(() {
                    _counter++;
                  });
                },
                color: Colors.pink,
              ),
              RaisedButton(
                child: Text(
                  "-",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  setState(() {
                    _counter--;
                  });
                },
                color: Colors.blue,
              ),
            ],
          ),
          Text("当前计数：$_counter"),
          Text(this.widget.message),
        ],
      ),
    );
  }
}
