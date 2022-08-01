
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProgressRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProgressRouteState();
  }
}

class _ProgressRouteState extends State<ProgressRoute> with SingleTickerProviderStateMixin{
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3)
    );
    _animationController.forward();
    _animationController.addListener(() { setState(() {});});
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
   return SingleChildScrollView(
     child: Column(
       children: [
         Padding(
           padding: EdgeInsets.all(16),
           child: LinearProgressIndicator(
             backgroundColor: Colors.grey[200],
             valueColor: ColorTween(begin: Colors.grey, end: Colors.blue)
              .animate(_animationController),
             value: _animationController.value,
           ),
         ),
       ],
     ),
   );
  }
}
