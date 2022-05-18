import 'package:chesk/assets_colors/uses_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:chesk/lorem_ipsum_dolor_sit_amet.dart';

class ConsumerFormPage extends StatefulWidget {
  final String title;

  const ConsumerFormPage({Key? key, required this.title}) : super(key: key);

  @override
  State<ConsumerFormPage> createState() => _ConsumerFormPageState();
}

class _ConsumerFormPageState extends State<ConsumerFormPage> {
  var _formKey = GlobalKey<FormState>();

  // controllers
  final _Controller = TextEditingController(); // служебный-дефолтный контроллер
  late TextEditingController _dateController;
  late TextEditingController _addressController;
  late TextEditingController _objectTypeController;
  late TextEditingController _statusController;
  late TextEditingController _consumerController;
  late TextEditingController _birthDateController;
  late TextEditingController _birthPlaceController;
  late TextEditingController _identityDocumentController;
  late TextEditingController _numberPuController;
  String? _puTypeController;

  // наличие пломб
  bool _sovereignSealPresenceController = true; // госповерителя
  bool _terminalCoverSealPresenceController = true; // на клемной крышке
  bool _cabinetSealPresenceController = true; // на шкафу учета

  String? _mechanicalDamageController; // механические повреждения ПУ
  String? _unmeteredConsumptionController; // вмешательства в работу ПУ и безучетного потребления

  @override
  void initState() {
    super.initState();
    _dateController = TextEditingController(text: DateFormat('dd.MM.yyyy').format(DateTime.now()));
    _addressController = TextEditingController(text: 'Ул. Пушкина 12 кв 124');
    _objectTypeController = TextEditingController(text: 'Жилой дом, ветхий');
    _statusController = TextEditingController(text: 'Собственник');
    _consumerController = TextEditingController(text: 'Иванов Иван Иванович');
    _birthDateController = TextEditingController(text: '20.10.1991');
    _birthPlaceController = TextEditingController(text: 'г. Самара');
    _identityDocumentController = TextEditingController(text: 'паспорт: 3610 555555 УФМС России');
    _numberPuController = TextEditingController(text: '79402374');

    _puTypeController = puTypes[0];
    _mechanicalDamageController = mechanicalDamageValues[0];
    _unmeteredConsumptionController = unmeteredConsumptionValues[0];
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
                child: Center(
                    child: Image.asset(
                  'assets/nav_back.png',
                  height: 16,
                  width: 16,
                )),
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
                dateField('Дата составления', _dateController),
                SizedBox(height: 18),
                disabledTextField('Номер лицевого счета', '23754890'),
                SizedBox(height: 18),
                filledTextField('Адрес', _addressController),
                SizedBox(height: 18),
                filledTextField('Тип объекта и состояние', _objectTypeController),
                SizedBox(height: 18),
                filledTextField('Статус', _statusController),
                SizedBox(height: 18),
                filledTextField('Потребитель', _consumerController),
                SizedBox(height: 18),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(flex: 1, child: dateField('Дата рождения', _birthDateController)),
                    Expanded(flex: 0, child: SizedBox(width: 20)),
                    Expanded(flex: 1, child: filledTextField('Место рождения', _birthPlaceController))
                  ],
                ),
                SizedBox(height: 18),
                filledTextField('Документ, удостоверяющий личность', _identityDocumentController),
                SizedBox(height: 18),
                filledTextField('Место регистрации', _Controller),
                SizedBox(height: 18),
                filledTextField('Номер телефона', _Controller),
                SizedBox(height: 18),
                filledTextField('Документ, подтверждающий право собственности/пользования объектом', _Controller),
                SizedBox(height: 18),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(flex: 1, child: filledTextField('Количество зарегистрированных лиц', _Controller)),
                    Expanded(flex: 0, child: SizedBox(width: 20)),
                    Expanded(flex: 1, child: filledTextField('Количество комнат', _Controller))
                  ],
                ),
                SizedBox(height: 18),
                filledTextField('Особые отметки', _Controller),
                SizedBox(height: 18),
                filledTextField('Место установки ПУ', _Controller),
                SizedBox(height: 18),
                filledTextField('Номер прибора учета', _numberPuController),
                SizedBox(height: 18),
                selectTypePu('Статусы ПУ', puTypes),
                SizedBox(height: 18),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(flex: 1, child: filledTextField('Значность', _Controller)),
                    Expanded(flex: 0, child: SizedBox(width: 20)),
                    Expanded(flex: 1, child: filledTextField('Класс точности', _Controller))
                  ],
                ),
                SizedBox(height: 18),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(flex: 1, child: dateField('Год выпуска', _Controller)),
                    Expanded(flex: 0, child: SizedBox(width: 20)),
                    Expanded(flex: 1, child: dateField('Дата поверки', _Controller))
                  ],
                ),
                SizedBox(height: 18),

                // наличие пломб
                sealsPresence(),

                selectMechanicalDamage(
                  'Проведение наружного осмотра, механические повреждения',
                  mechanicalDamageValues
                ),
                selectUnmeteredConsumption(
                  'Проверка на наличие признаков вмешательства в работу ПУ и безучетного потребления',
                  unmeteredConsumptionValues
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
                filledTextField('Представитель потребителя', _Controller),
                SizedBox(height: 18),
                filledTextField('Представитель АО ЧЭСК', _Controller),


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

  // наличие пломб госповерителя
  Column sealsPresence() {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return orangeBtnColor;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Наличие пломб:', style: labelFontStyle),
        SizedBox(height: 7),
        Row(
          children: [
            Checkbox(
              checkColor: Colors.white,
              fillColor: MaterialStateProperty.resolveWith(getColor),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
              value: _sovereignSealPresenceController,
              onChanged: (bool? value) {
                setState(() {
                  _sovereignSealPresenceController = value!;
                });
              },
            ),
            Text('Госповерителя', style: GoogleFonts.roboto(fontSize: 13)),
          ],
        ),
        Row(
          children: [
            Checkbox(
              checkColor: Colors.white,
              fillColor: MaterialStateProperty.resolveWith(getColor),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
              value: _terminalCoverSealPresenceController,
              onChanged: (bool? value) {
                setState(() {
                  _terminalCoverSealPresenceController = value!;
                });
              },
            ),
            Text('На клеммной крышке', style: GoogleFonts.roboto(fontSize: 13)),
          ],
        ),
        Row(
          children: [
            Checkbox(
              checkColor: Colors.white,
              fillColor: MaterialStateProperty.resolveWith(getColor),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
              value: _cabinetSealPresenceController,
              onChanged: (bool? value) {
                setState(() {
                  _cabinetSealPresenceController = value!;
                });
              },
            ),
            Text('На шкафу учета', style: GoogleFonts.roboto(fontSize: 13)),
          ],
        ),
      ],
    );
  }

  Column dateField(String title, TextEditingController controller) {
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
                    _selectDate(controller, '');
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
      if (type == 'act_date') {
      } else if (type == 'release_new_pu_date') {
      } else if (type == 'replacement_date') {
      } else if (type == 'new_pu_last_verif_date') {
      } else if (type == 'new_pu_next_verif_date') {}

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
        SizedBox(height: 18),
        Text(
          title,
          style: labelFontStyle,
        ),
        SizedBox(height: 7),
        Container(
          child: DropdownButtonFormField<String>(
            value: _puTypeController,
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
              setState((){
                _puTypeController = newValue;
              });
            },
          ),
        )
      ],
    );
  }

  // Проверка на наличие признаков вмешательства в работу ПУ и безучетного потребления
  Column selectUnmeteredConsumption(String title, List<String> values) {
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
            value: _unmeteredConsumptionController,
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
              setState((){
                _unmeteredConsumptionController = newValue;
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
        SizedBox(height: 18),
        Text(
          title,
          style: labelFontStyle,
        ),
        SizedBox(height: 7),
        Container(
          child: DropdownButtonFormField<String>(
            value: _mechanicalDamageController,
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
              setState((){
                _mechanicalDamageController = newValue;
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
}
