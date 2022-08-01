
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InfiniteGridView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return InfiniteGridViewState();
  }
}

class InfiniteGridViewState extends State<InfiniteGridView>{
  List<IconData> _icons = [];


  @override
  void initState() {
    super.initState();
    _retrieveIcons();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1.0,
        ),
        itemCount: _icons.length,
        itemBuilder: (context, index) {
          if (index == _icons.length - 1 && _icons.length < 20) {
            _retrieveIcons();
          }
          return Icon(_icons[index]);
        }
    );
  }

  void _retrieveIcons() {
    Future.delayed(Duration(milliseconds: 200)).then((e) {
      setState(() {
        _icons.addAll([
          Icons.ac_unit,
          Icons.animation,
          Icons.accessible_forward_rounded,
          Icons.settings,
          Icons.back_hand,
          Icons.print
        ]);
      });
    });
  }
}