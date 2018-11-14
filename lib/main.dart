import 'package:flutter/material.dart';

import 'package:movie_app/ui/home_page.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  //create app store

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '电影院',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primaryColor: const Color(0xFF1C306D),
        accentColor: const Color(0xFFFFAD32),
        scaffoldBackgroundColor: Colors.transparent,
      ),
      home: MyHomePage(title: '电影列表'),
    );
  }
}

