
import 'package:flutter/cupertino.dart';
import 'package:page_transition/page_transition.dart';

import 'acts/acts_page.dart';

class DownloadingPresenter {
  BuildContext context;
  DownloadingPresenter(this.context);
  void navigateToActs(String title) {
    Navigator.push(context,
        PageTransition(type: PageTransitionType.fade, child: ActsPage(title: title)));
  }
}