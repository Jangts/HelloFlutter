import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String title;
  HomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
          child: Column(children: <Widget>[
        RaisedButton(
            child: Text("开始阅读文章1"),
            onPressed: () {
              Navigator.of(context).pushNamed('router/reading', arguments: 0);
            }),
        RaisedButton(
            child: Text("开始阅读文章2"),
            onPressed: () {
              Navigator.pushNamed(context, 'router/reading', arguments: 1);
            }),
        RaisedButton(
            child: Text("Webview测试"),
            onPressed: () {
              Navigator.of(context).pushNamed('router/about');
            }),
        RaisedButton(
            child: Text("本地SQLite数据库测试"),
            onPressed: () {
              Navigator.of(context).pushNamed('router/sqlite');
            }),
        RaisedButton(
            child: Text("Http网络请求测试"),
            onPressed: () {
              Navigator.of(context).pushNamed('router/http');
            })
      ])),
    );
  }
}
