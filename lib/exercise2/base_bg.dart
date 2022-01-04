import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttercsdn/utils/device_utils.dart';

class BaseBgWidget {
  static Widget buildBaseBg(BuildContext context, {Widget? child}) {
    double width = DeviceUtils.getScreenSize(context)[0];
    double height = DeviceUtils.getScreenSize(context)[1];
    return Container(
      child: child,
      constraints: BoxConstraints(minWidth: width, minHeight: height),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
          Color(0xFFC2DBFE),
          Color(0xFFF2DBF2),
        ]),
      ),
    );
  }
}
