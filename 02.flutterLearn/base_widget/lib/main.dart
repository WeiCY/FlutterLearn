import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("基础widget"),
      ),
      body: MyHomeContent(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: ()=>print("1222"),
      ),
    );
  }
}

class MyHomeContent extends StatefulWidget {
  @override
  _MyHomeContentState createState() => _MyHomeContentState();
}

class _MyHomeContentState extends State<MyHomeContent> {
  final imageURL = "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2797731760,1857659050&fm=26&gp=0.jpg";
  @override
  Widget build(BuildContext context) {

    // 加载本地图片
    /*
    * 1.在项目中创建一个文件夹存储图片
    * 2.在pubspec.yaml中进行配置
    * 3.使用图片
    */
    // return Image(image: AssetImage("assets/images/cat.jpg"));

    return Image.asset("assets/images/cat.jpg");
  }
}


class ImageDemo1 extends StatelessWidget {
  // 简写：Image.network(imageURL,width: 300,color: Colors.green,);

  const ImageDemo1({
    Key key,
    @required this.imageURL,
  }) : super(key: key);

  final String imageURL;

  @override
  Widget build(BuildContext context) {
    return Image(
      image: NetworkImage(imageURL),
      width: 300,
      height: 300,
      fit: BoxFit.fill,
      // 1.可以使用常量 2.可以自定义 范围 -1～1
      alignment: Alignment.bottomLeft,
      color: Colors.red,
      colorBlendMode: BlendMode.colorDodge,
      repeat: ImageRepeat.repeatX,
    );
  }
}

// button
class ButtonDemo extends StatelessWidget {
  const ButtonDemo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // RaisedButton
        RaisedButton(onPressed: () {

        },child: Text("Raised Button"),
        textColor: Colors.red,
        color: Colors.green,),

        // FlatButton
        FlatButton(onPressed: () => print("dsd"), child: Text("Flat Button"),),

        // OutlineButton
        OutlineButton(onPressed: () => print("outline"),child: Text("Outline Button"),),

        // FloatingActionButton 一般写在顶部

        // 自定义button
        FlatButton(
          onPressed: () {},
          color: Colors.orange,
          shape: RoundedRectangleBorder(
              borderRadius:BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.favorite,
                color: Colors.red,
              ),
              Text("喜欢")
            ],
          ),
        )
      ],
    );
  }
}

class TextRichDemo extends StatelessWidget {
  const TextRichDemo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        // text:"hello world",
        // style: TextStyle(color: Colors.red)

        children: [
          TextSpan(text: "hello", style: TextStyle(color: Colors.red)),
          WidgetSpan(child: Icon(Icons.favorite,color: Colors.red,)),
          TextSpan(text: "world", style: TextStyle(color: Colors.black)),
        ]
      )
    );
  }
}

// TextWidget Demo
class TextDemo extends StatelessWidget {
  const TextDemo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "Hello world",
      // 设置剧中后无反应，因为宽度是固定的 刚好包裹住文字  不能直接设置text的宽度
      textAlign: TextAlign.center,
      maxLines: 1,
      textScaleFactor: 1.5, // 缩放
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: 30,
        color: Colors.red,
        fontWeight: FontWeight.bold
      ),
    );
  }
}


