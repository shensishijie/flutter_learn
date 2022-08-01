

import 'package:flutter/cupertino.dart';

class InheritedProvider<T> extends InheritedWidget {
  InheritedProvider({
    required this.data,
    required Widget child}) : super(child: child);

  final T data;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}
//
// class ChangeNotifierProvider<T extends ChangeNotifier> extends StatefulWidget{
//   ChangeNotifierProvider({Key? key,
//     required this.data,
//     required this.child});
//
//   final T data;
//   final Widget child;
//
//   static T of<T>(BuildContext context) {
//     final type = _typeof<InheritedProvider<T>>();
//     final provider = context.dependOnInheritedWidgetOfExactType<InheritedProvider<T>>();
//     return provider.data;
//   }
//
//   @override
//   _ChangeNotifierProviderState<T> createState() => _ChangeNotifierProviderState<T>();
//
//
// }
//
// class _ChangeNotifierProviderState<T extends ChangeNotifier> extends State<ChangeNotifierProvider<T>> {
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     throw UnimplementedError();
//   }
//
// }