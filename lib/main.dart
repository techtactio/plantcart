//import 'package:bloc_app/features/home/ui/home.dart';
import 'package:bloc_app/features/splash/ui/splash.dart';
import 'package:flutter/material.dart';
const logged = 'have logged';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Splash());
  }
}
