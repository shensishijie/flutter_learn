//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class AfterLayoutRoute extends StatefulWidget {
//   const AfterLayoutRoute({Key? key}) : super(key: key);
//
//   @override
//   State<StatefulWidget> createState() {
//     return _AfterLayoutRouteState();
//   }
//
// }
//
// class _AfterLayoutRouteState extends State<AfterLayoutRoute> {
//   String _text = 'flutter 实战';
//   Size _size = Size.zero;
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Padding(
//           padding: EdgeInsets.all(8.0),
//           child: Builder(
//             builder: (context) {
//               return GestureDetector(
//                 child: const Text(
//                   'Text1: 点我获取我的大小',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(color: Colors.blue),
//                 ),
//                 onTap: () => print("Text1: ${context.size}"),
//               );
//             },
//           ),
//         ),
//         AfterLayout(
//         )
//       ],
//     );
//   }
// }