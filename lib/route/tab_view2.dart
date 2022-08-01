
import 'package:flukit/flukit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabViewRoute2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List tabs = ['新闻', '历史', '图片'];
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text('App Name'),
          bottom: TabBar(
            tabs: tabs.map((e) => Tab(text: e,)).toList(),
          ),
        ),
        body: TabBarView(
          children: tabs.map((e) {
            return KeepAliveWrapper(
            child: Container(
              alignment: Alignment.center,
              child: Text(e, textScaleFactor: 5,),
          ),
          );
          }).toList(),
        ),
      ),
    );
  }

}
