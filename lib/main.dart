import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Carousel',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0XF2F0F0FF),
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      darkTheme: ThemeData.dark(),
      home: AnimatedSplashScreen(
        splash: Icons.api,
        duration: 3000,
        splashTransition: SplashTransition.scaleTransition,
        backgroundColor: Colors.green,
        nextScreen: const CarouselApp(),
      ),
    );
  }
}
