
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WidgetTestRoute extends StatelessWidget {
  var img = AssetImage("imgs/avatar.png");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('WidgetTestRoute'),),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("hello world",
              textAlign: TextAlign.left,),
            Text("hello world! I'm Jack. " * 4,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const Text("hello world",
              textScaleFactor: 1.5,
            ),
            Text("hello world " * 8,
              textAlign: TextAlign.center,
            ),
            Text("hello world",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 18.0,
                height: 1.2,
                fontFamily: "Courier",
                background: Paint()..color = Colors.yellow,
                decoration: TextDecoration.underline,
                decorationStyle: TextDecorationStyle.dashed,
              ),
            ),
            const Text.rich(TextSpan(
              children: [
                TextSpan(
                  text: "Home: "
                ),
                TextSpan(
                  text: "https://flutterchina.club",
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                  recognizer: null
                ),
              ]
            )),
            DefaultTextStyle(
                style: const TextStyle(
                  color: Colors.red,
                  fontSize: 20.0,
                ),
                textAlign: TextAlign.start,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("hello world"),
                    Text("I am Jack"),
                    Text("I am Jack",
                      style: TextStyle(
                        inherit: false,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
            ),
            ElevatedButton(onPressed: () {},
                child: const Text("normal")),
            TextButton(onPressed: () {}, child: Text("normal")),
            OutlineButton(onPressed: () {}, child: Text("normal"),),
            IconButton(onPressed: () {}, icon: Icon(Icons.thumb_up)),
            ElevatedButton.icon(
              icon: Icon(Icons.send),
              label: Text("发送"),
              onPressed: () {},
            ),
            const Image(
              image: AssetImage("imgs/avatar.png"),
              width: 100,
            ),
            LinearProgressIndicator(
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation(Colors.blue),
            ),
            LinearProgressIndicator(
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation(Colors.blue),
              value: .5,
            ),
            const TextField(
              autofocus: true,
              decoration: InputDecoration(
                labelText: '用户名',
                hintText: '用户名或邮箱',
                prefixIcon: Icon(Icons.person)
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                labelText: '密码',
                hintText: '请输入密码',
                prefixIcon: Icon(Icons.lock)
              ),
              obscureText: true,
            ),

          ],
        ),
      ),
    );
  }

}