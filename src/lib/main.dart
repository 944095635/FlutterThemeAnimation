import 'dart:io';

import 'package:flutter/material.dart';
import 'package:theme_animation/background.dart';
import 'package:theme_animation/helper/circle_path.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  //是否黑色主题
  var isDark = false;
  //动画
  late CurvedAnimation animation;
  //动画控制器
  late AnimationController controller;
  //late AnimationController colorController;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 500,
      ),
    );
    animation = CurvedAnimation(
      parent: controller,
      curve: Curves.decelerate,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          fit: StackFit.expand,
          children: [
            const Background(
              leftColor: [Colors.white, Colors.white],
              rightColor: Color(0x44FFFFFF),
            ),
            AnimatedBuilder(
              animation: animation,
              builder: (context, child) {
                return ClipPath(
                  clipper: CirclePath(animation.value),
                  child: const Background(
                    leftColor: [
                      Color(0xFF171523),
                      Color(0xFF232230),
                      Color(0xFF292836),
                      Color(0xFF2F2E3C)
                    ],
                    rightColor: Color(0xFF151221),
                  ),
                );
              },
            ),
            //内容区域
            Row(
              children: const [
                SizedBox(
                  width: 216,
                ),
                Expanded(
                  child: Expanded(
                    child: Text("XXX"),
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: SizedBox(
                width: 64,
                height: 64,
                child: IconButton(
                  onPressed: () {
                    changeTheme();
                  },
                  icon: Icon(
                    Icons.style,
                    color: isDark ? Colors.white : Colors.black,
                  ),
                ),
              ),
            ),
            if (Platform.isWindows || Platform.isLinux || Platform.isMacOS)
              const Align(
                alignment: Alignment.topCenter,
                // child: BackTitle(),
              ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            changeTheme();
          },
          tooltip: '主题',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  //修改主题
  changeTheme() {
    setState(() {
      if (isDark) {
        isDark = false;
        controller.reverse();
        //Get.changeTheme(Themes.green);
        //Get.changeTheme(ThemeData.light().copyWith(brightness: Brightness.light));
      } else {
        isDark = true;
        controller.forward();
        //Get.changeTheme(Themes.black);
        //Get.changeTheme(ThemeData.dark().copyWith(brightness: Brightness.dark));
      }
    });
  }
}
