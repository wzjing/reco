import 'package:flutter/material.dart';
import 'package:reco/widget/toolbar.dart';
import 'package:reco/widget/flow.dart';
import 'package:reco/widget/card.dart';

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
        height: double.infinity,
        color: Colors.black12,
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: <Widget>[
              CoverCard('2018年度总结'),
              Container(
                color: Colors.white24,
                child: Wrap(
                  spacing: 8,
                  runSpacing: 12,
                  direction: Axis.horizontal,
                  children: <Widget>[
                    TitleCard(
                      tag: '互联网',
                      image: 'assets/graphics/internet.jpg',
                      onPressed: () => Navigator.pushNamed(context, '/news'),
                    ),
                    TitleCard(
                      tag: '极客',
                      image: 'assets/graphics/geek.jpg',
                      onPressed: () => Navigator.pushNamed(context, '/news'),
                    ),
                    TitleCard(
                      tag: '科学',
                      image: 'assets/graphics/science.jpg',
                      onPressed: () => Navigator.pushNamed(context, '/news'),
                    ),
                    TitleCard(
                      tag: '软件',
                      image: 'assets/graphics/program.jpg',
                      onPressed: () => Navigator.pushNamed(context, '/news'),
                    ),
                    TitleCard(
                      tag: '人物',
                      image: 'assets/graphics/people.jpg',
                      onPressed: () => Navigator.pushNamed(context, '/news'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
