import 'package:chesk/ui/main/acts/entering_meters/entering_meters_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:page_transition/page_transition.dart';

import 'entering_meters/entering_meters_page.dart';
import 'consumer_form/consumer_form_page.dart';
import 'checking_pu/checking_pu_page.dart';
import 'renewal_power/renewal_power_page.dart';

class ActsPresenter {
  BuildContext context;
  ActsPresenter(this.context);

  void navigateToAct(num pageId, String title) {
    var switchToPage;

    switch (pageId) {
      case 7:
        switchToPage = EnteringMetersPage(title: title); // внесение показаний по ПУ
        break;
      case 3:
        switchToPage = ConsumerFormPage(title: title); // анкета потребителя
        break;
      case 2:
        switchToPage = CheckingPuPage(title: title); // акт проверки узла учета
        break;
      case 9:
        switchToPage = RenewalPowerPage(title: title); // акт о возобновлении подачии ЭЭ
        break;
      default:
        switchToPage = EnteringMetersPage(title: "Внесение показаний по прибору учета (дефолная стр)");
    }
    Navigator.push(context,
        PageTransition(type: PageTransitionType.fade, child: switchToPage));
  }
}