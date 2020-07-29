import 'package:flutter/material.dart';
import 'package:hello_world/views/pages/ReadingPage/fragments/WordItem.dart';

@immutable
// ignore: must_be_immutable
class Paragraph extends StatelessWidget {
  int index = 0;
  List<WordItem> words = <WordItem>[];
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
