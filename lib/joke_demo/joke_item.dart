

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/joke_demo/joke_viewmodel.dart';

class JokeItem extends StatelessWidget {
  const JokeItem({Key? key, this.jokeViewModel}) : super(key: key);

  final JokeViewModel? jokeViewModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 18.0,
        right: 18.0,
        top: 10.0,
        bottom: 10.0
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(jokeViewModel?.joke.content ?? "",
            style: const TextStyle(
              color: Colors.black87,
              letterSpacing: 1.3,
              wordSpacing: 2
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(jokeViewModel?.joke.updatetime ?? "--"),
        ],
      ),
    );
  }

}