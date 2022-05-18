import 'package:chesk/ui/main/acts/entering_meters/entering_meters_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:page_transition/page_transition.dart';

import 'entering_meters/entering_meters_page.dart';

class ActsPresenter {
  BuildContext context;
  ActsPresenter(this.context);
  void navigateToAct(String title) {
    Navigator.push(context,
        PageTransition(type: PageTransitionType.fade, child: EnteringMetersPage(title: title)));
  }
}