import 'package:chesk/splash_screen_presenter.dart';
import 'package:flutter/material.dart';

import 'package:chesk/ui/main/downloading/acts/acts_entering_meters_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // home: SplashScreen(title: 'Flutter Demo Home Page'),
      home: ActsEnteringMetersPage(title: 'Внесение показаний по прибору учета'),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<SplashScreen> createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  late SplashScreenPresenter presenter;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(

      ),
    );
  }
  @override
  void initState() {
    presenter = SplashScreenPresenter(context);
    presenter.selectPageNavigateTo();
    super.initState();
  }
}
