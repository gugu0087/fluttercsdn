import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DeviceUtils{
  static List<double> getScreenSize(BuildContext context) {
    List<double> list = [];
    final width = window.physicalSize.width;
    final height = window.physicalSize.height;
    list.add(width);
    list.add(height);
    return list;
  }

  static setBarStatus({Color color = Colors.transparent}) {
    if (Platform.isAndroid) {
      //设置Android头部的导航栏透明
      SystemUiOverlayStyle systemUiOverlayStyle =
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent);
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    }
  }
}