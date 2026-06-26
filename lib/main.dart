import 'package:flutter/material.dart';
import 'package:portalcommunity/screens/SplashScreen.dart';

void main() => runApp(MyApp());

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Portal Community',
      home: SplashScreenPortal(),
    );
  }
}
