import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage("message"),
    );
  }
}

// Stateless 都是不可变得 所以只需要知道构造函数和build就行
class MyHomePage extends StatelessWidget {
  @override
  final String message;
  MyHomePage(this.message) {
    print("构造方法被调用");
  }
  Widget build(BuildContext context) {
    print("build方法被调用");
    return Scaffold(
      appBar: AppBar(
        title: Text("生命周期"),
      ),
      body: HomeContent(),
    );
  }
}


/*
* 注意点：
* 1.MaterialApp home中允许使用StatefulWidget和StatelessWidget
* 2.将某一widget转换为新的widget 将鼠标在widget名字或类型的上面  option + enter
* 3.将build出的widget抽离出到一个新的widget中 option + enter + w
*
*/

// 生命周期重点就是讲述StatefulWidget的生命周期
class HomeContent extends StatefulWidget {
  HomeContent() {
    print("1.statefulwidget的构造方法");
  }

  @override
  _HomeContentState createState() {
    print("2.statefulwidget的createState方法");
    return _HomeContentState();
  }
}

class _HomeContentState extends State<HomeContent> {
  int _counter = 0;

  _HomeContentState() {
    print("3._HomeContentState的构造方法");
  }

  @override
  void initState() {
    print("4.调用_HomeContentState的 initState方法");

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("5.调用_HomeContentState的 build方法");
    return Center(
      child: Column(
        children: [
          RaisedButton(child: Icon(Icons.add),onPressed: (){
            setState(() {
              _counter++;
            });
          }),
          Text("time:$_counter"),
          Image.network("url"),
        ],
      ),
    );
  }

  @override
  void didChangeDependencies() {
    print("调用_HomeContentState的didChangeDependencies方法");
    /**
     * 调用：
     * 1.调用initState的时候会调用
     * 2.从其他对象中依赖一些数据发生改变的时候会调用
     */

    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant HomeContent oldWidget) {
    print("didUpdateWidget方法被调用");
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    print("6.调用_HomeContentState的 dispose方法 ");
    super.dispose();
  }

}
