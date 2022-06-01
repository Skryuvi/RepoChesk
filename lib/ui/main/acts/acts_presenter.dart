import 'package:chesk/ui/main/acts/entering_meters/entering_meters_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:page_transition/page_transition.dart';

import 'entering_meters/entering_meters_page.dart';
import 'consumer_form/consumer_form_page.dart';
import 'checking_pu/checking_pu_page.dart';
import 'renewal_power/renewal_power_page.dart';
import 'restriction/restriction_page.dart';
import 'access_denied/access_denied_page.dart';
import 'unauthorized_connection/unauthorized_connection_page.dart';

class ActsPresenter {
  BuildContext context;
  ActsPresenter(this.context);

  void navigateToAct(num pageId, String title) {
    var switchToPage;

    switch (pageId) {
      case 7:
        print("7. внесение показаний по ПУ");
        switchToPage = EnteringMetersPage(title: title); // внесение показаний по ПУ
        break;
      case 1:
        print("1. анкета потребителя");
        switchToPage = ConsumerFormPage(title: title); // анкета потребителя
        break;
      case 2:
        print("2. акт проверки узла учета");
        switchToPage = CheckingPuPage(title: title); // акт проверки узла учета
        break;
      case 9:
        print("9. акт о возобновлении подачии ЭЭ");
        switchToPage = RenewalPowerPage(title: title); // акт о возобновлении подачии ЭЭ
        break;
      case 10:
        print("10. акт об огранич/приостанов представления ЭЭ");
        switchToPage = RestrictionPage(title: title); // акт об огранич/приостанов представления ЭЭ
        break;
      case 3:
        print("3. Акт о выявлении несанкционированного подключения",);
        switchToPage = UnauthorizedConnectionPage(title: title); // акт об огранич/приостанов представления ЭЭ
        break;
      case 5:
        print("5. Акт об отказе в допуске к прибору учета");
        switchToPage = AccessDeniedPage(title: title); // Акт об отказе в допуске к прибору учета
        break;
      default:
        print("x. Внесение показаний по прибору учета (дефолная стр)");
        switchToPage = EnteringMetersPage(title: "Внесение показаний по прибору учета (дефолная стр)");
    }
    Navigator.push(context,
        PageTransition(type: PageTransitionType.fade, child: switchToPage));
  }
}