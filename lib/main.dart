import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:my_movie_app/data/models/TopRatedMoviesRootModel.dart';
import 'package:my_movie_app/domain/di/GetIt.dart';
import 'package:my_movie_app/presentation/screens/HomePage/MainHomePage.dart';

import 'data/models/MovieDetailRootModel.dart';

void main() {
  setUpLocators();
  _setUpHive();
  runApp(const MyApp());
}

void _setUpHive() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(MovieDetailRootModelAdapter());
  Hive.registerAdapter(ResultAdapter());
  await Hive.openBox("myDb");
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
