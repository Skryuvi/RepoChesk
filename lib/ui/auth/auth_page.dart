import 'package:chesk/assets_colors/uses_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'auth_presenter.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<AuthPage> createState() => _AuthPage();
}

class _AuthPage extends State<AuthPage> {
  var textVisibilityNotifier = ValueNotifier(false);
  late AuthPresenter presenter;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: authBackColor,
      body: SafeArea(
          child: Stack(children: [
        Positioned(
          left: MediaQuery.of(context).size.width * 0.06,
          height: MediaQuery.of(context).size.height * 0.08,
          top: MediaQuery.of(context).size.height * 0.09,
          child: Image.asset('assets/product_icon_page.png'),
        ),
        Positioned(
            left: MediaQuery.of(context).size.width * 0.06,
            top: MediaQuery.of(context).size.height * 0.2,
            child: Text(
              'Планирование и контроль \nобходов точек учета потребителей \nэлектрической энергии',
              style: GoogleFonts.roboto(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            )),
        Positioned(
            left: MediaQuery.of(context).size.width * 0.06,
            right: MediaQuery.of(context).size.width * 0.06,
            top: MediaQuery.of(context).size.height * 0.36,
            child: loginField()),
        Positioned(
            left: MediaQuery.of(context).size.width * 0.06,
            right: MediaQuery.of(context).size.width * 0.06,
            top: MediaQuery.of(context).size.height * 0.45,
            child: passwordField()),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.54,
          left: MediaQuery.of(context).size.width * 0.02,
          right: MediaQuery.of(context).size.width * 0.02,
          child: btnSignIn(),
        )
      ])),
    );
  }
  @override
  initState(){
    presenter = AuthPresenter(context);
    super.initState();
  }

  ///LoginField
  Widget loginField() {
    return ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: Container(
            child: Row(children: [
              Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    child: Image.asset(
                      'assets/auth_login.png',
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    margin: EdgeInsets.only(left: 12),
                  )),
              Expanded(
                  child: Container(
                      margin: EdgeInsets.only(left: 8, right: 44),
                      child: CupertinoTextField(
                        placeholder: 'Имя пользователя',
                        cursorColor: Colors.black,
                        decoration: BoxDecoration(color: Colors.transparent),
                      ))),
            ]),
            height: MediaQuery.of(context).size.height * 0.075,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
            )));
  }
  ///PasswordField
  Widget passwordField() {
    return ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: Container(
            child: Row(children: [
              Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    child: Image.asset(
                      'assets/auth_password.png',
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    margin: EdgeInsets.only(left: 12),
                  )),
              Expanded(
                  child: Container(
                      margin: EdgeInsets.only(left: 8),
                      child: ValueListenableBuilder(
                        builder: (BuildContext context, value, Widget? child) {
                          return CupertinoTextField(
                            obscureText: value as bool,
                            cursorColor: Colors.black,
                            placeholder: 'Пароль',
                            decoration:
                                BoxDecoration(color: Colors.transparent),
                          );
                        },
                        valueListenable: textVisibilityNotifier,
                      ))),
              Container(
                  height: MediaQuery.of(context).size.height * 0.03,
                  width: MediaQuery.of(context).size.height * 0.03,
                  margin: EdgeInsets.only(right: 10),
                  child: Center(
                      child: ValueListenableBuilder(
                    valueListenable: textVisibilityNotifier,
                    builder: (BuildContext context, value, Widget? child) {
                      return GestureDetector(
                        child: value == false
                            ? Image.asset('assets/pass_hide.png')
                            : Image.asset('assets/pass_show.png'),
                        onTap: () {
                          if (value == true) {
                            textVisibilityNotifier.value = false;
                          } else {
                            textVisibilityNotifier.value = true;
                          }
                        },
                      );
                    },
                  ))),
            ]),
            height: MediaQuery.of(context).size.height * 0.075,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
            )));
  }
  ///btnSignIn
  Widget btnSignIn() {
    return CupertinoButton(
        onPressed: () {
          presenter.toMainScreen();
        },
        child: ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Container(
                height: MediaQuery.of(context).size.height * 0.075,
                decoration: BoxDecoration(
                    color: authBtnColor,
                    borderRadius: BorderRadius.circular(4)),
                child: Row(children: [
                  Align(
                      alignment: Alignment.centerLeft, child: textBtnSignIn()),
                  Expanded(
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: arrowBtnSignIn()),
                  )
                ]))));
  }
  ///TextSignIn
  Widget textBtnSignIn() {
    return Container(
      margin: EdgeInsets.only(left: 10),
      child: Text('Выполнить вход',
          style: GoogleFonts.roboto(color: Colors.white, fontSize: 14)),
    );
  }
  ///ImageSignIn
  Widget arrowBtnSignIn() {
    return Container(
        margin: EdgeInsets.only(right: 12),
        child: Image.asset(
          'assets/arrow_to.png',
          height: MediaQuery.of(context).size.height * 0.015,
        ));
  }
}
