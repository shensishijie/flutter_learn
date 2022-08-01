
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FutureBuilderRoute extends StatefulWidget {
  const FutureBuilderRoute({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _FutureBuilderRouteState();
  }
}

class _FutureBuilderRouteState extends State<FutureBuilderRoute> {
  Dio _dio = Dio();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: FutureBuilder(
        future: _dio.get("https://api.github.com/orgs/flutterchina/repos"),
        builder: (BuildContext context, AsyncSnapshot asyncSnapshot) {
          if (asyncSnapshot.connectionState == ConnectionState.done) {
            Response response = asyncSnapshot.data;
            if (asyncSnapshot.hasError) {
              return Text(asyncSnapshot.error.toString());
            }
            return ListView(
              children: response.data.map<Widget>((e) =>
              ListTile(title: Text(e["full_name"]),)).toList(),
            );
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}