import 'package:flutter/material.dart';
import 'package:tiny_minds/pages/settings_page.dart';
import 'pages/first_page.dart';
import 'pages/learn_page.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tiny Minds',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => FirstPage(),
        '/learn': (context) => LearnPage(),
        '/settings': (context) => SettingsPage(),
        //'/game': (context) => GamePage(),
        
      }, 
    );
  }
}