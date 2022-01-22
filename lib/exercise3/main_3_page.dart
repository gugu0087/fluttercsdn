import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:waterfall_flow/waterfall_flow.dart';

/**
 **@time
 **@author xyc
 **@description:
 **/

void main() {
  runApp(const Main3Page());
}

class Main3Page extends StatefulWidget {
  const Main3Page({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return Main3PageState();
  }
}

class Main3PageState extends State<Main3Page> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(///   AppBar  flutter封装好的标题栏，可以配置各种属性
          title: const Text("流式布局"),
        ),
        body: Container(
          color: Colors.white,
          margin: const EdgeInsets.fromLTRB(16, 20, 16, 0),
          child: Column(
            children: [
              Wrap(/// 流式布局
                children: BuildItem.buildWrapItems(),
              ),
              Expanded(
                child: BuildItem.buildWaterfallFlow(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class BuildItem {
  static List<Widget> buildWrapItems() {
    List<Widget> items = [];
    for (int i = 0; i < 20; i++) {
      items.add(Container(
        margin: EdgeInsets.fromLTRB(0, 0, 10, 10),
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: Text(
          "Item$i",
          style: TextStyle(color: Colors.white),
        ),
        decoration: ShapeDecoration(
            color: Colors.blue,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
      ));
    }
    return items;
  }

  static Widget buildWaterfallFlow() {
    return WaterfallFlow.builder(
      padding: EdgeInsets.zero,
      gridDelegate: SliverWaterfallFlowDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,/// 一行2个数据
        crossAxisSpacing: 8,
        mainAxisSpacing: 10,
        lastChildLayoutTypeBuilder: (index) =>
            index == 20 ? LastChildLayoutType.foot : LastChildLayoutType.none,
      ),
      itemCount: 20,/// 瀑布流数量
      itemBuilder: (BuildContext context, int index) {
        /// 返回瀑布流item子控件
        return index % 2 == 0  /// 为了区分瀑布流效果，
            ? buildOtherItem() /// 控件类型1
            : ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(5)),
                child: Container(
                  color: Color(0xFFF7F7F7),
                  padding: EdgeInsets.only(bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        "assets/image.jpeg",
                        fit: BoxFit.cover,
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text("标题标标题标题标题标题标题标题题"),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "发帖人",
                          style:
                              TextStyle(fontSize: 12, color: Color(0xFF999999)),
                        ),
                      )
                    ],
                  ),
                ),
              );///控件类型2
      },
    );
  }

  static Widget buildOtherItem() {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(5)),
      child: Container(
        color: Color(0xFFF7F7F7),
        padding: EdgeInsets.only(bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              "assets/image2.jpeg",
              fit: BoxFit.cover,
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text("标题标标题标题标题标题标题标题题"),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "发帖人",
                style: TextStyle(fontSize: 12, color: Color(0xFF999999)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
