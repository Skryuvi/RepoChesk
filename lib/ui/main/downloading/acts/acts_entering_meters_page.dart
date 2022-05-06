import 'package:chesk/assets_colors/uses_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class ActsEnteringMetersPage extends StatefulWidget {
  const ActsEnteringMetersPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<ActsEnteringMetersPage> createState() => _ActsEnteringMetersPageState();
}

class _ActsEnteringMetersPageState extends State<ActsEnteringMetersPage> {
  final textFieldColor = Color.fromRGBO(33, 33, 38, 1);
  final labelFontStyle = GoogleFonts.roboto(fontSize: 13, fontWeight: FontWeight.w500);
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
        body: Container(
          padding: EdgeInsets.all(20),
          child: ListView(
            children: [
              dateField('Дата составления', DateFormat('dd.MM.yyyy').format(DateTime.now())),
              disabledTextField('Потребитель', 'Иванов Иван Иванович'),
              disabledTextField('Адрес регистрации', 'Ул. Пушкина 12 кв 124'),
              disabledTextField('Номер телефона', '8-927-56-56-56'),
              disabledTextField('Номер лицевого счета', '23754890'),
              SizedBox(height: 18),
              numberAndDateContractFields(),
              disabledTextField('Адрес, где установлен прибор учета', 'Ул. Пушкина 12 кв 124'),
              fieldWithPhoto('Показание 1-но тарифного прибора учета', '1263'),
              fieldWithPhoto('Показание прибора учета, день', '1263'),
              fieldWithPhoto('Показание прибора учета, ночь', '457'),
              fieldWithPhoto('Показание прибора учета, полупик', ''),
              fieldWithPhoto('Показание прибора учета, пик', ''),
              selectField('Статусы ПУ'),
              selectField('Причины не снятия показаний ПУ'),
              simpleTextField('Примечание', ''),
              SizedBox(height: 18),
              Row(
                children: [
                  Expanded(
                      child: textButton(
                        title: 'Сохранить'.toUpperCase(),
                        color: orangeBtnColor,
                        borderColor: orangeBtnColorBorder
                      )
                  ),
                  SizedBox(width: 20),
                  Expanded(
                      child: textButton(
                          title: 'Распечатать'.toUpperCase(),
                          color: blueBtnColor,
                          borderColor: blueBtnColorBorder
                      )
                  ),
                ],
              )
            ],
          ),
        )
    );
  }

  TextButton textButton({required String title, required Color color, required Color borderColor}) {
    return TextButton(
                        child: Text(
                          title,
                          style: GoogleFonts.roboto(fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(color),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: borderColor)
                            )
                          )
                        ),
                        onPressed: () => null
                    );
  }


  Column dateField(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: labelFontStyle),
        SizedBox(height: 7),
        Container(
                  // height: 30,
                  // width: 150,
                  // padding: EdgeInsets.only(top:10),
                  // color: Color.fromRGBO(242, 242, 242, 1),
                  child: TextField(
                    // enabled: false,
                    controller: TextEditingController(text: value),
                    style: TextStyle(fontSize: 14, color: textFieldColor),
                    decoration: InputDecoration(
                      suffixIcon: Align(
                        widthFactor: 1.0,
                        heightFactor: 1.0,
                        child: ImageIcon(
                            AssetImage('assets/date.png'),
                            size: 12,
                            color: Color.fromRGBO(158, 161, 162, 1)
                        ),
                      ),
                      filled: true,
                      fillColor: Color.fromRGBO(242, 242, 242, 1),
                      // isCollapsed: true,
                      contentPadding: EdgeInsets.all(10),
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color.fromRGBO(205, 205, 211, 1), width: 1.0),
                      ),
                      // hintText: DateFormat('dd.MM.yyyy').format(DateTime.now()),
                      // hintStyle: TextStyle(fontSize: 14, color: textFieldColor),
                    ),
                  ),
                ),
      ],
    );
  }

  Column disabledTextField(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 18),
        Text(
          title,
          style: labelFontStyle,
        ),
        SizedBox(height: 7),
        Container(
          child: TextField(
            // controller: TextEditingController(text: value),
            style: TextStyle(fontSize: 14, color: textFieldColor),
            decoration: InputDecoration(
              filled: true,
              fillColor: Color.fromRGBO(221, 221, 225, 1),
              contentPadding: EdgeInsets.all(10),
              border: OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color.fromRGBO(205, 205, 211, 1), width: 1.0),
              ),
              hintText: value,
              hintStyle: TextStyle(fontSize: 14, color: textFieldColor)
            ),
          ),
        ),
      ],
    );
  }

  Row numberAndDateContractFields() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          // width: 160,
          flex: 1,
          child: Column(
            children: [
              Text('Номер договора электроснабжения', style: labelFontStyle),
              SizedBox(height: 7),
              TextField(
                style: TextStyle(fontSize: 14, color: textFieldColor),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color.fromRGBO(205, 205, 211, 1), width: 1.0),
                  ),
                ),
              )
            ],
          ),
        ),
        Expanded(flex: 0, child: SizedBox(width: 20)),
        Expanded(
          // width: 160,
          flex: 1,
          child: Column(
            children: [
              Text('Дата договора электроснабжения', style: labelFontStyle),
              SizedBox(height: 7),
              TextField(
                style: TextStyle(fontSize: 14, color: textFieldColor),
                decoration: InputDecoration(
                  suffixIcon: Align(
                    widthFactor: 1.0,
                    heightFactor: 1.0,
                    child: ImageIcon(
                        AssetImage('assets/date.png'),
                        size: 12,
                        color: Color.fromRGBO(158, 161, 162, 1)
                    ),
                  ),
                  contentPadding: EdgeInsets.all(10),
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color.fromRGBO(205, 205, 211, 1), width: 1.0),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  Column fieldWithPhoto(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 18),
        Text(
          title,
          style: labelFontStyle,
        ),
        SizedBox(height: 7),
        Container(
          child: TextField(
            controller: TextEditingController(text: value),
            style: TextStyle(fontSize: 14, color: textFieldColor),
            decoration: InputDecoration(
              suffixIcon: Align(
                widthFactor: 1.0,
                heightFactor: 1.0,
                child: ImageIcon(
                  // TODO: сделать иконку как в макете
                  // AssetImage('assets/photo_with_bg.png'),
                    AssetImage('assets/photo.png'),
                    size: 26,
                    color: Colors.grey
                ),
              ),
              filled: true,
              fillColor: Color.fromRGBO(246, 247, 249, 1),
              contentPadding: EdgeInsets.all(10),
              border: OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color.fromRGBO(171, 171, 181, 1), width: 1.0),
              ),
            ),
          ),
        )
      ],
    );
  }

  Column selectField(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 18),
        Text(
          title,
          style: labelFontStyle,
        ),
        SizedBox(height: 7),
        Container(
          child: DropdownButtonFormField<String>(
            decoration: InputDecoration(
              filled: true,
              fillColor: Color.fromRGBO(246, 247, 249, 1),
              contentPadding: EdgeInsets.all(10),
              border: OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color.fromRGBO(171, 171, 181, 1), width: 1.0),
              ),
            ),
            // hint: Text('Please choose account type'),
            items: <String>['A', 'B', 'C', 'D'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: new Text(value),
              );
            }).toList(),
            onChanged: (_) {},
          ),
        )
      ],
    );
  }

  Column simpleTextField(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 18),
        Text(
          title,
          style: labelFontStyle,
        ),
        SizedBox(height: 7),
        Container(
          child: TextField(
            controller: TextEditingController(text: value),
            style: TextStyle(fontSize: 14, color: textFieldColor),
            decoration: InputDecoration(
                filled: true,
                fillColor: Color.fromRGBO(246, 247, 249, 1),
                contentPadding: EdgeInsets.all(10),
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color.fromRGBO(205, 205, 211, 1), width: 1.0),
                ),
            ),
          ),
        ),
      ],
    );
  }


}
