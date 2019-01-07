import 'package:flutter/material.dart';
import 'toolbar.dart';
import 'dart:ui';
import 'flow.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainToolbar(
        child: Center(
          child: TabTitle(
            titles: <String>['热点', '订阅'],
          ),
        ),
      ),
      primary: true,
      body: Container(
        padding: EdgeInsets.fromLTRB(12, 16, 12, 12),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: <Widget>[
              Poster('2018年度总结'),
              Flow(
                delegate: CardDelegate(),
                children: <Widget>[
                  FlowCard(
                    tag: 'Test',
                    onPressed: () => Navigator.pushNamed(context, '/news'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Poster extends StatefulWidget {
  final String title;

  Poster(this.title);

  @override
  State<StatefulWidget> createState() {
    return _PosterState();
  }
}

class _PosterState extends State<Poster> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
        child: AspectRatio(
          aspectRatio: 2,
          child: DecoratedBox(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/graphics/cover.jpg'),
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
              alignment: Alignment.topRight,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4))),
                clipBehavior: Clip.antiAlias,
                elevation: 0,
                margin: EdgeInsets.all(10),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(6, 2, 6, 2),
                  child: Text(widget.title),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
