import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build (BuildContext context) => new Scaffold(

    //Content of tabs
    body: new PageView(
      children: <Widget>[
        new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text('Home page content'),
          ],
        )
      ],
    ),
  );
}