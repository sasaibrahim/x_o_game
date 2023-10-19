import 'package:flutter/material.dart';
import 'package:xogame_app/login.dart';

import 'gameapp.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: LoginScreen.routeName,
      routes: {
        GameApp.routeName: (context) => GameApp(),
        LoginScreen.routeName: (context) => LoginScreen(),
      },
      home: GameApp(),
    );
  }
}
