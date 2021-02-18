import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("layout widget"),
        ),
        body: MyHomePage(),
      ),
    );
  }
}


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {

    return Container(
      // color: Colors.black,
      width: 200,
      height: 200,
      alignment: Alignment(1,1),
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(50),
      transform: Matrix4.rotationZ(100),
      decoration: BoxDecoration(
        // color和decoration冲突 不能在外面写 如果想设置背景颜色可以在内部设置
        color: Colors.blue,
        border: Border.all(
          color: Colors.pink,
          width:5,
        ),

        boxShadow:[
          BoxShadow(
            color: Colors.orange,
            offset: Offset(5,5),
            blurRadius: 10,
            spreadRadius: 10,
          ),
          BoxShadow(
            color: Colors.green,
            offset: Offset(-5,5),
            blurRadius: 10,
            spreadRadius: 10,
          )
        ],
        borderRadius:BorderRadius.circular(10),
      ),
      child: Icon(Icons.pets,size: 50,color: Colors.red,),
    );
  }
}



class PaddingDemo2 extends StatelessWidget {
  const PaddingDemo2({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("白日依山尽，黄河入海流",style: TextStyle(fontSize: 30,backgroundColor: Colors.red),),
        // 添加下间距
        SizedBox(height: 10,),

        Padding(
          // padding: const EdgeInsets.all(5.0), // 但是这养上下左都会有
          // padding: EdgeInsets.only(bottom: 10), // 只有底部
          // padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0), // 可选属性 可单独为垂直或水平方向添加
          padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: Text("白日依山尽，黄河入海流",style: TextStyle(fontSize: 30,backgroundColor: Colors.red),),
        ),


        Text("白日依山尽，黄河入海流",style: TextStyle(fontSize: 30,backgroundColor: Colors.red),),
      ],
    );
  }
}

class PaddingDemo1 extends StatelessWidget {
  const PaddingDemo1({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text("白日依山尽，黄河入海流",style: TextStyle(fontSize: 30,backgroundColor: Colors.red),),
    );
  }
}




class AlignDemo2 extends StatelessWidget {
  const AlignDemo2({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      // 默认全部充满
      // 默认居中 和center一致
      alignment: Alignment(1,-1),

      // 也可通过下面两个属性来设置大小  根据child的大小的倍数来设置
      widthFactor: 5,
      heightFactor: 5,
      child: Icon(Icons.pets,size: 50,),
    );
  }
}

class AlignDemo1 extends StatelessWidget {
  const AlignDemo1({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // 可通过包裹一个container来设置大小
    return Container(
      width: 300,
      height: 300,
      color: Colors.red,

      child: Align(
        // 默认居中 和center一致
        alignment: Alignment(1,-1),
        child: Icon(Icons.pets,size: 50,),
      ),
    );
  }
}
