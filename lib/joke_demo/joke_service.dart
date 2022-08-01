
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:untitled/joke_demo/joke_model.dart';

import 'joke_viewmodel.dart';

class JokeService {
  static Future<void> getJokes(JokeViewModel jokeViewModel) async {
    var response = await Dio().get("http://v.juhe.cn/joke/content/"
        "text.php?page=1&pagesize=20&key=03303e4d34effe095cf6a4257474cda9");
    if (response.statusCode == 200) {
      JokeModel jokeModel = jokeModelFromJson(json.encode(response.data["result"]));
      jokeViewModel.setJokeList(jokeModel);
    }
  }
}