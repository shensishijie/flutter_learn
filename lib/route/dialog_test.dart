
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogTest extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DialogTestState();
  }
}

class _DialogTestState extends State<DialogTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("对话框"),),
      body: Padding(
        padding: EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text("对话框1"),
              onPressed: () async {
                bool? delete = await showDeleteConfirmDialog1();
                if (delete == null) {
                  print("取消删除");
                } else {
                  print("已确认删除");
                }
              },
            ),
            ElevatedButton(onPressed: () => changeLanguage(), child: Text("对话框2")),
            ElevatedButton(onPressed: () => showListDialog(), child: Text("对话框（列表）")),
            ElevatedButton(
              child: Text("对话框(带复选框）"),
              onPressed: () async {
                bool? deleteTree = await showDeleteConfirmDialog3();
                if (deleteTree == null) {
                  print("取消删除");
                } else {
                  print("同时删除子目录：$deleteTree");
                }
              },
            ),
            ElevatedButton(
              child: Text("显示底部菜单"),
              onPressed: () async {
                int? type = await _showModalBottomSheet();
                print(type);
              },
            ),
            ElevatedButton(onPressed: () => showLoadingDialog(), child: Text("loading框")),
            ElevatedButton(onPressed: () => showLoadingDialog2(), child: Text("loading框(可改变宽度)")),
            ElevatedButton(
              child: Text("日期选择器"),
              onPressed: () async {
                DateTime? date = await showDatePicker1();
                print(date);
              },
            ),
            ElevatedButton(
              child: Text("日期选择器(ios)"),
              onPressed: () async {
                DateTime? date = await showDatePicker2();
                print(date);
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<bool?> showDeleteConfirmDialog1() {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("提示"),
          content: Text("确认删除？"),
          actions: [
            TextButton(
              child: Text("取消"),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: Text("确认"),
              onPressed: () => Navigator.of(context).pop(true),
            ),
          ],
        );
      }
    );
  }

  Future<void> changeLanguage() async {
    int? i = await showDialog<int>(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: Text("请选择语言"),
          children: [
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, 1);
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 6.0),
                child: Text("中文简体"),
              ),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, 2);
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 6.0),
                child: Text("美国英语"),
              ),
            ),
          ],
        );
      }
    );
    if (i != null) {
      print("选择了： ${i == 1 ? "中文简体" : "美国英语"}");
    }
  }

  Future<void> showListDialog() async {
    int? index = await showDialog<int>(
      context: context,
      builder: (context) {
        var child = Column(
          children: [
            ListTile(title: Text("请选择"),),
            Expanded(
              child: ListView.builder(
                itemCount: 30,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text("$index"),
                    onTap: () => Navigator.of(context).pop(index),
                  );
                },
              ),
            ),
          ],
        );
        return Dialog(child: child,);
        // return UnconstrainedBox(
        //   constrainedAxis: Axis.vertical,
        //   child: ConstrainedBox(
        //     constraints: BoxConstraints(maxWidth: 280, maxHeight: 400),
        //     child: Material(
        //       child: child,
        //       type: MaterialType.card,
        //     ),
        //   ),
        // );
      }
    );
    if (index != null) {
      print("点击了：$index");
    }
  }

  Future<bool?> showDeleteConfirmDialog3() {
    bool _withTree = false;
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("提示"),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("确认删除当前文件？"),
                Row(
                  children: [
                    Text("同时删除子目录"),
                    Builder(
                      builder: (BuildContext context) {
                        return Checkbox(
                            value: _withTree,
                            onChanged: (value) {
                              (context as Element).markNeedsBuild();
                              _withTree = !_withTree;
                            });
                      }
                    ),
                  ],
                ),
              ],
            ),
            actions: [
              TextButton(onPressed: () => Navigator.of(context).pop(), child: Text("取消")),
              TextButton(
                child: Text("删除"),
                onPressed: () {
                  Navigator.of(context).pop(_withTree);
                },
              ),
            ],
          );
        }
    );
  }

  Future<int?> _showModalBottomSheet() {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return ListView.builder(
            itemCount: 30,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text("$index"),
                onTap: () => Navigator.of(context).pop(index),
              );
            },
          );
        });
  }

  showLoadingDialog() {
    showDialog(
      context: context,
      barrierDismissible: true,//设置为false将无法点击外部关闭
      builder: (context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(),
              Padding(
                padding: EdgeInsets.only(top: 26.0),
                child: Text("加载中。。。"),
              ),
            ],
          ),
        );
      }
    );
  }

  showLoadingDialog2() {
    showDialog(
        context: context,
        barrierDismissible: true,//设置为false将无法点击外部关闭
        builder: (context) {
          return UnconstrainedBox(
            constrainedAxis: Axis.vertical,
            child: SizedBox(
              width: 280,
              child: AlertDialog(
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircularProgressIndicator(),
                    Padding(
                      padding: EdgeInsets.only(top: 26.0),
                      child: Text("加载中。。。"),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
    );
  }

  Future<DateTime?> showDatePicker1() {
    var date = DateTime.now();
    return showDatePicker(
      context: context,
      initialDate: date,
      firstDate: date,
      lastDate: date.add(
        Duration(days: 30),
      )
    );
  }

  Future<DateTime?> showDatePicker2() {
    var date = DateTime.now();
    return showCupertinoModalPopup(
        context: context,
        builder: (ctx) {
          return SizedBox(
            height: 200,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.dateAndTime,
              minimumDate: date,
              maximumDate: date.add(
                Duration(days: 30),
              ),
              maximumYear: date.year + 1,
              onDateTimeChanged: (DateTime value) {
                print(value);
              },
            ),
          );
        }
    );
  }
}