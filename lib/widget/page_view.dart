
import 'package:flutter/cupertino.dart';

class Page extends StatefulWidget {
  const Page({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  State<StatefulWidget> createState() {
    return _PageState();
  }
}

class _PageState extends State<Page> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext) {
    print('build ${widget.text}');
    return Center(child: Text('${widget.text}', textScaleFactor: 5,),);
  }

  @override
  bool get wantKeepAlive => true;

}

class PageViewRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PageViewRouteState();
  }
}

class _PageViewRouteState extends State<PageViewRoute> {

  @override
  Widget build(BuildContext context) {
    var children = <Widget>[];
    for (int i = 1; i < 5; i++) {
      children.add(Page(text: '$i',));
    }

    return PageView(
      children: children,
    );
  }
}