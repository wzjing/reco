import 'package:flutter/material.dart';
import 'toolbar.dart';
import 'dart:ui';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'HOME'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextStyle titleStyle = TextStyle(
      color: Color(0xFF4F4F4F), fontSize: 16, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainToolbar(
          child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
                padding: EdgeInsets.all(6),
                child: Text(
                  "Main",
                  style: titleStyle,
                )),
            Padding(
              padding: EdgeInsets.all(6),
              child: Text(
                "HotSpot",
                style: titleStyle,
              ),
            ),
          ],
        ),
      )),
      primary: true,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Padding(
              padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
              child: AspectRatio(
                aspectRatio: 2,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/graphics/cover.jpeg'),
                      fit: BoxFit.fitWidth,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Color(0x2F000000),
                        offset: Offset(6, 3),
                        blurRadius: 6,
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(2))),
                      clipBehavior: Clip.antiAlias,
                      elevation: 0,
                      margin: EdgeInsets.all(10),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(4, 2, 4, 2),
                        child: Text('2018年度总结'),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 100,
            child: Flow(
              delegate: MyDelegate(),
              children: <Widget>[
                Item(width: 40, color: Color(0xFFCFCFCF)),
                Item(width: 60, color: Color(0xFFCFEEEE)),
                Item(width: 20, color: Color(0xFF068275)),
                Item(width: 70, color: Color(0xFFCACACA)),
                Item(width: 90, color: Color(0xFF603277)),
                Item(width: 40, color: Color(0xFF295272)),
                Item(width: 50, color: Color(0xFF199473)),
                Item(width: 30, color: Color(0xFF378593)),
                Item(width: 90, color: Color(0xFF248844)),
              ],
            ),
          ),
          Text('Tail'),
        ],
      ),
    );
  }
}

class Item extends Container {
  Item({double width = 80, Color color = Colors.red}):  super(width: width, height: 40, color: color);
}

class MyDelegate extends FlowDelegate {
  @override
  void paintChildren(FlowPaintingContext context) {
    double x = 0;
    double y = 0;
    for (int i = 0; i < context.childCount; i++) {
      if (x > 0 && (x + context.getChildSize(i).width) > context.size.width) {
        x = 0;
        y += context.getChildSize(i).height;
      }
      print('x: $x, y: $y item width: ${context.getChildSize(i).width}, width: ${context.size.width}');
      context.paintChild(i, transform: Matrix4.translationValues(x, y, 0));
      x += context.getChildSize(i).width;
    }
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    return oldDelegate != this;
  }
}
