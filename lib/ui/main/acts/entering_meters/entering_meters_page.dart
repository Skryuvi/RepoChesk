import 'package:chesk/assets_colors/uses_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:chesk/lorem_ipsum_dolor_sit_amet.dart';

class EnteringMetersPage extends StatefulWidget {
  const EnteringMetersPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<EnteringMetersPage> createState() => _EnteringMetersPageState();
}

class _EnteringMetersPageState extends State<EnteringMetersPage> {
  var _formKey = GlobalKey<FormState>();
  String? _puStateController;
  String? _puStateControllerError;
  String? _puStateRejectReasonController;


  // controllers
  late TextEditingController _dateController;
  late TextEditingController _indicationSimplePuController;
  // final _indicationPuDayController = TextEditingController();
  late TextEditingController _indicationPuDayController;
  // final _indicationPuNightController = TextEditingController();
  late TextEditingController _indicationPuNightController;
  final _indicationPuHalfPeakController = TextEditingController();
  final _indicationPuPeakController = TextEditingController();
  final _noteController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _dateController = TextEditingController(text: DateFormat('dd.MM.yyyy').format(DateTime.now()));
    _indicationSimplePuController = TextEditingController(text: '1263');
    _indicationPuDayController = TextEditingController(text: '1263');
    _indicationPuNightController = TextEditingController(text: '457');
  }

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
              onTap: () => Navigator.of(context).pop(),
              child: Container(
                height: 64, width: 20,
                child: Center(child: Image.asset('assets/nav_back.png', height: 16, width: 16,)),
              )),
        ),
        body: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Container(
            padding: EdgeInsets.all(20),
            child: ListView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              children: [
                dateField('Дата составления', DateFormat('dd.MM.yyyy').format(DateTime.now())),
                disabledTextField('Потребитель', 'Иванов Иван Иванович'),
                disabledTextField('Адрес регистрации', 'Ул. Пушкина 12 кв 124'),
                disabledTextField('Номер телефона', '8-927-56-56-56'),
                disabledTextField('Номер лицевого счета', '23754890'),
                SizedBox(height: 18),
                numberAndDateContractFields(),
                disabledTextField('Номер прибора учета', '79402374'),
                disabledTextField('Адрес, где установлен прибор учета', 'Ул. Пушкина 12 кв 124'),
                fieldWithPhoto('Показание 1-но тарифного прибора учета', _indicationSimplePuController, '1263'),
                fieldWithPhoto('Показание прибора учета, день', _indicationPuDayController,'1263'),
                fieldWithPhoto('Показание прибора учета, ночь', _indicationPuNightController, '457'),
                fieldWithPhoto('Показание прибора учета, полупик', _indicationPuHalfPeakController, ''),
                fieldWithPhoto('Показание прибора учета, пик', _indicationPuPeakController, ''),
                // selectFieldPu('Статусы ПУ', _puStateController, puStates),
                selectFieldPu('Статусы ПУ', puStates),
                selectFieldPuReject('Причины не снятия показаний ПУ', puStateRejectReasons),
                simpleTextField('Примечание', _noteController, ''),
                SizedBox(height: 18),
                Row(
                  children: [
                    Expanded(
                        child: RawMaterialButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              // print(_formKey.currentState);
                            }
                          },
                          fillColor: orangeBtnColor,
                          shape: const StadiumBorder(),
                          child: Text(
                            "Сохранить".toUpperCase(),
                            maxLines: 1,
                            style: GoogleFonts.roboto(fontSize: 12, color: Colors.white, fontWeight: FontWeight.w500),
                          ),
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
        onPressed: () {
        }
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
            controller: _dateController,
            keyboardType: TextInputType.number,
            style: TextStyle(fontSize: 14, color: textFieldColor),
            decoration: InputDecoration(
              suffixIcon: Align(
                widthFactor: 1.0,
                heightFactor: 1.0,
                child: GestureDetector(
                  onTap: () {
                    _selectDate(_dateController, '');
                  },
                  child: ImageIcon(
                      AssetImage('assets/date.png'),
                      size: 12,
                      color: Color.fromRGBO(158, 161, 162, 1)
                  ),
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
            enabled: false,
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
                // controller: _numberContractController,
                enabled: false,
                keyboardType: TextInputType.number,
                style: TextStyle(fontSize: 14, color: textFieldColor),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color.fromRGBO(221, 221, 225, 1),
                  contentPadding: EdgeInsets.all(10),
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color.fromRGBO(205, 205, 211, 1), width: 1.0),
                  ),
                  hintText: '123123',
                  hintStyle: TextStyle(fontSize: 14, color: textFieldColor)
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
                // controller: _dateContractController,
                enabled: false,
                // keyboardType: TextInputType.datetime,
                style: TextStyle(fontSize: 14, color: textFieldColor),
                decoration: InputDecoration(
                  suffixIcon: Align(
                    widthFactor: 1.0,
                    heightFactor: 1.0,
                    child: GestureDetector(
                      onTap: () {
                        // _selectDate(_dateContractController, '');
                      },
                      child: ImageIcon(
                          AssetImage('assets/date.png'),
                          size: 12,
                          color: Color.fromRGBO(158, 161, 162, 1)
                      ),
                    ),
                  ),
                  contentPadding: EdgeInsets.all(10),
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color.fromRGBO(205, 205, 211, 1), width: 1.0),
                  ),
                  filled: true,
                  fillColor: Color.fromRGBO(221, 221, 225, 1),
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  Column fieldWithPhoto(String title, TextEditingController controller, String value) {
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
          child: TextFormField(
            controller: controller,
            keyboardType: TextInputType.number,
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

  Column selectFieldPu(String title, List<String> values) {
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
            value: _puStateController,
            isExpanded: true,
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
            items: values.map((String label) {
              return DropdownMenuItem<String>(
                value: label,
                child: Text(label),
              );
            }).toList(),
            validator: (value) {
              return value?.isEmpty ?? true ? 'Поле обязательно для заполнения' : null;
            },
            onChanged: (newValue) {
              setState((){
                _puStateController = newValue;
              });
            },
          ),
        )
      ],
    );
  }

  Column selectFieldPuReject(String title, List<String> values) {
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
            value: _puStateRejectReasonController,
            isExpanded: true,
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
            items: values.map((String label) {
              return DropdownMenuItem<String>(
                value: label,
                child: Text(label),
              );
            }).toList(),
            onChanged: (newValue) {
              setState((){
                _puStateRejectReasonController = newValue;
              });
            },
          ),
        )
      ],
    );
  }

  Column simpleTextField(String title, TextEditingController controller, String value) {
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
            controller: controller,
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


  Future<void> _selectDate(TextEditingController controller, String type) async {
    var selectedActDate = DateTime.now();

    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedActDate,
        firstDate: DateTime(1980, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedActDate) {
      var formattedDate = DateFormat('dd.MM.yyyy').format(picked);
      var notFormatted = DateFormat('yyyy-MM-dd').format(picked);
      if (type == 'act_date') {} else if (type == 'release_new_pu_date') {} else
      if (type == 'replacement_date') {} else
      if (type == 'new_pu_last_verif_date') {} else if (type == 'new_pu_next_verif_date') {}

      setState(() {});
      controller.text = formattedDate;
    }
  }

}
