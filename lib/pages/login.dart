import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:up_wash/pages/NavigationBar.dart';
import 'package:up_wash/pages/signUp.dart';
import 'package:up_wash/ui/Buttons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../common_setup/Assets.dart';
import '../../common_setup/Routes.dart';
import '../upWashColors.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool passwordVisible = true;

  @override
  Widget build(BuildContext context) {
    final UpWashColors upwashColors =
        Theme.of(context).extension<UpWashColors>()!;

    return Scaffold(
        backgroundColor: upwashColors.backgroundColor,
        body: SingleChildScrollView(
          child: Stack(children: <Widget>[
            Positioned(
              top: 32,
              left: 126,
              right: 126,
              child: Image.asset(
                'assets/images/logo.png',
                height: 120,
                width: 120,
                fit: BoxFit.fitWidth,
              ),
            ),
            Positioned(top: 169, child: Image.asset(A.carsWashing)),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                  height: MediaQuery.of(context).size.height / 1.7,
                  decoration: BoxDecoration(
                      color: upwashColors.backgroundColor,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(23)),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 5),
                            blurRadius: 32,
                            color: Color(0xffD9D9D9))
                      ])),
            ),
            SafeArea(
                child: Padding(
              padding: const EdgeInsets.only(top: 323),
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Image.asset(A.emailLogo),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 11),
                        child: Text(
                          AppLocalizations.of(context).emailLogin,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 13),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      style: TextStyle(color: Colors.black38),
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xffF6F6F6),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7),
                            borderSide: BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                          ),
                          hintText: AppLocalizations.of(context).hintTextEmail,
                          hintStyle: TextStyle(color: Colors.black38)),
                    ),
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Image.asset(A.passwordLogo),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 11),
                        child: Text(
                          AppLocalizations.of(context).passwordSignUp,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      style: TextStyle(color: Colors.black38),
                      obscureText: passwordVisible,
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: Icon(
                              passwordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              setState(() {
                                passwordVisible = !passwordVisible;
                              });
                            },
                          ),
                          filled: true,
                          fillColor: Color(0xffF6F6F6),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7),
                            borderSide: BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                          ),
                          hintText: AppLocalizations.of(context).hintTextPassword,
                          hintStyle: TextStyle(color: Colors.black38)),
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(AppLocalizations.of(context).forgotPassword,
                      textAlign: TextAlign.end),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 21),
                    child: PrimaryButton(
                        title: AppLocalizations.of(context).loginButton,
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NavigationBarScreen()));
                        }),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUpScreen()));
                          },
                          child: Text(AppLocalizations.of(context).noAccountFirst,
                              style: TextStyle(color: upwashColors.textColor))),
                      SizedBox(width: 5),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUpScreen()));
                          },
                          child: Text(
                            AppLocalizations.of(context).noAccountSecond,
                            style: TextStyle(
                                color: upwashColors.textColor, fontWeight: FontWeight.bold),
                          ))
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 54,
                        decoration: BoxDecoration(
                          // //boxShadow: [
                          //   BoxShadow(
                          //       offset: Offset(4, 10),
                          //       blurRadius: 32,
                          //       color: Color(0xffB3C6D3))
                          // ],
                          borderRadius: BorderRadius.circular(5),
                          color: upwashColors.iconButtonColor,
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(16),
                            onTap: () {},
                            child: Center(
                                child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(15, 0, 3, 0),
                                  child: Image.asset(A.googleLogo),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 14),
                                  child: Text(
                                      AppLocalizations.of(context).googleButton,
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          color: upwashColors.textColor)),
                                ),
                              ],
                            )),
                          ),
                        ),
                      ),
                      Container(
                        height: 54,
                        decoration: BoxDecoration(
                          // boxShadow: [
                          //   BoxShadow(
                          //       offset: Offset(0, 10),
                          //       blurRadius: 32,
                          //       color: Color(0xffD9D9D9))
                          // ],
                          borderRadius: BorderRadius.circular(5),
                          color: upwashColors.iconButtonColor,
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(16),
                            onTap: () {},
                            child: Center(
                                child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(16, 0, 3, 0),
                                  child: Image.asset(A.appleLogo),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 16),
                                  child: Text(
                                      AppLocalizations.of(context).appleButton,
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          color: upwashColors.textColor)),
                                ),
                              ],
                            )),
                          ),
                        ),
                      ),
                      Container(
                        height: 54,
                        decoration: BoxDecoration(
                          // boxShadow: [
                          //   BoxShadow(
                          //       offset: Offset(0, 10),
                          //       blurRadius: 32,
                          //       color: Color(0xffD9D9D9))
                          // ],
                          borderRadius: BorderRadius.circular(5),
                          color: upwashColors.iconButtonColor,
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(16),
                            onTap: () {},
                            child: Center(
                                child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(8, 0, 1, 0),
                                  child: Image.asset(A.facebookLogo),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 8),
                                  child: Text(
                                      AppLocalizations.of(context).facebookButton,
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          color: upwashColors.textColor)),
                                ),
                              ],
                            )),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ))
          ]),
        ));
  }
}
