
import 'package:flukit/example/common/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SliverTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return getMaterial2();
  }
}

Widget getMaterial1() {
  return Material(
    child: CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          expandedHeight: 250,
          flexibleSpace: FlexibleSpaceBar(
            title: Text('Demo'),
            background: Image.asset("imgs/avatar.png",
              fit: BoxFit.cover,),

          ),
        ),
        SliverPadding(
          padding: EdgeInsets.all(8.0),
          sliver: SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 4.0
            ),
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.cyan[100 * (index % 9)],
                  child: Text('grid item $index'),
                );
              },
              childCount: 20,
            ),
          ),
        ),
        SliverFixedExtentList(
          itemExtent: 50.0,
          delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
              return Container(
                alignment: Alignment.center,
                color: Colors.lightBlue[100 * (index % 9)],
                child: Text('list item $index'),
              );
            },
            childCount: 20,
          ),
        ),
      ],
    ),
  );
}

Widget getMaterial2() {
  return Material(
    child: NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            title: Text('嵌套listView'),
            pinned: true,
            forceElevated: innerBoxIsScrolled,
          ),
          buildSliverList(5),
        ];
      },
      body: ListView.builder(
        padding: EdgeInsets.all(8.0),
        physics: ClampingScrollPhysics(),
        itemCount: 30,
        itemBuilder: (BuildContext context, int index) {
          return SizedBox(
            height: 50,
            child: Center(child: Text('Item $index'),),
          );
        },
      ),
    ),
  );
}