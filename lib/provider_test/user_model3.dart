
class UserModel3 {
  UserModel3({this.name});

  String? name = "Jimi";

  void changeName() {
    print("changeName");
    name = "hello";
  }
}

class UserStream {
  Stream<UserModel3> getStreamUserModel() {
    print("getStreamUserModel");
    return Stream<UserModel3>.periodic(Duration(milliseconds: 1000),
        (value) => UserModel3(name: "$value")).take(10);
  }
}
