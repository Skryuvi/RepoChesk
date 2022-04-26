
import 'package:chesk/assets_colors/uses_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ActsPage extends StatefulWidget {
  const ActsPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<ActsPage> createState() => _ActsPage();
}

class _ActsPage extends State<ActsPage> {

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: authBackColor,
        automaticallyImplyLeading: false,
        middle: Align(alignment: Alignment.centerLeft, child: Text(widget.title, style: GoogleFonts.roboto(color: Colors.white))),
        leading: GestureDetector(
          onTap: (){
            Navigator.of(context).pop();
          },
          child: Container(
            height: 40, width: 40,
            child: Center(child: Image.asset('assets/nav_back.png', height: 16, width: 16,)) ,
          )
        ),
      ),
      child: Stack(
          children: [

          ]
      ),
    );
  }
  @override
  initState(){
    super.initState();
  }
}
