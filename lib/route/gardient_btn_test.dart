
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/widget/gradient_btn_widget.dart';

class GradientButtonRoute extends StatefulWidget {
  const GradientButtonRoute({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _GradientButtonRouteState();
  }
}

class _GradientButtonRouteState extends State<GradientButtonRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("GradientButton"),),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GradientButton(
            colors: [Colors.orange, Colors.red],
            height: 50.0,
            child: Text("submit"),
            onPressed: onTap,
          ),
          GradientButton(
            colors: [Colors.lightGreen, Colors.green.shade700],
            height: 50.0,
            child: Text("submit"),
            onPressed: onTap,
          ),
          GradientButton(
            colors: [Colors.lightBlue.shade300, Colors.blueAccent],
            height: 50.0,
            child: Text("submit"),
            onPressed: onTap,
          ),
        ],
      ),
    );
  }

  onTap() {
    print("button click");
  }
}