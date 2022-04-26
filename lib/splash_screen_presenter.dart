import 'package:chesk/ui/auth/auth_page.dart';
import 'package:chesk/ui/main/downloading/downloading_page.dart';
import 'package:chesk/ui/main/main_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreenPresenter {
  final BuildContext context;
  SplashScreenPresenter(this.context);

  Future<bool> isAuthenticated() async {
    var preferences = await SharedPreferences.getInstance();
    return preferences.getString('token')?.isNotEmpty == true;
  }
  Future<void> selectPageNavigateTo() async {
    isAuthenticated().then((value) => value ? toMainScreen() : toAuthScreen());
  }
  void toMainScreen() {
    Navigator.push(context,
        PageTransition(type: PageTransitionType.fade, child: MainScreen(title: '',)));
  }
  void toAuthScreen() {
    Navigator.push(context,
        PageTransition(type: PageTransitionType.fade, child: AuthPage(title: '',)));
  }
}