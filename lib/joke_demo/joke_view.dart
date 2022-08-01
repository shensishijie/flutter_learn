
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/joke_demo/joke_item.dart';
import 'package:untitled/joke_demo/joke_service.dart';
import 'package:untitled/joke_demo/joke_viewmodel.dart';

class JokeView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _JokeViewState();
  }

}

class _JokeViewState extends State<JokeView> {

  @override
  void initState() {
    super.initState();
    JokeService.getJokes(Provider.of<JokeViewModel>(context, listen: false));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Provider + MVVM"),),
      body: Consumer<JokeViewModel>(
        builder: (_, jokeViewModel, child) {
          JokeViewModel _jokeViewModel = jokeViewModel;

          if (jokeViewModel.loading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView.separated(
            itemBuilder: (_, index) {
              _jokeViewModel.setJoke(_jokeViewModel.jokeList![index]);
              return JokeItem(jokeViewModel: _jokeViewModel,);
            },
            itemCount: _jokeViewModel.jokeList?.length ?? 0,
            separatorBuilder: (_, index) {
              return const Divider(
                height: 1,
              );
            },
          );
        },
      ),
    );
  }
}