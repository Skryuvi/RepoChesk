import 'package:chesk/assets_colors/uses_colors.dart';
import 'package:chesk/lorem_ipsum_dolor_sit_amet.dart';
import 'package:chesk/ui/main/downloading/downloading_presenter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class DownloadingPage extends StatefulWidget {
  const DownloadingPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<DownloadingPage> createState() => _DownloadingPage();
}

class _DownloadingPage extends State<DownloadingPage> {
  late List<ValueNotifier> notifiers;
  late DownloadingPresenter presenter;
  List<MainScreenListSubItem> subItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        backgroundColor: authBackColor,
        automaticallyImplyLeading: false,
        trailing: Stack(
          children: [
            Positioned.fill(
              right: 44,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: (){},
                    child: Image.asset('assets/upload_ic.png', height: 24, width: 24, color: Colors.white)
                  )
                )
            ),

            Positioned.fill(
                right: 4,
                child: Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                        onTap: (){},
                        child: Image.asset('assets/barcode_ic.png', height: 26, width: 26)
                    )
                )
            )
          ]
        )
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Stack(children: [
        Positioned(
          left: 12,
          right: 12,
          top: MediaQuery.of(context).size.height * 0.01,
          child: Container(
              margin: EdgeInsets.only(
                top: 8,
                bottom: 12,
              ),
              child: searchField()),
        ),
        Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: MediaQuery.of(context).size.height * 0.095,
            child: listView())
      ])),
    );
  }

  @override
  initState() {
    notifiers = [];
    presenter = DownloadingPresenter(context);
    locationsLorem.forEach((e) {
      notifiers.add(ValueNotifier(false));
    });
    super.initState();
  }
  ///MainList
  Widget listView() {
    return ListView.builder(
      itemCount: locationsLorem.length,
      itemBuilder: (BuildContext context, int index) {
        var lengthOfChecked = 0;
        locationsLorem[index].subList.forEach((e) {
          if (e.checked) {
            lengthOfChecked++;
          }
        });
        return Column(children: [
          GestureDetector(
              onTap: () {
                if (notifiers[index].value) {
                  notifiers[index].value = false;
                } else {
                  notifiers[index].value = true;
                }
              },
              child: Container(
                  decoration: BoxDecoration(color: colorAddress),
                  height: 48,
                  child: Row(
                    children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: ValueListenableBuilder(
                            valueListenable: notifiers[index],
                            builder: (context, value, child) {
                              return Container(
                                  margin: EdgeInsets.only(left: 12, right: 12),
                                  decoration:
                                      BoxDecoration(color: colorAddress),
                                  child: Center(
                                      child: value == false
                                          ? SvgPicture.asset(
                                              'assets/drop_down.svg',
                                              matchTextDirection: true,
                                            )
                                          : SvgPicture.asset(
                                              'assets/drop_up.svg',
                                              matchTextDirection: true,
                                            )));
                            },
                          )),
                      Expanded(
                          child: Container(
                              margin: EdgeInsets.only(left: 28),
                              child: Text(locationsLorem[index].name,
                                  style: GoogleFonts.roboto(
                                      color: Colors.black, fontSize: 13)))),
                      Expanded(
                          child: GestureDetector(
                              onTap: () {},
                              child: Image.asset(
                                  'assets/street_location_ic.png',
                                  height: 20,
                                  width: 18))),
                      Align(
                          child: Container(
                              margin: EdgeInsets.only(right: 12),
                              child: Center(
                                  child: Text(
                                      '[$lengthOfChecked/${locationsLorem.indexOf(locationsLorem.last)}]'))))
                    ],
                  ))),
          ValueListenableBuilder(
            valueListenable: notifiers[index],
            builder: (BuildContext context, value, Widget? child) {
              return Visibility(
                  visible: value == true ? true : false,
                  child: columnSubView(locationsLorem[index].subList));
            },
          ),
        ]);
      },
    );
  }

  ///subList
  Widget columnSubView(List<MainScreenListSubItem> l) {
    var valueNotifyer = [ValueNotifier(false)];
    l.forEach((element) {
      valueNotifyer.add(ValueNotifier(false));
    });
    return Column(
        children: l
            .map(
              (e) => GestureDetector(
                  onTap: (){
                      presenter.navigateToActs(e.ls);
                  },
                  child: Container(
                      height: 48,
                      child: Stack(
                        children: [
                          firstElement(e),
                          secondElement(e),
                          thirdElement(e),
                          fourthElement(e, valueNotifyer[l.indexOf(e)])
                        ],
                      ))),
            )
            .toList());
  }

  Widget thirdElement(MainScreenListSubItem e) {
    return Positioned.fill(
      left: MediaQuery.of(context).size.width * 0.45,
      top: 8,
      child: Text(e.pu,
          style: GoogleFonts.roboto(color: Colors.black, fontSize: 12)),
    );
  }

  Widget secondElement(MainScreenListSubItem e) {
    return Positioned(
        bottom: 8,
        left: MediaQuery.of(context).size.width * 0.11,
        child: Text(e.subName,
            style: GoogleFonts.roboto(color: Colors.grey, fontSize: 11)));
  }

  Widget firstElement(MainScreenListSubItem e) {
    return Positioned(
      left: MediaQuery.of(context).size.width * 0.11,
      top: 8,
      child: Text(e.ls,
          style: GoogleFonts.roboto(color: Colors.black, fontSize: 12)),
    );
  }

  Widget fourthElement(MainScreenListSubItem e, ValueNotifier n) {
    return Positioned.fill(
        right: 14,
        child: Align(
          child: GestureDetector(
              onTap: () {
                setState(() {
                  if (e.checked) {
                    e.checked = false;
                  } else {
                    e.checked = true;
                  }
                });
              },
              child: e.checked
                  ? Image.asset('assets/marker_ok.png', height: 20, width: 20)
                  : Image.asset(
                      'assets/marker_none.png',
                      height: 20,
                      width: 20,
                    )),
          alignment: Alignment.centerRight,
        ));
  }

  ///SearchField
  Widget searchField() {
    return ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: Container(
            child: Row(children: [
              Container(),
              Expanded(
                  child: Container(
                      margin: EdgeInsets.only(left: 8, right: 44),
                      child: CupertinoTextField(
                        placeholder: 'Поиск',
                        cursorColor: Colors.black,
                        decoration: BoxDecoration(color: Colors.transparent),
                      ))),
              Container(
                  height: MediaQuery.of(context).size.height * 0.05,
                  width: MediaQuery.of(context).size.height * 0.05,
                  margin: EdgeInsets.only(right: 4),
                  child: Image.asset(
                    'assets/search_btn.png',
                  )),
            ]),
            height: MediaQuery.of(context).size.height * 0.065,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: Colors.black))));
  }
}
