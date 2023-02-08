import 'dart:ffi';

import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:up_wash/pages/mapSecond.dart';
import 'package:up_wash/ui/Buttons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../common_setup/Assets.dart';
import '../../common_setup/Routes.dart';

class CheckoutScreen extends StatefulWidget {
  CheckoutScreen({Key? key}) : super(key: key);

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {

  bool isChoosenFirst = false;
  bool isChoosenSecond = false;
  bool isChoosenThird = false;
  bool isChoosenFour = false;

  final GlobalKey _one = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 21),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Row(
                children: [
                  Icon(
                    Icons.menu,
                    color: Colors.black,
                  ),
                  SizedBox(width: 19),
                  Text(
                    AppLocalizations.of(context).checkout,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                  )
                ],
              ),
              SizedBox(height: 35),
              Container(
                height: 255,
                decoration: BoxDecoration(
                  color: Color(0xffFF6600),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.only(left: 18),
                      child: Text(
                        AppLocalizations.of(context).service,
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.7),
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(height: 15),
                    DottedLine(
                      lineLength: 400,
                      dashColor: Colors.white.withOpacity(0.4),
                      dashGapLength: 3,
                      dashLength: 2,
                    ),
                    SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      child: Row(
                        children: [
                          Icon(Icons.circle_outlined,
                              color: Colors.white, size: 8),
                          SizedBox(width: 10),
                          Text(
                            AppLocalizations.of(context).tireChange,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(width: 168),
                          Text(
                            "\$39",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 12),
                    DottedLine(
                      lineLength: 400,
                      dashColor: Colors.white.withOpacity(0.4),
                      dashGapLength: 3,
                      dashLength: 2,
                    ),
                    SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.only(left: 18),
                      child: Text(
                        AppLocalizations.of(context).addon,
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.7),
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(height: 15),
                    DottedLine(
                      lineLength: 400,
                      dashColor: Colors.white.withOpacity(0.4),
                      dashGapLength: 3,
                      dashLength: 2,
                    ),
                    SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      child: Row(
                        children: [
                          Icon(Icons.circle_outlined,
                              color: Colors.white, size: 8),
                          SizedBox(width: 10),
                          Text(
                            AppLocalizations.of(context).tireWax,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(width: 195),
                          Text(
                            "\$39",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 12),
                    DottedLine(
                      lineLength: 400,
                      dashColor: Colors.white.withOpacity(0.4),
                      dashGapLength: 3,
                      dashLength: 2,
                    ),
                    SizedBox(height: 21),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      child: Row(
                        children: [
                          Text(
                            AppLocalizations.of(context).total,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(width: 227),
                          Text(
                            "\$78",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 34),
              Text(
                AppLocalizations.of(context).cardNumber,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 13),
              TextField(
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xffF7F7F7),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    hintText: "1235 6589 1254 2365",
                    suffixIcon: ImageIcon(
                      AssetImage(A.visaLogo),
                      color: null,
                    )),
              ),
              SizedBox(height: 17),
              Row(
                children: [
                  Text(
                    AppLocalizations.of(context).expireDate,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(width: 90),
                  Text(
                    "CVC",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  )
                ],
              ),
              SizedBox(height: 13),
              Row(
                children: [
                  SizedBox(
                    width: 158,
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xffF7F7F7),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        hintText: "MM/YY",
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  SizedBox(
                    width: 158,
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xffF7F7F7),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        hintText: "CVC",
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 120),
              PrimaryButton(
                  title: AppLocalizations.of(context).pay, onTap: () {
                showModalBottomSheet<void>(
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (BuildContext context) {
                    return DraggableScrollableSheet(
                      initialChildSize: 1,
                      builder: (BuildContext context, ScrollController scrollController) {
                        return Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(0, 10),
                                  blurRadius: 32,
                                  color: Color(0xffD9D9D9))
                            ],
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white,
                          ),
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 11),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 135),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Color(0xffDEDFE4),
                                          borderRadius: BorderRadius.circular(30)),
                                      width: 75,
                                      height: 3,
                                    ),
                                  ),
                                  SizedBox(height: 53,),
                                  Text(AppLocalizations.of(context).payWith,
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w500
                                    ),),
                                  SizedBox(height: 23),
                                  Container(
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                              offset: Offset(0, 0),
                                              blurRadius: 16,
                                              color: Color(0xffEDEDED)
                                          )
                                        ]
                                    ),
                                    child: Card(
                                      child: ListTile(
                                        leading: ImageIcon(
                                          AssetImage(A.cardPay),
                                          color: Colors.black,
                                        ),
                                        title: Text(AppLocalizations.of(context).cardPay,
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500
                                          ),),
                                        trailing: isChoosenFirst ? ImageIcon(AssetImage(A.checkIcon),
                                          color: Color(0xffFF6600),) : null,
                                        onTap: (){
                                          isChoosenFirst = true;
                                          setState(() {

                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 11),
                                  Container(
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                              offset: Offset(0, 0),
                                              blurRadius: 16,
                                              color: Color(0xffEDEDED)
                                          )
                                        ]
                                    ),
                                    child: Card(
                                      child: ListTile(
                                        leading: ImageIcon(
                                          AssetImage(A.applePay),
                                          color: Colors.black,
                                        ),
                                        title: Text(AppLocalizations.of(context).applePay,
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500
                                          ),),
                                        trailing: isChoosenSecond ? ImageIcon(AssetImage(A.checkIcon),
                                          color: Color(0xffFF6600),) : null,
                                        onTap: (){
                                          isChoosenSecond = true;
                                          setState(() {

                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 11),
                                  Container(
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                              offset: Offset(0, 0),
                                              blurRadius: 16,
                                              color: Color(0xffEDEDED)
                                          )
                                        ]
                                    ),
                                    child: Card(
                                      child: ListTile(
                                        leading: ImageIcon(
                                          AssetImage(A.googlePay),
                                          color: Colors.black,
                                        ),
                                        title: Text(AppLocalizations.of(context).googlePay,
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500
                                          ),),
                                        trailing: isChoosenThird ? ImageIcon(AssetImage(A.checkIcon),
                                          color: Color(0xffFF6600),) : null,
                                        onTap: (){
                                          isChoosenThird = true;
                                          setState(() {

                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 11),
                                  Container(
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                              offset: Offset(0, 0),
                                              blurRadius: 16,
                                              color: Color(0xffEDEDED)
                                          )
                                        ]
                                    ),
                                    child: Card(
                                      child: ListTile(
                                        leading: ImageIcon(
                                          AssetImage(A.mobilePay),
                                          color: Colors.black,
                                        ),
                                        title: Text(AppLocalizations.of(context).mobilePay,
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500
                                          ),),
                                        trailing: isChoosenFour ? ImageIcon(AssetImage(A.checkIcon),
                                          color: Color(0xffFF6600),) : null,
                                        onTap: (){
                                          isChoosenFour = true;
                                          setState(() {

                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 23),
                                  PrimaryButton(title: AppLocalizations.of(context).pay, onTap: (){
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => MapSecondScreen()));
                                  })
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                );
              }),
            ],
          ),
        ),
      ),)
    );
  }
}
