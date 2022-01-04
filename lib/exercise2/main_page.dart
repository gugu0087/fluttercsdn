import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'banner_bean.dart';
import 'main_page_helper.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MainPageState();
  }
}

class _MainPageState extends State<MainPage> {
  List<BannerBean> banners = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    banners.add(BannerBean(1, "http://via.placeholder.com/350x150"));
    banners.add(BannerBean(2, "http://via.placeholder.com/350x150"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "首页",
          style: TextStyle(color: Colors.black, fontSize: 14),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverToBoxAdapter(
                child: MainPageHelper.buildBanner(banners),
              ),
              SliverToBoxAdapter(
                child: Container(
                  margin: const EdgeInsets.fromLTRB(0, 28, 0, 16),
                  child: const Text(
                    "我的仓库",
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  height: 108,
                  margin: EdgeInsets.only(bottom: 40),
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (BuildContext context, int index) {
                        return MainPageHelper.buildLabelItemWidget();
                      }),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  child: Text("测试列表",style: TextStyle(color: Colors.black, fontSize: 18)),
                ),
              )
            ];
          },
          body: ListView.builder(
              itemCount: 16,
              itemBuilder: (BuildContext context, int index) {
                return  MainPageHelper.buildListItemWidget();
              }),
        ),
      ),
    );
  }

  ///Container(child: MainPageHelper.buildBanner(banners),)
}
