import 'package:droplez/content_view.dart';
import 'package:droplez/custom_tab.dart';
import 'package:droplez/homepage.dart';
import 'package:droplez/screens/projects.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      // initialRoute: '/',
      routes: {
        '/projects': (context) => const ProjectsPage(),
      },
    );
  }
}
