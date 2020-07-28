import 'package:flutter/material.dart';

Map _dict = {
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

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

@immutable
// ignore: must_be_immutable
class Paragraph extends StatelessWidget {
  int index = 0;
  List<WordItem> words = [];
  Paragraph(this.index, this.words);

  @override
  Widget build(BuildContext context) {
    return Container(
        // key: Key(index.toString()) ,
        width: double.maxFinite,
        child: Wrap(
            // mainAxisAlignment: MainAxisAlignment.start,
            children: words.map((word) => word).toList()));
  }
}

@immutable
// ignore: must_be_immutable
class WordItem extends StatefulWidget {
  int index = 0;
  String en = "";
  List<String> cn = [""];
  WordItem(this.index, this.en) {
    String le = en.replaceFirst(RegExp(r"('s|')$"), "").replaceAll(RegExp(r"[^\w\s]+"), "");
    String ll = le.toLowerCase();
//    print("${en} -> ${le}");

    if (_dict[le] != null) {
      cn = _dict[le] as List<String>;
    } else if (_dict[ll] != null) {
      cn = _dict[ll] as List<String>;
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

class _MyHomePageState extends State<MyHomePage> {
  // String article = "My name is Ivan";
  String article = '''
My name is Ivan, I am a Chineses, and I am come from China.
Now I stay in Kuala&&&Lumpur. It's the capital city of Malaysia which is a southeast asian nation.
Hooray! It's snowing! It's time to make a snowman.James runs out. He makes a big pile of snow. He puts a big snowball on top. He adds a scarf and a hat. He adds an orange for the nose. He adds coal for the eyes and buttons.In the evening, James opens the door. What does he see? The snowman is moving! James invites him in. The snowman has never been inside a house. He says hello to the cat. He plays with paper towels.A moment later, the snowman takes James's hand and goes out.They go up, up, up into the air! They are flying! What a wonderful night!The next morning, James jumps out of bed. He runs to the door.He wants to thank the snowman. But he's gone.''';

  List<Paragraph> paragraphs = [];

  @override
  void initState() {
    super.initState();
    int index = 0;
    paragraphs = [];
    article.trim().split(RegExp(r"[\r\n]+")).forEach((words) {
      paragraphs.add(Paragraph(index++, this.buildParagraph(words)));
    });
  }

  List<WordItem> buildParagraph(String texts) {
    int index = 0;
    return texts.replaceAllMapped(RegExp(r"(\w)(,|;|!|\.|\?)+"), (Match m)=>"${m[1]}${m[2]} ").split(RegExp(r"\s+")).map((text) {
//      print(text);
      return WordItem(index++, text.replaceAll("&&&", " "));
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
//    print(paragraphs);
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: CustomScrollView(slivers: <Widget>[
          new SliverPadding(
            padding: const EdgeInsets.all(20.0),
            sliver: new SliverList(
                delegate: new SliverChildListDelegate(
                    paragraphs.map((paragraph) => paragraph).toList())),
          )
        ]));
  }
}
