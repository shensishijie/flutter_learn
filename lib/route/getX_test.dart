
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/route/render_box_route.dart';

class getXTestRoute extends StatefulWidget {
  const getXTestRoute({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _getXTestRouteState();
  }
}

class Teacher {
  var name = "Jimi".obs;
  var age = 18.obs;
}

class MyController extends GetxController {
  var teacher = Teacher();

  void convertToUpperCase() {
    teacher.name.value = teacher.name.value.toUpperCase();
    update();
  }
}

class WorkersController extends GetxController {
  var count = 0.obs;

  void increment() {
    count++;
  }

  @override
  void onInit() {
    super.onInit();

    // 监听count的值,当它发生改变的时候调用
    ever(count, (callback) => print("ever----$count"));

    // 监听多个值,当它们发生改变的时候调用
    everAll([count], ((callback) => print("everAll---$count")));

    // count值改变时调用,只执行一次
    once(count, (callback) => print("once---$count"),);

    //用户停止打字时1秒后调用，主要是用放DDos
    debounce(count, (callback) => print("debounce---$count"),);

    //忽略3秒内所有变动
    interval(count, (callback) => print("interval---$count"), time: Duration(seconds: 3));

  }
}

class MyLifecycleController extends GetxController {
  var count = 0;

  void increment() async {
    await Future.delayed(Duration(seconds: 5));
      count++;
      update();
  }

  void cleanTask() {
    print("清除了任务");
  }

  @override
  void onInit() {
    super.onInit();
    print("初始化");
  }

  @override
  void onReady() {
    super.onReady();
    print("加载完成");
  }

  @override
  void onClose() {
    super.onClose();
    print("控制器被释放");
  }
}

class CountController extends GetxController {
  var count = 0;

  void increment() {
    count++;
    update(['jimi_count']);
  }

}

class _getXTestRouteState extends State<getXTestRoute> {
  GlobalKey<NavigatorState> _navKey = GlobalKey();
  var count = 0.obs;

  MyController myController = Get.put(MyController());
  WorkersController workersController = Get.put(WorkersController());
  MyLifecycleController myLifecycleController = Get.put(MyLifecycleController());
  CountController countController = Get.put(CountController());

  void increment() {
    count++;
  }

  @override
  Widget build(BuildContext context) {
    print("build");

    return Scaffold(
      appBar: AppBar(title: Text("getX测试"),),
      body: Scrollbar(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(18.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: (){
                  Get.snackbar("SnackBar 标题", "欢迎使用snackBar");
                },
                  child: const Text("显示 SnackBar"),
                ),
                ElevatedButton(onPressed: (){
                  Get.defaultDialog();
                },
                  child: const Text("显示 dialog"),
                ),
                ElevatedButton(onPressed: (){
                  Get.bottomSheet(
                    Container(
                      child: Wrap(
                        children: [
                          ListTile(
                            leading: Icon(Icons.wb_sunny_outlined),
                            title: Text("白天模式"),
                            onTap: () {
                              Get.changeTheme(ThemeData.light());
                            },
                          ),
                          ListTile(
                            leading: Icon(Icons.wb_sunny),
                            title: Text("黑夜模式"),
                            onTap: () {
                              Get.changeTheme(ThemeData.dark());
                            },
                          ),
                        ],
                      ),
                    )
                  );
                },
                  child: const Text("Bottom Sheet"),
                ),
                ElevatedButton(onPressed: (){
                  Get.to(RenderBoxTestRoute());
                },
                  child: const Text("路由跳转"),
                ),
                Obx(() => Text.rich(TextSpan(
                  children: [
                    TextSpan(text: "count的值为："),
                    TextSpan(
                      text: "$count",
                      style: const TextStyle(
                        color: Colors.red,
                        fontSize: 20
                      )
                    ),
                  ]
                )
                )),
                SizedBox(height: 20,),
                ElevatedButton(
                  child: Text("点我加1"),
                  onPressed: () {
                    increment();
                  },
                ),
                GetBuilder<MyController>(
                  init: myController,
                  builder: (context) {
                    return Text(
                      "我的名字是${myController.teacher.name}",
                      style: TextStyle(color: Colors.green, fontSize: 30),
                    );
                  },
                ),
                SizedBox(height: 20,),
                ElevatedButton(
                  onPressed: () {
                    myController.convertToUpperCase();
                  },
                  child: Text("转换为大写"),
                ),
                ElevatedButton(
                  onPressed: () => workersController.increment(),
                  child: Text("增加"),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: TextField(
                    onChanged: (val) {
                      workersController.increment();
                    },
                  ),
                ),
                GetBuilder<MyLifecycleController>(
                  initState: (_) => myLifecycleController.increment(),
                  dispose: (_) => myLifecycleController.cleanTask(),
                  builder: (controller) {
                    return Text(
                      "计数器值为：${myLifecycleController.count}",
                      style: TextStyle(color: Colors.green, fontSize: 24),
                    );
                  },
                ),
                GetBuilder<CountController>(
                  builder: ((controller) {
                    return Text(
                      "计数器的值为：${controller.count}",
                      style: TextStyle(color: Colors.red, fontSize: 24),
                    );
                  }),
                ),
                GetBuilder<CountController>(
                  id: 'jimi_count',
                  builder: (controller) {
                    return Text(
                      "计数器的值为${controller.count}",
                      style: TextStyle(color: Colors.green, fontSize: 24),
                    );
                  },
                ),
                ElevatedButton(
                  child: Text("增加"),
                  onPressed: () => countController.increment(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
