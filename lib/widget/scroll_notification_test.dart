
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScrollNotificationTestRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ScrollNotificationTestRouteState();
  }
}

class _ScrollNotificationTestRouteState extends State<ScrollNotificationTestRoute> {
  String _progress = "0%";
  bool showProgress = false;

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification notification) {
          double progress = notification.metrics.pixels / notification.metrics.maxScrollExtent;
          if (notification is ScrollUpdateNotification) {
            setState(() {
              _progress = "${(progress * 100).toInt()}%";
              showProgress = true;
            });
          } else if (notification is ScrollEndNotification) {
            setState(() {
              showProgress = false;
            });
          }
          print("BottomEdge: ${notification.metrics.extentAfter == 0}");
          return false;
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            ListView.builder(
              itemCount: 100,
              itemExtent: 50.0,
              itemBuilder: (context, index) {
                return ListTile(title: Text("$index"),);
              }
            ),
            // CircleAvatar(
            //   //显示进度百分比
            //   radius: 30.0,
            //   child: Text(_progress),
            //   backgroundColor: Colors.black54,
            // ),
            Visibility(
              visible: showProgress,
              child: CircleAvatar(
                radius: 30.0,
                child: Text(_progress),
                backgroundColor: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}