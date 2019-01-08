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
              Poster('2018年度总结'),
              Container(
                color: Colors.white24,
                child: Flow(
                  delegate: CardDelegate(),
                  children: <Widget>[
                    FlowCard(
                      tag: 'Test',
                      onPressed: () => Navigator.pushNamed(context, '/news'),
                    ),
                    FlowCard(
                      tag: 'Test',
                      onPressed: () => Navigator.pushNamed(context, '/news'),
                    ),
                    FlowCard(
                      tag: 'Test',
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
