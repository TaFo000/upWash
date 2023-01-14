import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:up_wash/ui/Buttons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


import '../../common_setup/Assets.dart';
import '../../common_setup/Routes.dart';

class SignUpScreen extends StatelessWidget {

  SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
            children: <Widget>[
              Positioned(
                top: 52,
                left: 126,
                right:126,
                child: Image.asset('assets/images/logo.png',
                height: 120,
                width: 120,
                fit: BoxFit.fitWidth,
              ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                    height: MediaQuery.of(context).size.height/1.32,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(top: Radius.circular(23)
                        ),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 5),
                              blurRadius: 32,
                              color: Color(0xffD9D9D9)
                          )
                        ]
                    )
                ),
              ),
              SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 185, 0, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 19),
                            child: Text(AppLocalizations.of(context).signUpText,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500
                            ),),
                          ),
                        SizedBox(height: 21,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                         Container(
                            height: 54,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      offset: Offset(0, 10),
                                      blurRadius: 32,
                                      color: Color(0xffD9D9D9)
                                  )
                                ],
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white,
                            ),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                borderRadius: BorderRadius.circular(16),
                                onTap: (){},
                                child: Center(
                                  child: Row(children: [
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
                                              color: Colors.black)
                                      ),
                                    ),

                                  ],)
                                ),
                              ),
                            ),
                        ),
                            Container(
                                height: 54,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        offset: Offset(0, 10),
                                        blurRadius: 32,
                                        color: Color(0xffD9D9D9)
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.white,
                                ),
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(16),
                                    onTap: (){},
                                    child: Center(
                                        child: Row(children: [
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
                                                    color: Colors.black)
                                            ),
                                          ),

                                        ],)
                                    ),
                                  ),
                                ),
                              ),
                            Container(
                                height: 54,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        offset: Offset(0, 10),
                                        blurRadius: 32,
                                        color: Color(0xffD9D9D9)
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.white,
                                ),
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(16),
                                    onTap: (){},
                                    child: Center(
                                        child: Row(children: [
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
                                                    color: Colors.black)
                                            ),
                                          ),

                                        ],)
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                        SizedBox(height: 18,),
                        //Or Text
                        Row(
                            children: <Widget>[
                              Expanded(
                                  child: Divider()
                              ),

                              Text("OR"),

                              Expanded(
                                  child: Divider()
                              ),
                            ]
                        ),
                        SizedBox(height: 18),
                        Row(children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Image.asset(A.emailLogo),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 11),
                            child: Text(AppLocalizations.of(context).emailSignUp,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500
                            ),),
                          )
                        ],),
                        SizedBox(height: 13),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Color(0xffF6F6F6),
                              border:  OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7),
                                borderSide: BorderSide(
                                  width: 0,
                                  style: BorderStyle.none,
                                ),
                              ),
                              hintText: AppLocalizations.of(context).hintTextEmail
                            ),
                          ),
                        ),
                        SizedBox(height: 18),
                        Row(children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Image.asset(A.passwordLogo),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 11),
                            child: Text(AppLocalizations.of(context).passwordSignUp,
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500
                              ),),
                          )
                        ],),
                        SizedBox(height: 15),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextField(
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Color(0xffF6F6F6),
                                border:  OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(7),
                                  borderSide: BorderSide(
                                    width: 0,
                                    style: BorderStyle.none,
                                  ),
                                ),
                                hintText: AppLocalizations.of(context).hintTextPassword
                            ),
                          ),
                        ),
                        SizedBox(height: 18),
                        Row(children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Image.asset(A.passwordLogo),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 11),
                            child: Text(AppLocalizations.of(context).passwordConfirmSignUp,
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500
                              ),),
                          )
                        ],),
                        SizedBox(height: 15),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextField(
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Color(0xffF6F6F6),
                                border:  OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(7),
                                  borderSide: BorderSide(
                                    width: 0,
                                    style: BorderStyle.none,
                                  ),
                                ),
                                hintText: AppLocalizations.of(context).hintTextPassword
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: PrimaryButton(title: AppLocalizations.of(context).signUpButton, onTap: (){}),
                        ),
                        SizedBox(height: 19),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                          Text(AppLocalizations.of(context).guestTextFisrt,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500
                          ),),
                          Text(AppLocalizations.of(context).guestTextSecond,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),)
                        ],)


                      ],
                    ),
                  ),

              ),
            ]
        )
    );
  }
}