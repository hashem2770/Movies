import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Controllers/nav-controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: GetBuilder<NavController>(
        init: NavController(),
          builder:(controller)=> Scaffold(
        body: controller.currentScreen,
        bottomNavigationBar: bottomNavigationBar(),
      )),
    );
  }

  Widget bottomNavigationBar() {
    return GetBuilder<NavController>(
      init: NavController(),
      builder: (controller) => BottomNavigationBar(
        backgroundColor: Colors.red,
        items: [
          BottomNavigationBarItem(
            activeIcon: Container(
                margin: const EdgeInsets.only(top: 8.0),
                child: Text(
                  'Popular',
                  style: TextStyle(color: Colors.white),
                )),
            label: '',
            icon: Container(
                margin: const EdgeInsets.only(top: 8.0),
                child: Icon(Icons.people)),
          ),
          BottomNavigationBarItem(
            activeIcon: Container(
                margin: const EdgeInsets.only(top: 8.0),
                child: Text(
                  'Playing Now',
                  style: TextStyle(color: Colors.white),
                )),
            label: '',
            icon: Container(
                margin: const EdgeInsets.only(top: 8.0),
                child: Icon(Icons.play_circle_filled)),
          ),
          BottomNavigationBarItem(
            activeIcon: Container(
                margin: const EdgeInsets.only(top: 8.0),
                child: Text(
                  'Top Rated',
                  style: TextStyle(color: Colors.white),
                )),
            label: '',
            icon: Container(
                margin: const EdgeInsets.only(top: 8.0),
                child: Icon(Icons.star_rate)),
          ),
        ],
        currentIndex: controller.navigatorValue,
        elevation: 0.0,
        onTap: (index) {
          controller.changeSelectedValue(index);
        },
      ),
    );
  }
}
