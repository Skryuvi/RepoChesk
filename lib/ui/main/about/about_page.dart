import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<AboutPage> createState() => _AboutPage();
}

class _AboutPage extends State<AboutPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(

      ),
    );
  }
  @override
  void initState() {
    super.initState();
  }
}