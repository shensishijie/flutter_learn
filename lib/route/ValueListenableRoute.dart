
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ValueListenableRoute extends StatefulWidget {
  const ValueListenableRoute({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _ValueListenableState();
  }

}

class _ValueListenableState extends State<ValueListenableRoute> {

  final ValueNotifier<int> _counter = ValueNotifier<int>(0);
  static const double textScaleFactor = 1.5;

  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      appBar: AppBar(title: Text("ValueListenableBuilder 测试"),),
      body: Center(
        child: ValueListenableBuilder<int>(
          builder: (BuildContext context, int value, Widget? child) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                child!,
                Text("$value 次", textScaleFactor: textScaleFactor,)
              ],
            );
          },
          valueListenable: _counter,
          child: const Text("点击了", textScaleFactor: textScaleFactor,),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _counter.value++,
      ),
    );
  }

}