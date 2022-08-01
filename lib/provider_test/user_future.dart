
import 'package:untitled/provider_test/user_model2.dart';

class UserFuture {

  Future<UserModel2> asyncGetUserModel2() async {
    await Future.delayed(Duration(milliseconds: 2000));
    print("asyncGetUserModel2");
    return UserModel2(name: "获取新的数据");
  }
}