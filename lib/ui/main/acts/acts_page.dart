import 'package:chesk/assets_colors/uses_colors.dart';
import 'package:chesk/lorem_ipsum_dolor_sit_amet.dart';
import 'package:chesk/ui/main/acts/acts_presenter.dart';
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
  late ActsPresenter presenter;

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
        body: ListView(
          shrinkWrap: true,
          children: [
            // ЛС/ПУ инфо
            LsHeader(),

            // Задания
            LsTasks(),

            // Создание документа
            Container(
              padding: EdgeInsets.fromLTRB(20, 20, 0, 10),
              child: Text(
                'Создать документ',
                style: GoogleFonts.roboto(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
            // Flex(direction: Axis.horizontal, children: <Widget>[Expanded(child: ActLink())]),
            Flex(direction: Axis.horizontal, children: <Widget>[Expanded(child: listView())]),
            Container(
              width: 300,
              padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
              child: RawMaterialButton(
                fillColor: orangeBtnColor,
                onPressed: () {},
                shape: const StadiumBorder(),
                child: Text(
                  "СОХРАНИТЬ ИЗМЕНЕНИЯ",
                  maxLines: 1,
                  style: GoogleFonts.roboto(fontSize: 12, color: Colors.white, fontWeight: FontWeight.w500),
                ),
              ),
            )
          ],
        ));
  }

  @override
  initState() {
    presenter = ActsPresenter(context);
    super.initState();
  }
  
  Widget listView() {
    return ListView.builder(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemCount: actsList.length,
        itemBuilder: (_, index) {
          return DecoratedBox(
              position: DecorationPosition.foreground,
              decoration: BoxDecoration(
                border: Border(
                  bottom: Divider.createBorderSide(context, color: Colors.grey),
                ),
              ),
              child: Ink(
                color: Color.fromRGBO(245, 245, 245, 1),
                child: ListTile(
                  minVerticalPadding: 10,
                  visualDensity: VisualDensity(vertical: -4),
                  contentPadding: EdgeInsets.only(left: 20, right: 20),
                  title: Text(actsList[index],
                      style: GoogleFonts.roboto(color: Colors.black, fontSize: 13)),
                  trailing: Image.asset(
                    'assets/arrow_send.png',
                    width: 16,
                    height: 16,
                  ),
                  onTap: () {
                    presenter.navigateToAct(actsList[index]);
                  },
                  // selected: true,
                ),
              ));
        });
  }
}

class LsTasks extends StatelessWidget {
  const LsTasks({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
          child: Text('Задания',
              style: GoogleFonts.roboto(fontSize: 14, fontWeight: FontWeight.w500)),
        ),
    Row(
      children: [
        Flexible(
          fit: FlexFit.tight,
          flex: 30,
          child: Container(
            padding: EdgeInsets.fromLTRB(8, 1, 5, 0),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.1,
              padding: EdgeInsets.fromLTRB(10, 7, 7, 7),
              margin: EdgeInsets.only(right: 20),
              decoration: BoxDecoration(
                // color: Colors.green[500],
                border: Border(
                  left: BorderSide(color: Colors.black12),
                  top: BorderSide(color: Colors.black12),
                  bottom: BorderSide(color: Colors.black12),
                ),
              ),
              child: Text(
                'Отключение',
                style: GoogleFonts.roboto(fontSize: 14, fontWeight: FontWeight.w500, color: orangeBtnColorBorder),
                // style: TextStyle(fontSize: 13, fontFamily: 'Roboto', fontWeight: FontWeight.w500, color: borderOrangeBtn),
              ),
            ),
          ),
        ),
        Flexible(
            flex: 26,
            child: Container(
                child: RawMaterialButton(
                  fillColor: orangeBtnColor,
                  splashColor: orangeBtnColorBorder,
                  padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                  constraints: BoxConstraints(minHeight: 26),
                  child: Text(
                    "Сформировать акт",
                    maxLines: 1,
                    style: GoogleFonts.roboto(fontSize: 12, color: Colors.white, fontWeight: FontWeight.w500),
                  ),
                  onPressed: () {},
                  shape: const StadiumBorder(),
                )
            )
        ),
      ],
    ),

      ],
    );
  }
}

class LsHeader extends StatelessWidget {
  const LsHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            fit: FlexFit.tight,
            child: Container(
              padding: EdgeInsets.fromLTRB(20, 15, 15, 10),
              child: Column(
                children: [
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text('Гатальская Екатерина Николаевна',
                          style: GoogleFonts.roboto(fontSize: 13))),
                  SizedBox(height: 5),
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text('Ул. героя России Евгения Родионова, дом 89 кв 93',
                          style: GoogleFonts.roboto(fontSize: 13))),
                  SizedBox(height: 10),
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text('Место установки: ИЖД',
                          style: GoogleFonts.roboto(fontSize: 13))),
                  SizedBox(height: 5),
                  Align(
                      alignment: Alignment.topLeft,
                      child:
                          Text('№ ПУ 34688705', style: GoogleFonts.roboto(fontSize: 13))),
                ],
              ),
            ),
          ),
          Container(
              width: 70,
              padding: EdgeInsets.only(top: 15),
              child: Align(
                alignment: Alignment.topCenter,
                child: Image.asset(
                  'assets/marker_none.png',
                  height: 28,
                  width: 28,
                ),
              )),
        ],
      ),
    );
  }
}
