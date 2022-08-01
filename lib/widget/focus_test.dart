
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FocusTestRoute extends StatefulWidget {
  const FocusTestRoute({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _FocusTestRouteState();
  }
}

class _FocusTestRouteState extends State<FocusTestRoute> {
  FocusNode focusNode1 = FocusNode();
  FocusNode focusNode2 = FocusNode();
  FocusScopeNode? focusScopeNode;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(18),
      child: Column(
        children: [
          TextField(
            autofocus: true,
            focusNode: focusNode1,
            decoration: InputDecoration(
              labelText: "input1"
            ),
          ),
          TextField(
            focusNode: focusNode2,
            decoration: InputDecoration(
                labelText: "input2"
            ),
          ),
          Builder(builder: (ctx){
            return Column(
              children: [
                ElevatedButton(
                  child: Text("移动焦点"),
                  onPressed: () {
                    FocusScope.of(context).requestFocus(focusNode2);
                  },
                ),
                ElevatedButton(
                  child: Text("隐藏键盘"),
                  onPressed: () {
                    focusNode1.unfocus();
                    focusNode2.unfocus();
                  },
                ),
              ],
            );
          }),
        ],
      ),
    );
  }
}