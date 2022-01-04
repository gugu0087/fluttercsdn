import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'add_page.dart';
import 'banner_bean.dart';
import 'main_page.dart';
import 'mine_page.dart';

class MainPageHelper {
  static List<BottomNavigationBarItem> buildBarItems() {
    List<BottomNavigationBarItem> tabs = [];
    tabs.add(const BottomNavigationBarItem(
        label: "首页",
        icon: Icon(
          Icons.water_damage_outlined,
          color: Color(0xFF929292),
        ),
        activeIcon:
            Icon(Icons.water_damage_outlined, color: Color(0xFF677FFF))));
    tabs.add(const BottomNavigationBarItem(
        label: "发现",
        icon: Icon(
          Icons.album_outlined,
          color: Color(0xFF929292),
        ),
        activeIcon: Icon(
          Icons.album_outlined,
          color: Color(0xFF677FFF),
        )));
    tabs.add(const BottomNavigationBarItem(
        label: "我的",
        icon: Icon(
          Icons.account_circle_outlined,
          color: Color(0xFF929292),
        ),
        activeIcon:
            Icon(Icons.account_circle_outlined, color: Color(0xFF677FFF))));
    return tabs;
  }

  static List<Widget> buildPageViews() {
    List<Widget> tabs = [];
    tabs.add(const MainPage());
    tabs.add(const AddPage());
    tabs.add(const MinePage());

    return tabs;
  }

  static Widget buildBanner(List<BannerBean> banners) {
    return SizedBox(
        width: double.infinity,
        child: AspectRatio(
          aspectRatio: 16 / 8,
          child: Swiper(
            pagination: const SwiperPagination(),
            //这些都是控件默认写好的,直接用
            indicatorLayout: PageIndicatorLayout.SCALE,
            autoplay: true,
            itemCount: banners.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(right: 20),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    banners[index].url as String,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ));
  }

  static Widget buildLabelItemWidget() {
    return AspectRatio(
      aspectRatio: 1.14,
      child: Container(
        margin: const EdgeInsets.fromLTRB(0, 0, 18, 0),
        decoration: const ShapeDecoration(
            color: Colors.deepPurple,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)))),
        child: Column(
          children: const [
            Text(
              "dsdsds",
              style: TextStyle(color: Colors.white),
            ),
            Text(
              "dsdsds",
              style: TextStyle(color: Colors.white),
            ),
            Text(
              "dsdsds",
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  static Widget buildListItemWidget() {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
      decoration: const ShapeDecoration(
          color: Color(0xFFF6FAFF),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)))),
      margin: const EdgeInsets.fromLTRB(0, 0, 16, 18),
      child: AspectRatio(
        aspectRatio: 2.5,
        child: Row(
          children: [
            Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                            margin: EdgeInsets.fromLTRB(0, 10, 5, 10),
                            child: Image.asset(
                              "assets/default_header.png",
                              width: 35,
                              fit: BoxFit.cover,
                              height: 35,
                            )),
                        Expanded(
                            child: Text(
                          "二哈二哈二哈二哈二哈二哈二哈二哈二哈二哈二哈",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 12, color: Colors.black),
                        ))
                      ],
                    ),
                    const Text(
                      "内容说内容说明内容说明内容说明内容说明内容说明内容说明内容说明明",
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 12, color: Color(0xFF666666)),
                    ),
                  ],
                )),
            Image.asset(
              "assets/default_img.png",
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
