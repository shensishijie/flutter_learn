
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/widget/nav_bar.dart';

class RenderBoxTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("RenderBoxTestRoute"),
      ),
      body: SingleChildScrollViewTest(),
    );
  }
}

class SingleChildScrollViewTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scrollbar(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(18.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ConstrainedBox(
                  constraints: const BoxConstraints(
                    minWidth: double.infinity,
                    minHeight: 50.0,
                  ),
                  child: redBox,
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 80,
                  width: 80,
                  child: redBox,
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(" hello world "),
                        Text(" I am Jack "),
                      ],
                    ),
                    Row(
                      children: const [
                        Text(" hello world "),
                        Text(" I am Jack "),
                      ],
                    ),
                    Row(
                      textDirection: TextDirection.rtl,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Text(" hello world "),
                        Text(" I am Jack "),
                      ],
                    ),
                    Row(
                      verticalDirection: VerticalDirection.up,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(" hello world ", style: TextStyle(fontSize: 40),),
                        Text(" I am Jack "),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: 200,
                  height: 100,
                  color: Colors.green,
                  child: Padding(
                    padding: EdgeInsets.all(18.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          color: Colors.red,
                          child: Column(
                            children: const [
                              Text("hello world "),
                              Text("I am Jack "),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: 200,
                  height: 100,
                  color: Colors.green,
                  child: Padding(
                    padding: EdgeInsets.all(18.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Container(
                            color: Colors.red,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text("hello world "),
                                Text("I am Jack "),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 30,
                        color: Colors.red,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        height: 30,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: SizedBox(
                    height: 100,
                    child: Column(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                            color: Colors.red,
                          ),
                        ),
                        const Spacer(
                          flex: 1,
                        ),
                        Expanded(
                          child: Container(
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Wrap(
                  spacing: 8.0,
                  runSpacing: 4.0,
                  alignment: WrapAlignment.center,
                  children: const [
                    Chip(
                      avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text("A"),),
                      label: Text('Hhhhhhhhh'),
                    ),
                    Chip(
                      avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text('B'),),
                      label: Text("Bbbbbbbbb"),
                    ),
                    Chip(avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text("V"),),
                      label: Text("Cccccccccc"),
                    ),
                    Chip(avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text("D"),),
                      label: Text("Dddddddddd"),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  // height: 120.0,
                  // width: 120.0,
                  color: Colors.blue.shade50,
                  child: const Align(
                    widthFactor: 2,
                    heightFactor: 2,
                    alignment: Alignment.topRight,
                    child: FlutterLogo(
                      size: 60,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                DecoratedBox(
                  decoration:BoxDecoration(
                    gradient: LinearGradient(colors: [Colors.red, Colors.orange.shade700]),
                    borderRadius: BorderRadius.circular(3.0),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black54,
                        offset: Offset(2.0, 2.0),
                        blurRadius: 4.0
                      )
                    ]
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 18.0),
                    child: Text("login", style: TextStyle(color: Colors.white),),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 50, left: 40.0),
                  constraints: const BoxConstraints.tightFor(width: 200.0, height: 150.0),
                  decoration: const BoxDecoration(
                    gradient: RadialGradient(
                      colors: [Colors.red, Colors.orange],
                      center: Alignment.topLeft,
                      radius: .98,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black54,
                        offset: Offset(2.0, 2.0),
                        blurRadius: 4.0
                      ),
                    ]
                  ),
                  transform: Matrix4.rotationZ(.2),
                  alignment: Alignment.center,
                  child: const Text(
                    "5.20",
                    style: TextStyle(color: Colors.white, fontSize: 40.0),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                const NavBar(
                  color: Colors.blue,
                  title: "标题",
                ),
                const NavBar(
                  color: Colors.white,
                  title: "标题",
                ),

              ],
            ),
          ),
        ));
  }
}

Widget redBox = const DecoratedBox(
    decoration: BoxDecoration(color: Colors.red));

