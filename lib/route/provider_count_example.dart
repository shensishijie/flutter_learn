
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/provider_test/count_notifier.dart';

class ProviderCountExample extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProviderCountExampleState();
  }
}

class _ProviderCountExampleState extends State<ProviderCountExample> {

  @override
  Widget build(BuildContext context) {

    final counter = Provider.of<CountNotifier>(context);

    return Scaffold(
      appBar: AppBar(title: Text("InheritedWidget"),),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counter.increment();
        },
        child: Icon(Icons.add),
      ),
      body: Center(
        child: Text(
          counter.count.toString(),
          style: const TextStyle(
            color: Colors.red,
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}