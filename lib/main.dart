import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// 界面搭建一
/// 入口函数。和java里的main入口函数一个意思
void main() {
  runApp(const MyHomePage());
  if (Platform.isAndroid) {
    //设置Android头部的导航栏透明
    SystemUiOverlayStyle systemUiOverlayStyle =
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var data = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var content1 = {};
    content1['title'] = "your offers";
    content1['tab1'] = "Active offers";
    content1['tab2'] = "Sold products";
    data.add(content1);

    var content2 = {};
    content2['title'] = "Information";
    content2['tab1'] = "Statistics";
    content2['tab2'] = "Settings";
    data.add(content2);

    var content3 = {};
    content3['title'] = "Inbox";
    content3['tab1'] = "Current";
    content3['tab2'] = "Archive";
    data.add(content3);

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          /// 层布局，里面的子控件会是叠加的形式
          children: [
            /// 背景 最先写的叠加在最底层
            Container(
              height: 300,
              decoration: const BoxDecoration(
                  color: Colors.blue,
                  gradient: LinearGradient(
                      begin: Alignment(-1.0, -5.0),
                      end: Alignment(0.0, 1.0),
                      colors: [Color(0x106c5bde), Color(0xff352798)])),
            ),

            /// 其他浮在背景层上面的布局 Column
            /// Column 是竖直排列控件的意思，里面的控件都是按照从上往下排列的。
            Container(
              margin: const EdgeInsets.fromLTRB(0, 105, 0, 0),
              child: Column(
                /// 所有控件 左边开始的位置对齐
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      ///文案 Welcome back,Luis!
                      Container(
                        margin: const EdgeInsets.fromLTRB(24, 0, 0, 0),
                        child: const Text(
                          "Welcome back,"
                          "\nLuis!",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 26),
                        ),
                      ),

                      /// 头像 和编辑icon
                      Container(
                        alignment: Alignment.topRight,
                        margin: const EdgeInsets.fromLTRB(0, 10, 25, 0),
                        child: Stack(
                          children: [
                            Image.asset(
                              "assets/header.png",
                              width: 58,
                              height: 58,
                            ),
                            Container(
                                margin: const EdgeInsets.fromLTRB(0, 35, 0, 0),
                                child: Image.asset(
                                  "assets/edit.png",
                                  width: 28,
                                  height: 28,
                                  color: Colors.white,
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),

                  /// 三个数据战术区 Row 横向排列  Column 纵向排列
                  Container(
                    margin: const EdgeInsets.fromLTRB(85, 20, 85, 0),
                    child: Row(children: [
                      Expanded(
                          child: Column(
                        children: [
                          Container(
                            child: const Text(
                              "79",
                              style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            margin: EdgeInsets.only(bottom: 6),
                          ),
                          const Text("sold",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10)),
                        ],
                      )),
                      Expanded(
                          child: Column(
                        children: [
                          Container(
                            child: const Text(
                              "28k",
                              style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            margin: EdgeInsets.only(bottom: 6),
                          ),
                          const Text("sold",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10)),
                        ],
                      )),
                      Expanded(
                          child: Column(
                        children: [
                          Container(
                            child: const Text(
                              "79",
                              style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            margin: EdgeInsets.only(bottom: 6),
                          ),
                          const Text("sold",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10)),
                        ],
                      )),
                    ]),
                  ),

                  /// 三个列表项
                  Expanded(
                      child: Container(
                    padding: const EdgeInsets.fromLTRB(25, 0, 25, 20),
                    /// 循环添加三个列表项
                    child: ListView.builder(
                        itemCount:data.length ,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Text(
                                  data.isNotEmpty ? data[index]['title'] : "",
                                  style: const TextStyle(
                                      color: Color(0xFFC1C1C1), fontSize: 14),
                                ),
                                margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                              ),
                              Container(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Row(
                                        children: [
                                          Text(
                                            data.isNotEmpty
                                                ? data[index]['tab1']
                                                : "",
                                          ),
                                          const Expanded(
                                              child: Align(
                                            alignment: Alignment.centerRight,
                                            child: Icon(
                                              Icons.chevron_right,
                                            ),
                                          )),
                                        ],
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                      ),
                                    ),
                                    Container(
                                      child: const Divider(
                                          height: 2, color: Colors.black12),
                                      width: 300,
                                      margin: const EdgeInsets.fromLTRB(
                                          10, 0, 10, 0),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Row(
                                        children: [
                                          Text(data.isNotEmpty
                                              ? data[index]['tab2']
                                              : ""),
                                          const Expanded(
                                              child: Align(
                                            alignment: Alignment.centerRight,
                                            child: Icon(
                                              Icons.chevron_right,
                                            ),
                                          )),
                                        ],
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                      ),
                                    ),
                                  ],
                                ),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)),
                              )
                            ],
                          );
                        }),
                    margin: const EdgeInsets.only(top: 24),
                    decoration: BoxDecoration(
                        color: const Color(0xFFF5F7F9),
                        borderRadius: BorderRadius.circular(10)),
                  ))
                ],
              ),
            )
          ],
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
