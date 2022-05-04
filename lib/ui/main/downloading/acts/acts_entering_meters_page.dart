import 'package:chesk/assets_colors/uses_colors.dart';
import 'package:chesk/lorem_ipsum_dolor_sit_amet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ActsEnteringMetersPage extends StatefulWidget {
  const ActsEnteringMetersPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<ActsEnteringMetersPage> createState() => _ActsEnteringMetersPageState();
}

class _ActsEnteringMetersPageState extends State<ActsEnteringMetersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CupertinoNavigationBar(
          backgroundColor: authBackColor,
          automaticallyImplyLeading: false,
          middle: Align(
              alignment: Alignment.centerLeft,
              child: Text(widget.title, style: GoogleFonts.roboto(color: Colors.white))),
          leading: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                height: 64,
                width: 20,
                child: Center(
                    child: Image.asset(
                      'assets/nav_back.png',
                      height: 16,
                      width: 16,
                    )),
              )),
        ),
        body: Container(
          child: Text('qwe'),
        )
    );
  }
}
