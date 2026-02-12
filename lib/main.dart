import 'package:flutter/material.dart';
import 'package:news/screens/home_screen.dart';
import 'package:news/screens/news_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (c) => HomeScreen(),
        NewsScreen.routeName: (c) => NewsScreen(),
      },
    );
  }
}
