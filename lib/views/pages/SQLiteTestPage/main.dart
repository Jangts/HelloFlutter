import 'package:flutter/material.dart';
import 'package:hello_world/models/localmodels/Book.dart';

class SQLiteTestPage extends StatefulWidget {
  SQLiteTestPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _SQLiteTestPageState createState() => _SQLiteTestPageState();
}

class _SQLiteTestPageState extends State<SQLiteTestPage> {
  BookSqlite bookSqlite = new BookSqlite();

  var bookName = "";
  @override
  void initState() {
    super.initState();
    insertData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "点击右下角按钮就可以获得id为1的书的书名:",
            ),
            Text(
              bookName,
            )
          ],
        ),
      ),
        floatingActionButton: FloatingActionButton(
          onPressed: getBookName,
          tooltip: 'Increment',
          child: Icon(Icons.add),
        )// This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  //启动先插入4条数据
  void insertData() async{
    // await bookSqlite.openSqlite();
    // await bookSqlite.insert(new Book(0,"flutter大全0","flutter",0.1,"中国出版"));
    // await bookSqlite.insert(new Book(1,"flutter大全1","flutter",0.1,"中国出版"));
    // await bookSqlite.insert(new Book(2,"flutter大全2","flutter",0.1,"中国出版"));
    // await bookSqlite.insert(new Book(3,"flutter大全3","flutter",0.1,"中国出版"));
    // //切记用完就close
    // await bookSqlite.close();
  }

  //获取编号为1的书
  void getBookName() async{
    await bookSqlite.openSqlite();
    Book book = await bookSqlite.getBook(1);
    await bookSqlite.close();
    setState(() {
      bookName = book.name;
    });
  }
}