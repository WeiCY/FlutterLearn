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

    return Stack(
      children: [
        Image.network("https://pics4.baidu.com/feed/f3d3572c11dfa9ec4e31ee4ba6f5e30b918fc179.jpeg?token=fb0f58e68ea3c2e46117745d7cabf24c&s=AF32748508837B5D10AB9D810300A088"),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            color: Colors.blue,
            // width: double.infinity, 设置宽度无限 但是这样和positioned冲突
            child: Text("z这是新闻标题" ,style: TextStyle(color: Colors.white, fontSize: 20),),
          ),
        )
      ],
    );
  }
}

class StackDemo1 extends StatelessWidget {
  const StackDemo1({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      /*
       * Stack 默认的大小是包裹内容的
       * 排列默认从左上开始 通过alignment来设置
       * - alignment 从什么位置开始排布所有的子widget
       * - fit expand 将子元素拉伸到尽可能大
       * - overflow 超出部分如何处理
       */

      alignment: AlignmentDirectional.bottomCenter,
      // fit: StackFit.expand,
      overflow: Overflow.visible,
      children: [
        Image.network("https://pics4.baidu.com/feed/f3d3572c11dfa9ec4e31ee4ba6f5e30b918fc179.jpeg?token=fb0f58e68ea3c2e46117745d7cabf24c&s=AF32748508837B5D10AB9D810300A088"),
        Container(width: 150, height: 150, color: Colors.red,),

        // 包裹Psoitioned 来设置位置

        Positioned(
          left: 0,
            bottom: -10,
            child: Text("新闻",style: TextStyle(fontSize: 20, color: Colors.green),),
        ),
      ],
    );
  }
}

class RowDemo1 extends StatelessWidget {
  const RowDemo1({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Row(
      /*
       * Flexible
       * - flex
       *
       *  空间分配：宽度没有效果
       *  单独会充满
       *  多个会根据flex 比例配置 默认1：1
       *
       * Expanded 使用更多
       * Expanded -> Flexible(  fit: FlexFit.tight, ）
       *
       */
      mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Expanded(
            child: Container(width: 100,height: 100,color: Colors.red,)
        ),
        Container(width: 120,height: 90,color: Colors.blue,),
        Container(width: 90,height: 120,color: Colors.green,),
      ],
    );
  }
}

class RowDemo2 extends StatelessWidget {
  const RowDemo2({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Row(
      /*
       * Expanded 还可以作为收缩使用
       */
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
      Expanded(child: Container(width: 500,height: 100,color: Colors.red,)),
      Container(width: 120,height: 90,color: Colors.blue,),
      Container(width: 90,height: 120,color: Colors.green,),
    ],
    );
  }
}


// Row/Colum：继承自Flex
// Flex 类似于CSS中Flex
// Row和Colum的属性使用方法类似
class RowDemo extends StatelessWidget {
  const RowDemo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(

      /*
       * Row特点：水平方向尽可能占据比较大的空间，垂直方向包裹内容
       * 如果水平方向想要包裹内容 可以设置属性mainAxisSize 为 MainAxisSize.min, 默认max
       * MainAxisAlignment
       *  - start  从主轴开始的位置挨个排序
       *  - end    从主轴结束的位置挨个排序
       *  - center   主轴的中心点居中对齐
       *  - spaceBetween  左右两边边距为0，其他元素之间平分间距
       *  - spaceAround   左右两边间距刚好是其他元素之间间距的一半
       *  - spaceEvenly   所有间距平分
       *  - stretch 先让Row占据交叉轴尽可能大的空间，然后将所有子widget交叉轴的高度拉伸到最大
       *
       * CrossAxisAlignment
       *  - start 交叉轴的起始位置对齐
       *  - end   交叉轴的结束位置对齐
       *  - center  交叉轴的中心点对齐
       *  - baseline  基线对齐（必须有文本的时候才有效果)
       *
       * textDirection 对row起效果
       * verticalDirection 对Colum起效果
       */

      // mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(width: 100,height: 100,color: Colors.red,),
        Container(width: 120,height: 90,color: Colors.blue,),
        Container(width: 90,height: 120,color: Colors.green,),
      ],
    );
  }
}













/*
 *  单子组件
 */
class ContainerWidgetDemo extends StatelessWidget {
  const ContainerWidgetDemo({
    Key key,
  }) : super(key: key);

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
