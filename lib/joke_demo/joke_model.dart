
import 'dart:convert';

import 'package:flutter/material.dart';

JokeModel jokeModelFromJson(String str) => JokeModel.fromJson(json.decode(str));

String jokeModelToJson(JokeModel data) => json.encode(data.toJson());

class JokeModel {
  JokeModel({
    this.data,
});

  final List<Joke>? data;

  factory JokeModel.fromJson(Map<String, dynamic> json) => JokeModel(
      data: List<Joke>.from(json["data"].map((e) => Joke.formJson(e))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((e) => e.toJson())),
  };
}

class Joke {
  Joke({
    this.content,
    this.hashId,
    this.unixtime,
    this.updatetime,
  });

  final String? content;
  final String? hashId;
  final int? unixtime;
  final String? updatetime;

  factory Joke.formJson(Map<String, dynamic> json) => Joke(
    content: json["content"],
    hashId: json["hashId"],
    unixtime: json["unixtime"],
    updatetime: json["updatetime"],
  );

  Map<String, dynamic> toJson() => {
    "content": content,
    "hashId": hashId,
    "unixtime": unixtime,
    "updatetime": updatetime,
  };
}