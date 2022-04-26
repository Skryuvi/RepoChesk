import 'package:chesk/ui/main/downloading/downloading_page.dart';
import 'package:chesk/ui/main/main_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthPresenter {
  final BuildContext context;
  AuthPresenter(this.context);

  void toMainScreen() {
    Navigator.push(context,
        PageTransition(type: PageTransitionType.fade, child: MainScreen(title: '',)));
  }

}