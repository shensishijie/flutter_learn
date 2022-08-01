import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:untitled/book_demo/book_manager_model.dart';
import 'package:untitled/book_demo/book_model.dart';
import 'package:untitled/joke_demo/joke_viewmodel.dart';
import 'package:untitled/provider_test/count_notifier.dart';
import 'package:untitled/provider_test/stream_provider_example.dart';
import 'package:untitled/provider_test/user_model3.dart';
import 'package:untitled/route/FileOperationRoute.dart';
import 'package:untitled/route/dialog_test.dart';
import 'package:untitled/route/gardient_btn_test.dart';
import 'package:untitled/route/getX_test.dart';
import 'package:untitled/route/nested_tab_bar_view.dart';
import 'package:untitled/route/provider_count_example.dart';
import 'package:untitled/route/sliver_test.dart';
import 'package:untitled/route/tab_view1.dart';
import 'package:untitled/route/tab_view2.dart';
import 'package:untitled/route/theme_test.dart';
import 'package:untitled/route/widget_test.dart';
import 'package:untitled/provider_test/use_model1.dart';
import 'package:untitled/provider_test/user_future.dart';
import 'package:untitled/provider_test/user_model2.dart';
import 'package:untitled/widget/Infinite_gridView.dart';
import 'package:untitled/widget/animated_list.dart';
import 'package:untitled/widget/focus_test.dart';
import 'package:untitled/widget/formtest.dart';
import 'package:untitled/widget/page_view.dart';
import 'package:untitled/widget/progress.dart';
import 'package:untitled/widget/scroll_notification_test.dart';
import 'package:untitled/widget/FutureBuilderRoute.dart';
import 'package:untitled/widget/HttpTestRoute.dart';
import 'package:untitled/widget/NotificationRoute.dart';
import 'package:untitled/route/ValueListenableRoute.dart';
import 'package:untitled/route/chip_test_route.dart';
import 'package:untitled/route/scaffold_route.dart';
import 'package:untitled/route/scroll_controller_test_route.dart';
import 'package:untitled/widget/InfiniteListView.dart';
import 'package:untitled/route/render_box_route.dart';

import 'book_demo/example.dart';
import 'joke_demo/joke_view.dart';
import 'provider_test/change_notifier_provider_example.dart';
import 'provider_test/future_provider_example.dart';
import 'movie/movie_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserModel1>(create: (_) => UserModel1()),
        FutureProvider(
          create: (_) => UserFuture().asyncGetUserModel2(),
          initialData: UserModel2(name: "hello"),
        ),
        StreamProvider<UserModel3>(
          initialData: UserModel3(name: "hello"),
          create: (_) => UserStream().getStreamUserModel(),
        ),
        Provider(create: (_) => BookModel(),),
        ChangeNotifierProxyProvider<BookModel, BookManagerModel>(
          create: (_) => BookManagerModel(BookModel()),
          update: (_, bookModel, bookManagerModel) => BookManagerModel(bookModel),
        ),
        ChangeNotifierProvider(
          create: (_) => JokeViewModel(),
        ),
      ],
      child: GetMaterialApp(
        title: 'Flutter Demo',
        initialRoute: "/",
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        routes: {
          "new_page": (context) => NewRoute(),
          "ValueListenableRoute": (context) => const ValueListenableRoute(),
          "FileOperationRoute" : (context) => const FileOperationRoute(),
          "HttpTestRoute" : (context) => HttpTestRoute(),
          "RenderBoxTestRoute": (context) => RenderBoxTestRoute(),
          "ChipTestRoute": (context) => ChipTestRoute(),
          "ScaffoldRoute": (context) => ScaffoldRoute(),
          "ScrollControllerTestRoute": (context) => ScrollControllerTestRoute(),
          "TabViewRoute1": (context) => TabViewRoute1(),
          "TabViewRoute2": (context) => TabViewRoute2(),
          "WidgetTestRoute": (context) => WidgetTestRoute(),
          "SliverTest": (context) => SliverTest(),
          "NestedTabBarView": (context) => NestedTabBarView(),
          "ThemeTestRoute": (context) => ThemeTestRoute(),
          "DialogTest": (context) => DialogTest(),
          "GradientButtonRoute": (context) => GradientButtonRoute(),
          "getXTestRoute": (context) => getXTestRoute(),
          "MovieListView": (context) => MovieListView(),
          "ProviderCountExample": (context) => ProviderCountExample(),
          "ChangeNotifierProviderExample": (context) => ChangeNotifierProviderExample(),
          "FutureProviderExample": (context) => FutureProviderExample(),
          "StreamProviderExample": (context) => StreamProviderExample(),
          "ChangeNotifierProxyProviderExample": (context) => ChangeNotifierProxyProviderExample(),
          "JokeView": (context) => JokeView(),
          // "/": (context) => MyHomePage(title: "Flutter Demo Home Page"),
        },
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
        //home: RouterTestRoute(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            TextButton(
              child: Text("open new route"),
              onPressed: () {
                Navigator.pushNamed(context, "JokeView");
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) {
                //     return NewRoute();
                //   }),
                // );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class NewRoute extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Route'),
      ),
      body: buildTwoSliverList(),
    );
  }
}

class TipRoute extends StatelessWidget {
  const TipRoute({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("提示"),
      ),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(text),
              ElevatedButton(onPressed: () => Navigator.pop(context, "我是返回值"),
                  child: Text("返回"))
            ],
          ),
        ),
      ),
    );
  }
}

class RouterTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('New Route'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () async {
              var result = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return TipRoute(text: "我是提示000000");
                  })
              );
              print("路由返回值： $result");
            },
            child: Text("打开提示页"),
          ),
        )
    );
  }
}

class _GestureRecognizer extends StatefulWidget {
  const _GestureRecognizer({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _GestureRecognizerState();
  }
}

class _GestureRecognizerState extends State<_GestureRecognizer> {

  TapGestureRecognizer _tapGestureRecognizer = TapGestureRecognizer();
  bool _toggle = false;


  @override
  void dispose() {
    _tapGestureRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(text: "你好世界"),
            TextSpan(
              text: "点我变色",
              style: TextStyle(
                fontSize: 30.0,
                color: _toggle ? Colors.blue : Colors.red,
              ),
              recognizer: _tapGestureRecognizer
                ..onTap = () {
                  setState(() {
                    _toggle = !_toggle;
                  });
                }
            ),
            TextSpan(text: "你好世界"),
          ]
        ),
      ),
    );
  }
}

Widget buildTwoSliverList() {
  var listView = SliverFixedExtentList(
    itemExtent: 56,
    delegate: SliverChildBuilderDelegate(
        (_, index) => ListTile(title: Text('$index'),),
        childCount: 10,
    ),
  );

  return CustomScrollView(
    slivers: [
      listView,
      listView,
    ],
  );
}



