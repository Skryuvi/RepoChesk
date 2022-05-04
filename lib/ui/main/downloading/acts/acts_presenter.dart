import 'package:chesk/ui/main/downloading/acts/acts_entering_meters_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:page_transition/page_transition.dart';

import 'acts_entering_meters_page.dart';

class ActsPresenter {
  BuildContext context;
  ActsPresenter(this.context);
  void navigateToAct(String title) {
    Navigator.push(context,
        PageTransition(type: PageTransitionType.fade, child: ActsEnteringMetersPage(title: title)));
  }
}