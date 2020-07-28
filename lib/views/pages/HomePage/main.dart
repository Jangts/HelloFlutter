import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {
  final String title;
  HomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(title),
      ),
      body: new Center(
          child: new RaisedButton(
              child: new Text("开始阅读"),
              onPressed: () {
                Navigator.of(context)
                    .pushNamed('router/reading'); //这里一定要保证跳页的路由路径跟上面注册的路径一致
              })),
    );
  }
}