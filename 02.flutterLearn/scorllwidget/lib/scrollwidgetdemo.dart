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

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text("Scroll Widget")),

      body: CustomScrollView (
        slivers: [

          SliverAppBar(
            expandedHeight: 100,
          ),

          SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  crossAxisCount: 2,
                  childAspectRatio: 3),
              delegate: SliverChildBuilderDelegate((BuildContext btc, int index) {
                return Container(
                  color: Color.fromARGB(255, Random().nextInt(256),
                      Random().nextInt(256), Random().nextInt(256)),
                  child: Text(
                    "这是${index + 1}个",
                    style: TextStyle(fontSize: 30, color: Colors.black),
                  ),
                );
              }, childCount: 10)),
          SliverList(
              delegate: SliverChildBuilderDelegate((BuildContext btc, int index) {
                return ListTile(
                  leading: Icon(Icons.people),
                  trailing: Icon(Icons.delete),
                  title: Text("联系人${index + 1}"),
                  subtitle: Text("电话号码：188898989898"),
                );
              },
                  childCount: 10)),
        ],
      ),
    );
  }
}

class SliverDemo2 extends StatelessWidget {
  const SliverDemo2({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text("Scroll Widget")),
      body:

      // 与safearea 和 sliversafearea类似的还有SliverPadding 和 padding
      // SafeArea(
      // 被safeArea包裹 但是确定不能滑动到安全区域
      //   child:
      CustomScrollView(
        slivers: [
          //  SliverSafeArea 类似SafeArea但是可以滚动到安全区域
          SliverSafeArea(
            sliver: SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    crossAxisCount: 2,
                    childAspectRatio: 0.8),
                delegate:
                SliverChildBuilderDelegate((BuildContext btc, int index) {
                  return Container(
                    color: Color.fromARGB(255, Random().nextInt(256),
                        Random().nextInt(256), Random().nextInt(256)),
                    child: Text(
                      "这是${index + 1}个",
                      style: TextStyle(fontSize: 30, color: Colors.black),
                    ),
                  );
                }, childCount: 100)),
          )
        ],
      ),
      // )
    );
  }
}

class CustomScrollviewDemo1 extends StatelessWidget {
  const CustomScrollviewDemo1({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                crossAxisCount: 2,
                childAspectRatio: 0.8),
            delegate: SliverChildBuilderDelegate((BuildContext btc, int index) {
              return Container(
                color: Color.fromARGB(255, Random().nextInt(256),
                    Random().nextInt(256), Random().nextInt(256)),
                child: Text(
                  "这是${index + 1}个",
                  style: TextStyle(fontSize: 30, color: Colors.black),
                ),
              );
            }, childCount: 100))
      ],
    );
  }
}

class GridViewDemo3 extends StatelessWidget {
  const GridViewDemo3({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: .8, // 宽高比
            crossAxisSpacing: 8,
            mainAxisSpacing: 8),
        itemBuilder: (BuildContext btc, int index) {
          return Container(
            color: Color.fromARGB(255, Random().nextInt(256),
                Random().nextInt(256), Random().nextInt(256)),
          );
        });
  }
}

class GridViewDemo2 extends StatelessWidget {
  /*
  可缩写为
  GridView.extent(

          maxCrossAxisExtent: 400,

          children: List.generate(100, (index) {
            return Container(
              color: Color.fromARGB(
                255, Random().nextInt(256), Random().nextInt(256),
                Random().nextInt(256)),
            );
          }),
        ),
   */
  const GridViewDemo2({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: .8, // 宽高比
          crossAxisSpacing: 8,
          mainAxisSpacing: 8),
      children: List.generate(100, (index) {
        return Container(
          color: Color.fromARGB(255, Random().nextInt(256),
              Random().nextInt(256), Random().nextInt(256)),
        );
      }),
    );
  }
}

class GridViewDemo1 extends StatelessWidget {
  const GridViewDemo1({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /**
     * 可以缩写为
        GridView.count(
        crossAxisCount: 3,
        children: List.generate(100, (index) {
        return Container(
        color: Color.fromARGB(
        255, Random().nextInt(256), Random().nextInt(256),
        Random().nextInt(256)),
        );
        }),
        ),

     */

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: .8, // 宽高比
            crossAxisSpacing: 8,
            mainAxisSpacing: 8),
        children: List.generate(100, (index) {
          return Container(
            color: Color.fromARGB(255, Random().nextInt(256),
                Random().nextInt(256), Random().nextInt(256)),
          );
        }),
      ),
    );
  }
}

class ListView3 extends StatelessWidget {
  const ListView3({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (BuildContext btc, int index) {
          return Text(
            "这是第${index + 1}行",
            style: TextStyle(fontSize: 30, color: Colors.red),
          );
        },
        separatorBuilder: (BuildContext btc, int index) {
          return Divider(
            color: Colors.red,
            indent: 20,
          );
        },
        itemCount: 100);
  }
}

class ListViewDemo2 extends StatelessWidget {
  const ListViewDemo2({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 100,
        itemExtent: 50,
        itemBuilder: (BuildContext bct, int index) {
          return Text(
            "这是第${index + 1}行",
            style: TextStyle(fontSize: 30, color: Colors.red),
          );
        });
  }
}

class ListViewDemo1 extends StatelessWidget {
  const ListViewDemo1({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: List.generate(100, (index) {
        return ListTile(
          leading: Icon(Icons.people),
          trailing: Icon(Icons.delete),
          title: Text("联系人${index + 1}"),
          subtitle: Text("电话号码：188898989898"),
        );
      }),
    );
  }
}
