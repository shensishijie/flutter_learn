
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NotificationRouteState();
  }

}

class MyNotification extends Notification {
  MyNotification(this.msg);
  final String msg;
}

class NotificationRouteState extends State<NotificationRoute> {
  String _msg = "";
  @override
  Widget build(BuildContext context) {
    return NotificationListener<MyNotification> (
      onNotification: (notification) {
        setState(() {
          _msg += notification.msg+" ";
        });
        return true;
      },
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Builder(
              builder: (context) {
                return ElevatedButton(onPressed: () => MyNotification("hi").dispatch(context),
                    child: Text("Send Notification"));
              },
            ),
            Text(_msg),
          ],
        ),
      ),
    );
  }
}