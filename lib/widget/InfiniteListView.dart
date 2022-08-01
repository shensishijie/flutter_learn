
import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InfiniteListView extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _InfiniteListViewState();
  }
}

class _InfiniteListViewState extends State<InfiniteListView> {
  static const loadingTag = "##loading##";
  var _words = <String>[loadingTag];

  @override
  void initState() {
    super.initState();
    _retrieveData();
  }

  void _retrieveData() {
    Future.delayed(Duration(seconds: 2)).then((e) {
      setState(() {
        _words.insertAll(
          _words.length-1,
          generateWordPairs().take(20).map((e) => e.asPascalCase).toList(),);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      ListTile(title:Text("商品列表")),
      Expanded(
        child: ListView.separated(
            itemBuilder: (context, index) {
              if (_words[index] == loadingTag) {
                if (_words.length - 1 < 100) {
                  _retrieveData();
                  return Container(
                    padding: const EdgeInsets.all(16.0),
                    alignment: Alignment.center,
                    child: const SizedBox(
                      width: 24.0,
                      height: 24.0,
                      child: CircularProgressIndicator(strokeWidth: 2.0,),
                    ),
                  );
                } else {
                  return Container(
                    padding: const EdgeInsets.all(18.0),
                    alignment: Alignment.center,
                    child: const Text(
                      "没有更多了",
                      style: TextStyle(color: Colors.grey),
                    ),
                  );
                }
              }
              return ListTile(title: Text(_words[index]),);
            },
            separatorBuilder: (context, index) => Divider(height: .0,),
            itemCount: _words.length
        ),
      ),
    ]);
  }
}


