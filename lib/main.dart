import 'package:flutter/material.dart';
import 'welcome_page.dart';
const d_yellow = const Color(0xFFFFFF96);
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tracy',
      debugShowCheckedModeBanner: false,
      home: WelcomePage(),
    );

  }
}
