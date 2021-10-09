import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({Key? key, required this.controller, required this.tabs})
      : super(key: key);

  final TabController controller;
  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double tabBarScaling = screenWidth > 1400
        ? 0.21
        : screenWidth > 1100
            ? 0.3
            : 0.4;
    return Container(
      color: Colors.black,
      width: screenWidth,
      child: Padding(
        padding: EdgeInsets.only(right: screenWidth * 0.00),
        child: Container(
          width: screenWidth * tabBarScaling,
          color: Colors.cyan,
          child: Theme(
            data: ThemeData(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                hoverColor: Colors.transparent),
            child: TabBar(
              tabs: tabs,
              controller: controller,
              indicatorColor: Colors.deepOrange,
            ),
          ),
        ),
      ),
    );
  }
}
