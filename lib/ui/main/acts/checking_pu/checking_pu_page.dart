import 'package:chesk/assets_colors/uses_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:chesk/lorem_ipsum_dolor_sit_amet.dart';

class CheckingPuPage extends StatefulWidget {
  final String title;

  const CheckingPuPage({Key? key, required this.title}) : super(key: key);

  @override
  State<CheckingPuPage> createState() => _CheckingPuPageState();
}

class _CheckingPuPageState extends State<CheckingPuPage> {
  var _formKey = GlobalKey<FormState>();

  // controllers
  final _Controller = TextEditingController(); // служебный-дефолтный контроллер
  late TextEditingController _dateController;
  final _contractDateController = TextEditingController(text: '21.02.2022');
  late TextEditingController _numberPuController;
  String? _puTypeController;
  String? _mechanicalDamageController; // механические повреждения ПУ
  String? _unmeteredConsumptionController; // Признаки вмешательства в работу ПУ и безучетного потребления
  String? _holesExistController; // Отверстия, трещины в корпусе ПУ
  String? _fittingIndicatorGlassController; // Прилегание стекла индикатора
  String? _stampDamageController; // Нарушение пломб
  String? _switchingElementsFreeAccessController; // Свободный доступ к элементам коммутации
  String? _serviceabilityPuController; // Прибор учета электрической энергии считается Исправным или Вышедшим из строя

  // late TextEditingController _addressController;
  // late TextEditingController _objectTypeController;
  // late TextEditingController _statusController;
  // late TextEditingController _consumerController;
  // late TextEditingController _identityDocumentController;

  // наличие пломб
  // bool _sovereignSealPresenceController = true; // госповерителя
  // bool _terminalCoverSealPresenceController = true; // на клемной крышке
  // bool _cabinetSealPresenceController = true; // на шкафу учета

  @override
  void initState() {
    super.initState();
    _numberPuController = TextEditingController(text: '79402374');
    _dateController = TextEditingController(text: DateFormat('dd.MM.yyyy HH:mm').format(DateTime.now()));
    // _addressController = TextEditingController(text: 'Ул. Пушкина 12 кв 124');
    // _objectTypeController = TextEditingController(text: 'Жилой дом, ветхий');
    // _statusController = TextEditingController(text: 'Собственник');
    // _consumerController = TextEditingController(text: 'Иванов Иван Иванович');
    // _identityDocumentController = TextEditingController(text: 'паспорт: 3610 555555 УФМС России');

    _puTypeController = puTypes[0];
    _mechanicalDamageController = mechanicalDamageValues[0];
    _unmeteredConsumptionController = unmeteredConsumptionValues[0];
    _holesExistController = holesExistValues[0];
    _fittingIndicatorGlassController = fittingIndicatorGlassValues[0];
    _stampDamageController = stampDamageValues[0];
    _switchingElementsFreeAccessController = switchingElementsFreeAccessValues[1];
    _serviceabilityPuController = serviceabilityPuValues[0];
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
                height: 64,
                width: 20,
                child: Center(child: Image.asset('assets/nav_back.png', height: 16, width: 16)),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(flex: 1, child: filledTextField('Акт №', _Controller)),
                    Expanded(flex: 0, child: SizedBox(width: 20)),
                    Expanded(flex: 1, child: dateField('Дата и время составления', _dateController, 'date_with_time')),
                  ],
                ),
                SizedBox(height: 18),
                filledTextField('Место составления акта', _Controller),
                SizedBox(height: 18),
                filledTextField('Представитель АО ЧЭСК', _Controller),
                SizedBox(height: 18),
                filledTextField('Должность представителя АО ЧЭСК', _Controller),
                SizedBox(height: 18),
                filledTextField('Представитель потребителя', _Controller),
                SizedBox(height: 18),
                filledTextField('При составлении акта присутствовали', _Controller),

                SizedBox(height: 18),
                disabledTextField('Потребитель', 'Иванов Сергей Сергеевич'),
                SizedBox(height: 18),
                disabledTextField('Адрес регистрации', 'Ул. Пушкина 12 кв 124'),
                SizedBox(height: 18),
                filledTextField('Номер телефона', _Controller),
                SizedBox(height: 18),
                disabledTextField('Номер лицевого счета', '23754890'),

                SizedBox(height: 18),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(flex: 1, child: filledTextField('Номер договора электроснабжения', _Controller)),
                    Expanded(flex: 0, child: SizedBox(width: 20)),
                    Expanded(flex: 1, child: dateField('Дата договора электроснабжения', _contractDateController, '')),
                  ],
                ),

                SizedBox(height: 18),
                disabledTextField('Адрес, где установлен прибор учета', 'Ул. Пушкина 12 кв 124'),
                SizedBox(height: 18),
                filledTextField('Номер прибора учета', _numberPuController),
                SizedBox(height: 18),
                selectTypePu('Тип прибора учета', puTypes),

                SizedBox(height: 18),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(flex: 1, child: filledTextField('ном. ток, А', _Controller)),
                    Expanded(flex: 0, child: SizedBox(width: 20)),
                    Expanded(flex: 1, child: filledTextField('макс. ток, А', _Controller))
                  ],
                ),
                SizedBox(height: 18),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(flex: 1, child: filledTextField('кл. т', _Controller)),
                    Expanded(flex: 0, child: SizedBox(width: 20)),
                    Expanded(flex: 1, child: filledTextField('тип ТТ', _Controller))
                  ],
                ),
                SizedBox(height: 18),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(flex: 1, child: filledTextField('номера ТТ', _Controller)),
                    Expanded(flex: 0, child: SizedBox(width: 20)),
                    Expanded(flex: 1, child: filledTextField('перв. ток ТТ, А', _Controller))
                  ],
                ),
                SizedBox(height: 18),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(flex: 1, child: filledTextField('втор. ток ТТ, А', _Controller)),
                    Expanded(flex: 0, child: SizedBox(width: 20)),
                    Expanded(flex: 1, child: filledTextField('расчетный коэффициент', _Controller))
                  ],
                ),

                SizedBox(height: 18),
                fieldWithPhoto('Показание 1-но тарифного прибора учета', _Controller, ''),
                SizedBox(height: 18),
                fieldWithPhoto('Показание прибора учета, день', _Controller, ''),
                SizedBox(height: 18),
                fieldWithPhoto('Показание прибора учета, ночь', _Controller, ''),
                SizedBox(height: 18),
                fieldWithPhoto('Показание прибора учета, полупик', _Controller, ''),
                SizedBox(height: 18),
                fieldWithPhoto('Показание прибора учета, пик', _Controller, ''),

                SizedBox(height: 18),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(flex: 1, child: filledTextField('Номер уведомления', _Controller)),
                    Expanded(flex: 0, child: SizedBox(width: 20)),
                    Expanded(flex: 1, child: dateField('Дата уведомления', _Controller, '')),
                  ],
                ),
                SizedBox(height: 18),
                dateField('Дата уведомления', _Controller, ''),

                SizedBox(height: 18),
                selectMechanicalDamage('Механические повреждения на корпусе ПУ', mechanicalDamageValues),
                SizedBox(height: 18),
                selectMechanicalDamage('Отверстия, трещины в корпусе ПУ', holesExistValues),
                SizedBox(height: 18),
                selectFittingIndicatorGlass('Прилегание стекла индикатора', fittingIndicatorGlassValues),
                SizedBox(height: 18),
                selectMechanicalDamage('Нарушение пломб', stampDamageValues),
                SizedBox(height: 18),
                selectSwitchingElementsFreeAccess('Свободный доступ к элементам коммутации', switchingElementsFreeAccessValues),
                SizedBox(height: 18),
                filledTextField('Прочие отметки', _Controller),
                SizedBox(height: 18),
                selectServiceabilityPu('Прибор учета электрической энергии считается', serviceabilityPuValues),
                SizedBox(height: 18),
                filledTextField('Возражения (позиция) потребителя (представителя потребителя)', _Controller),
                SizedBox(height: 18),
                filledTextField('Причины отказа потребителя (представителя потребителя) от подписания акта', _Controller),


                SizedBox(height: 18),
                Row(
                  children: [
                    Expanded(
                        child: RawMaterialButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                        }
                      },
                      fillColor: orangeBtnColor,
                      shape: const StadiumBorder(),
                      child: Text(
                        "Сохранить".toUpperCase(),
                        maxLines: 1,
                        style: GoogleFonts.roboto(
                            fontSize: 12, color: Colors.white, fontWeight: FontWeight.w500),
                      ),
                    )),
                    SizedBox(width: 20),
                    Expanded(
                      child: TextButton(
                          child: Text(
                            'Распечатать'.toUpperCase(),
                            style: GoogleFonts.roboto(
                                fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(blueBtnColor),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(color: blueBtnColorBorder)))),
                          onPressed: () {}),
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }

  Column dateField(String title, TextEditingController controller, String dateFormat) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // SizedBox(height: 18),
        Text(title, style: labelFontStyle),
        SizedBox(height: 7),
        Container(
          child: TextField(
            // enabled: false,
            controller: controller,
            keyboardType: TextInputType.number,
            style: TextStyle(fontSize: 14, color: textFieldColor),
            decoration: InputDecoration(
              suffixIcon: Align(
                widthFactor: 1.0,
                heightFactor: 1.0,
                child: GestureDetector(
                  onTap: () {
                    _selectDate(controller, dateFormat);
                  },
                  child: ImageIcon(AssetImage('assets/date.png'),
                      size: 12, color: Color.fromRGBO(158, 161, 162, 1)),
                ),
              ),
              filled: true,
              fillColor: Color.fromRGBO(242, 242, 242, 1),
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

  Column disabledTextField(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // SizedBox(height: 18),
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
                hintStyle: TextStyle(fontSize: 14, color: textFieldColor)),
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

      if (type == 'date_with_time') {
        formattedDate = DateFormat('dd.MM.yyyy HH:mm').format(picked);
      } else if (type == 'year_only') {
      }

      setState(() {});
      controller.text = formattedDate;
    }
  }

  Column filledTextField(String title, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // SizedBox(height: 18),
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

  Column selectTypePu(String title, List<String> values) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: labelFontStyle,
        ),
        SizedBox(height: 7),
        Container(
          child: DropdownButtonFormField<String>(
            value: _puTypeController,
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
                child: Text(label, style: GoogleFonts.roboto(fontSize: 14)),
              );
            }).toList(),
            validator: (value) {
              return value?.isEmpty ?? true ? 'Поле обязательно для заполнения' : null;
            },
            onChanged: (newValue) {
              setState(() {
                _puTypeController = newValue;
              });
            },
          ),
        )
      ],
    );
  }

  // Проведение наружного осмотра, механические повреждения
  Column selectMechanicalDamage(String title, List<String> values) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: labelFontStyle),
        SizedBox(height: 7),
        Container(
          child: DropdownButtonFormField<String>(
            value: _mechanicalDamageController,
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
                child: Text(label, style: GoogleFonts.roboto(fontSize: 14)),
              );
            }).toList(),
            onChanged: (newValue) {
              setState(() {
                _mechanicalDamageController = newValue;
              });
            },
          ),
        )
      ],
    );
  }

  // Прилегание стекла индикатора
  Column selectFittingIndicatorGlass(String title, List<String> values) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: labelFontStyle),
        SizedBox(height: 7),
        Container(
          child: DropdownButtonFormField<String>(
            value: _fittingIndicatorGlassController,
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
                child: Text(label, style: GoogleFonts.roboto(fontSize: 14)),
              );
            }).toList(),
            onChanged: (newValue) {
              setState(() {
                _fittingIndicatorGlassController = newValue;
              });
            },
          ),
        )
      ],
    );
  }

  // Свободный доступ к элементам коммутации
  Column selectSwitchingElementsFreeAccess(String title, List<String> values) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: labelFontStyle),
        SizedBox(height: 7),
        Container(
          child: DropdownButtonFormField<String>(
            value: _switchingElementsFreeAccessController,
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
                child: Text(label, style: GoogleFonts.roboto(fontSize: 14)),
              );
            }).toList(),
            onChanged: (newValue) {
              setState(() {
                _switchingElementsFreeAccessController = newValue;
              });
            },
          ),
        )
      ],
    );
  }

  // Прибор учета электрической энергии считается Исправным / Вышедшим из строя
  Column selectServiceabilityPu(String title, List<String> values) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: labelFontStyle),
        SizedBox(height: 7),
        Container(
          child: DropdownButtonFormField<String>(
            value: _serviceabilityPuController,
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
                child: Text(label, style: GoogleFonts.roboto(fontSize: 14)),
              );
            }).toList(),
            onChanged: (newValue) {
              setState(() {
                _serviceabilityPuController = newValue;
              });
            },
          ),
        )
      ],
    );
  }

  Column fieldWithPhoto(String title, TextEditingController controller, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
                    color: Colors.grey),
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
}
