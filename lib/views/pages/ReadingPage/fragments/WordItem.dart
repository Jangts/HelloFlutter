import 'package:flutter/material.dart';

Map<String, List<String>> _dict = <String, List<String>>{
  "my": ["我的"],
  "name": ["名字"],
  "Ivan": ["伊凡"],
  "I": ["我, 老子, 第一人称自称"],
  "he": ["他"],
  "Chineses": ["中国人"],
  "come": ["来"],
  "from": ["自"],
  "China": ["中国"],
  "now": ["现在"],
  "stay": ["停留"],
  "Kuala Lumpur": ["吉隆坡"],
  "capital": ["资本"],
  "city": ["城市"],
  "Malaysia": ["马来西亚"],
  "southeast": ["东南方"],
  "asian": ["亚洲人, 亚洲的"],
  "nation": ["民族, 国家"],
  "eyes": ["眼睛"],
  "snowing": ["下雪"],
  "house": ["房子"],
  "morning": ["早上"],
  "snowman": ["雪人"]
};

@immutable
// ignore: must_be_immutable
class WordItem extends StatefulWidget {
  int index = 0;
  String en = "";
  List<String> cn = [""];
  WordItem(this.index, this.en) {
    String le = en
        .replaceFirst(RegExp(r"('s|')$"), "")
        .replaceAll(RegExp(r"[^\w\s]+"), "");
    String ll = le.toLowerCase();
//    print("${en} -> ${le}");

    if (_dict[le] != null) {
      cn = _dict[le];
    } else if (_dict[ll] != null) {
      cn = _dict[ll];
    }
  }

  @override
  _WordItemState createState() => _WordItemState();
}

class _WordItemState extends State<WordItem> {
  bool showCN = false;
  String cn = "";

  @override
  Widget build(BuildContext context) {
    // print(widget.en);
    return InkWell(
        onTap: () {
          setState(() {
            showCN = !showCN;
            cn = widget.cn[0];
          });
          // print(widget.en);
          // print(showCN);
        },
        child: Container(
            height: 42,
            margin: EdgeInsets.fromLTRB(4, 4, 4, 4),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                      height: 18,
                      child: Text(showCN ? cn : '',
                          maxLines: 1,
                          style: new TextStyle(
                              fontSize: 12,
                              color: Color.fromRGBO(153, 153, 153, 1)),
                          overflow: TextOverflow.ellipsis)),
                  Container(
                      height: 24,
                      child: Text(widget.en,
                          maxLines: 1,
                          style: new TextStyle(
                              fontSize: 15.0,
                              color: Color.fromRGBO(68, 68, 68, 1)),
                          overflow: TextOverflow.ellipsis)),
                ])));
  }
}
