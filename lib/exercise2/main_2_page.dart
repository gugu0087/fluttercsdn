import 'package:flutter/material.dart';
import 'package:fluttercsdn/utils/device_utils.dart';

import 'base_bg.dart';
import 'main_page_helper.dart';

void main() {
  runApp(const MyApp());
  DeviceUtils.setBarStatus();
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MyAppPageState();
  }
}

class _MyAppPageState extends State<MyApp> {
  int currentIndex = 0;
  late List<BottomNavigationBarItem> tabs;
  late List<Widget> pages;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabs = MainPageHelper.buildBarItems();
    pages = MainPageHelper.buildPageViews();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          items: tabs,
          currentIndex: currentIndex,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          unselectedLabelStyle:
          const TextStyle(color: Color(0xFF677FFF), fontSize: 10),
          selectedLabelStyle:
          const TextStyle(color: Color(0xFF929292), fontSize: 10),
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
        ),
        body: BaseBgWidget.buildBaseBg(
          context,
          child: pages[currentIndex],
        ),
      ),
    );
  }
}
