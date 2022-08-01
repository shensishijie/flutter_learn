
import 'package:flukit/flukit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabViewRoute1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TabViewRoute1State();
  }
}

class TabViewRoute1State extends State<TabViewRoute1> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List tabs = <String>['新闻', '历史', '图片'];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App Name'),
        bottom: TabBar(
          controller: _tabController,
          tabs: tabs.map((e) => Tab(text: e,)).toList(),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: tabs.map((e) {
          return KeepAliveWrapper(
            child: Container(
            alignment: Alignment.center,
            child: Text(e, textScaleFactor: 5,),
            ),
          );
        }).toList(),
      ),

    );
  }

}