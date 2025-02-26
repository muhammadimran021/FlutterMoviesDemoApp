import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:my_movie_app/Utils/SecureStorageService.dart';
import 'package:my_movie_app/presentation/screens/HomePage/MainHomePage.dart';

import '../../../ApiService/dio/DioProvider.dart';
import '../../../Utils/RemoteConfigService.dart';
import '../../../data/models/MovieDetailRootModel.dart';
import '../../../data/models/TopRatedMoviesRootModel.dart';
import '../../../domain/di/GetIt.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final remoteConfigService = RemoteConfigService();
  Timer? timer;

  @override
  void initState() {
    /**
     * setup all the global services of the app
     */

    _initFirebaseRemoteConfigsWithDio();
    _setUpHive();
    setUpLocators();

    timer = Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainHomePage()),
      );
    });
    super.initState();
  }

  @override
  void dispose() {
    timer!.cancel();
    super.dispose();
  }

  void _setUpHive() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Hive.initFlutter();
    Hive.registerAdapter(MovieDetailRootModelAdapter());
    Hive.registerAdapter(ResultAdapter());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Center(
              child: Icon(
            Icons.movie_filter,
            size: 150,
            color: Colors.blue,
          ))
        ],
      ),
    ));
  }

  Future<void> _initFirebaseRemoteConfigsWithDio() async {
    await remoteConfigService.init();
    final apiKey = remoteConfigService.getStringValue("api_key");
    final authToken = remoteConfigService.getStringValue("auth_token");
    await SecureStorageService.saveKey("api_key", apiKey);
    await SecureStorageService.saveKey("auth_token", authToken);
    await DioProvider().create();
  }
}
