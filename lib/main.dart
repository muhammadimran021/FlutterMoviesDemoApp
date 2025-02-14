import 'package:flutter/material.dart';
import 'package:my_movie_app/domain/di/GetIt.dart';
import 'package:my_movie_app/presentation/screens/HomePage/MainHomePage.dart';
import 'package:my_movie_app/presentation/screens/HomeScreen/home_screen.dart';

void main() {
  setUpLocators();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        pageTransitionsTheme: PageTransitionsTheme(
          builders: {
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            // iOS-like
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          },
        ),
      ),
      home: MainHomePage(),
    );
  }
}
