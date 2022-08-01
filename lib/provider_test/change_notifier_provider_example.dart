
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/provider_test/use_model1.dart';

class ChangeNotifierProviderExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ChangeNotifierProvider"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<UserModel1>(
              builder: (_, userModel, child) {
                return Text(
                  userModel.name,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 24,
                  ),
                );
              },
            ),
            Consumer<UserModel1>(
              builder: (_, userModel1, child) {
                return Padding(
                  padding: EdgeInsets.all(20.0),
                  child: ElevatedButton(
                    onPressed: () {
                      userModel1.changeName();
                    },
                    child: Text("改变值"),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
