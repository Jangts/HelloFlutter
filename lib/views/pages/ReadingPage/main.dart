import 'package:flutter/material.dart';
import 'package:hello_world/views/pages/ReadingPage/fragments/Paragraph.dart';
import 'package:hello_world/views/pages/ReadingPage/fragments/WordItem.dart';


class ReadingPage extends StatefulWidget {
  ReadingPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ReadingPageState createState() => _ReadingPageState();
}

class _ReadingPageState extends State<ReadingPage> {
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
