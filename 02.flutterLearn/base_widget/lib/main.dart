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

  final userNameTextFieldEditController = TextEditingController();
  final userPassworldTextFieldEditController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFieldDemo(userNameTextFieldEditController: userNameTextFieldEditController, userPassworldTextFieldEditController: userPassworldTextFieldEditController),
    );
  }
}

// 输入框
class TextFieldDemo extends StatelessWidget {
  const TextFieldDemo({
    Key key,
    @required this.userNameTextFieldEditController,
    @required this.userPassworldTextFieldEditController,
  }) : super(key: key);

  final TextEditingController userNameTextFieldEditController;
  final TextEditingController userPassworldTextFieldEditController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: userNameTextFieldEditController,
          decoration: InputDecoration (
            labelText: "user name :",
            icon: Icon(Icons.people),
            hintText: "place input your name",
            border: OutlineInputBorder(),
            filled: true,
            fillColor: Colors.red[100],
          ),
          onChanged: (value) {
            print("onChange:$value");
          },

          onSubmitted: (value) {
            print("onSubmit:$value");
          },
        ),

        SizedBox(height: 10,),

        TextField(
          controller: userPassworldTextFieldEditController,
          decoration: InputDecoration (
            labelText: "user password",
            icon: Icon(Icons.lock),
            hintText: "place input your password",
          ),
        ),

    FlatButton(onPressed: () {
      final userName = userNameTextFieldEditController.text;
      final userPass = userPassworldTextFieldEditController.text;

      print("name:$userName, password:$userPass");
    },
    color: Colors.lightGreen,
    child: Text("Log In", style: TextStyle(
      fontSize: 20,
      color: Colors.red,
      // backgroundColor: Colors.lightGreen,
      ),))
    ],
    );
  }
}




/*
 *  补充知识点
 *
 */

class IconExtensionDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /*
    *
    * Icon 字体图标
    * 与图片图标区别
    * 1.字体图标是矢量图，放大不会失真
    * 2.可以设置颜色
    * 3.图标很多时，占据空间更小
    */
    // return Icon(Icons.pets,color: Colors.red,size: 300,);
    // return Icon(IconData(0xe90e, fontFamily: 'MaterialIcons'),color: Colors.red,size: 300,);

    /*
    *
    * 1.0xw90e是数字 需要转换unicode  0xe90e -> \ue90e
    * 2.设置对应的字体
    */
    return Text("\ue90e", style: TextStyle(fontFamily: 'MaterialIcons',fontSize: 30,color: Colors.red),);
  }
}


class ButtonExternDemo extends StatelessWidget {
  const ButtonExternDemo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        /*
        * 默认情况下  button上下左右有边距 最小48
        * materialTapTargetSize 设置不同类型
        */
        // FlatButton(onPressed: () {}, child: Text("flat button"), color: Colors.red,materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,),
        // FlatButton(onPressed: () {}, child: Text("flat button"), color: Colors.red,),

        /*
        * button 有默认大小 88*36
        * 具体看代码 build方法 button theme
        */
        // 不能这样写  因为buttontheme是通过上下文获得的 不是通过属性获得
        // FlatButton(onPressed: () {}, color: Colors.red,textTheme: ButtonTheme(minWidth: 30,height: 30,),),

        // ButtonTheme(child: FlatButton(onPressed: () {}, color: Colors.red,),minWidth: 30,height: 30,),

        /*
        * 內边距
        * 如图：左右已无內边距 上下內边距原因：1 有个最小高度，如果设置小一点 会没有 2 文字本身也有高度 上下间距
        */
        // ButtonTheme(child: FlatButton(onPressed: () {}, child: Text("flat button"),color: Colors.red,padding: EdgeInsets.all(0),),minWidth: 30,height: 30,),


        // 设置宽高 外部包裹一个container
        Container(
          width: 200,
            height: 50,
            child: ButtonTheme(child: FlatButton(onPressed: () {}, child: Text("flat button"),color: Colors.red,padding: EdgeInsets.all(0),),minWidth: 30,height: 30,)
        ),

      ],
    );
  }
}

class ImageExtensionDemo extends StatelessWidget {

  // 占位图  fade 有淡入淡出效果 还可以设置淡入淡出时间
  // 缓存： flutter中对图片是有缓存的  最多1000张 最大100m 超过后会删除最先的  通过地址和宽高来鉴定

  const ImageExtensionDemo({
    Key key,
    @required this.imageURL,
  }) : super(key: key);

  final String imageURL;

  @override
  Widget build(BuildContext context) {
    return FadeInImage(placeholder: AssetImage("assets/images/cat.jpg"), image: NetworkImage(imageURL));
  }
}

// 图片
// 本地图片
class ImageDemo2 extends StatelessWidget {
  // 加载本地图片
  /*
    * 1.在项目中创建一个文件夹存储图片
    * 2.在pubspec.yaml中进行配置
    * 3.使用图片
    */
  // return Image(image: AssetImage("assets/images/cat.jpg"));

  const ImageDemo2({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset("assets/images/cat.jpg");
  }
}

// 网络图片
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


