import 'package:droplez/content_view.dart';
import 'package:droplez/custom_tab.dart';
import 'package:droplez/cutom_tab_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  late double screenHeight;
  late double screenWidth;
  late double topPadding;
  late double bottomPadding;
  late TabController tabController;

  List<ContentView> contentViews = [
    ContentView(
        tab: const CustomTab(title: 'Home'),
        content: Center(
            child: Container(color: Colors.green, width: 100, height: 100))),
    ContentView(
        tab: const CustomTab(title: 'About'),
        content: Center(
            child: Container(color: Colors.blue, width: 100, height: 100))),
    ContentView(
        tab: const CustomTab(title: 'Projects'),
        content: Center(
            child: Container(color: Colors.red, width: 100, height: 100))),
  ];

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    topPadding = screenHeight * 0.05;
    bottomPadding = screenHeight * 0.01;
    return Scaffold(
        backgroundColor: Colors.brown,
        endDrawer: drawer(),
        key: scaffoldKey,
        body: LayoutBuilder(builder: (context, constraints) {
          if (constraints.maxWidth > 715) {
            return desktopView();
          } else {
            return mobileView();
          }
        }));
  }

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: contentViews.length, vsync: this);
  }

  Widget desktopView() {
    if (scaffoldKey.currentState!.isEndDrawerOpen) {
      Navigator.pop(context);
    }
    return Column(
      children: [
        Container(
          color: Colors.black,
          child: Row(
            children: [
              Expanded(
                child: SizedBox(
                    width: screenHeight * 0.05,
                    child: const Icon(Icons.ac_unit)),
              ),
              Expanded(
                child: CustomTabBar(
                  controller: tabController,
                  tabs: contentViews.map((e) => e.tab).toList(),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: screenHeight * 0.55,
          child: TabBarView(
            controller: tabController,
            children: contentViews.map((e) => e.content).toList(),
          ),
        ),
      ],
    );
  }

  Widget mobileView() {
    return Padding(
      padding:
          EdgeInsets.only(left: screenWidth * 0.05, right: screenWidth * 0.05),
      child: SizedBox(
        width: screenWidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            IconButton(
              iconSize: screenWidth * 0.08,
              onPressed: () => scaffoldKey.currentState?.openEndDrawer(),
              icon: const Icon(Icons.menu_rounded),
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }

  Widget drawer() {
    return Drawer(
      child: ListView(
        children: [Container(height: screenHeight * 0.1)] +
            contentViews
                .map((e) => Container(
                      child: ListTile(
                        title: Text(e.tab.title),
                        onTap: () {},
                      ),
                    ))
                .toList(),
      ),
    );
  }
}
