import 'package:flutter/material.dart';

class NewsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NewsPageState();
  }
}

class _NewsPageState extends State<NewsPage> {
  Widget _item(String text) => Container(
        width: double.infinity,
        height: 100,
        child: Card(
          margin: EdgeInsets.all(10),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Text('1 Message'),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            _item('1 Message'),
            _item('1 Message'),
            _item('1 Message'),
            _item('1 Message'),
            _item('1 Message'),
            _item('1 Message'),
            _item('1 Message'),
            _item('1 Message'),
          ],
        ),
      ),
    );
  }
}
