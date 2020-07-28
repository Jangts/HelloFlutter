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
              Navigator.of(context).pushNamed('router/reading',
                  arguments: 0); //这里一定要保证跳页的路由路径跟上面注册的路径一致
            }),
        RaisedButton(
            child: Text("开始阅读文章2"),
            onPressed: () {
              Navigator.of(context).pushNamed('router/reading',
                  arguments: 1); //这里一定要保证跳页的路由路径跟上面注册的路径一致
            })
      ])),
    );
  }
}
