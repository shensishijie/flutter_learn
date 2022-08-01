
import 'package:flutter/cupertino.dart';

class UserModel1 with ChangeNotifier {
  String name = "Jimi";

  void changeName() {
    name = "hello";
    notifyListeners();
  }

}