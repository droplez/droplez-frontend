import 'package:flutter/material.dart';

class CustomTab extends StatelessWidget {
  const CustomTab({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Text(this.title, style: TextStyle(fontSize: 17)),
    );
  }
}
