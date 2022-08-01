
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChipData {
  final String id;
  final String name;
  ChipData({required this.id, required this.name});
}

class ChipTestRoute extends StatefulWidget {
  const ChipTestRoute({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ChipTestRouteState();
  }
}

class _ChipTestRouteState extends State<ChipTestRoute> {

  final List<ChipData> _list = [];
  final TextEditingController _textEditingController = TextEditingController();

  void _addNewChip() async{
    await showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: const Text("添加"),
            content: TextField(
              controller: _textEditingController,
            ),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _list.add(ChipData(
                          id: DateTime.now().toString(),
                          name: _textEditingController.text));
                    });
                    _textEditingController.text = "";
                    Navigator.pop(context);
                  },
                  child: const Text("提交"))
            ],
          );
        }
    );
  }

  void _deleteChip(String id) {
    setState(() {
      _list.removeWhere((element) => element.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Chap测试"),),
      body: Padding(
        padding: EdgeInsets.all(18.0),
        child: Wrap(
          spacing: 10,
          children: _list.map((e) => Chip(
              key: ValueKey(e.id),
              label: Text(e.name),
              backgroundColor: Colors.black12,
              padding: const EdgeInsets.symmetric(vertical: 7.0, horizontal: 10.0),
              deleteIconColor: Colors.red,
              onDeleted: () => _deleteChip(e.id),
            )).toList()
          ,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addNewChip,
        child: const Icon(Icons.add),
      ),
    );
  }
}