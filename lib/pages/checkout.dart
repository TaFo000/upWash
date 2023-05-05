import 'dart:ffi';

import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'package:up_wash/pages/checkoutBottomSheet.dart';
import 'package:up_wash/pages/mapSecond.dart';
import 'package:up_wash/provider.dart';
import 'package:up_wash/ui/Buttons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../common_setup/Assets.dart';
import '../../common_setup/Routes.dart';
import '../upWashColors.dart';

class CheckoutScreen extends StatefulWidget {
  CheckoutScreen({Key? key}) : super(key: key);



  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  var maskFormatterExpdate = new MaskTextInputFormatter(
      mask: '##/##',
      filter: { "#": RegExp(r'[0-9]') },
      type: MaskAutoCompletionType.lazy
  );
  var maskFormatterCardnumber = new MaskTextInputFormatter(
      mask: '#### #### #### ####',
      filter: { "#": RegExp(r'[0-9]') },
      type: MaskAutoCompletionType.lazy
  );



  @override
  Widget build(BuildContext context) {
    final UpWashColors upwashColors = Theme.of(context).extension<UpWashColors>()!;
    return Scaffold(
      backgroundColor:  upwashColors.backgroundColor,
        drawer: Container(
          width: 250,
          child: Drawer(
            child: Container(
              decoration: BoxDecoration(
                  color: upwashColors.backgroundColor
              ),
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  SizedBox(
                    height: 250,
                    child: DrawerHeader(
                      decoration: BoxDecoration(color: upwashColors.backgroundColor),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage(A.avatarWoman),
                            radius: 45,
                          ),
                          SizedBox(height: 20),
                          Text("Salini Detroja",
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w500
                            ),),
                          SizedBox(height: 10),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.circular(
                                    4),
                                color: Colors.white),
                            height: 25,
                            width: 100,
                            child: Material(
                              color: Color(0xffF6F6F6),
                              child: InkWell(
                                borderRadius:
                                BorderRadius.circular(
                                    4),
                                onTap: () {},
                                child: Center(
                                  child: Row(
                                    children: [
                                      ImageIcon(AssetImage(A.editIcon),
                                          color: Color(0xffFF6600)),
                                      Text(
                                        AppLocalizations.of(
                                            context).editProfile,
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontWeight:
                                            FontWeight
                                                .w500,
                                            color: Color(
                                                0xffFF6600)),
                                      ),
                                      SizedBox(width: 9,)
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ListTile(
                    leading: SvgPicture.asset('assets/images/paymentIcon.svg'),
                    title: Text(AppLocalizations.of(context).paymentMethod,
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500
                      ),),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: SvgPicture.asset('assets/images/campaignIcon.svg'),
                    title: Text(AppLocalizations.of(context).campaign,
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500
                      ),),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: SvgPicture.asset('assets/images/ordersIcon.svg'),
                    title: Text(AppLocalizations.of(context).myOrders,
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500
                      ),),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: SvgPicture.asset('assets/images/addressesIcon.svg'),
                    title: Text(AppLocalizations.of(context).addresses,
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500
                      ),),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: SvgPicture.asset('assets/images/forCompaniesIcon.svg'),
                    title: Text(AppLocalizations.of(context).forCompanies,
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500
                      ),),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: SvgPicture.asset('assets/images/supportIcon.svg'),
                    title: Text(AppLocalizations.of(context).support,
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500
                      ),),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: SvgPicture.asset('assets/images/aboutIcon.svg'),
                    title: Text(AppLocalizations.of(context).aboutUs,
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500
                      ),),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(height: 133),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 21),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.circular(
                              4),
                          color: Color(0xffFF6600)),
                      height: 38,
                      width: 212,
                      child: Material(
                        color: Color(0xffFF6600),
                        child: InkWell(
                          borderRadius:
                          BorderRadius.circular(
                              4),
                          onTap: () {},
                          child: Center(
                              child: Text(
                                AppLocalizations.of(
                                    context).sideMenuButton,
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight:
                                    FontWeight
                                        .w700,
                                    color: Colors.white),
                              )
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
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
                  Builder(builder: (context) => // Ensure Scaffold is in context
                  IconButton(
                      icon: Icon(Icons.menu,
                      color: upwashColors.textColor,),
                      onPressed: () => Scaffold.of(context).openDrawer()
                  )),
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
                  color: upwashColors.primaryOrange,
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
                    hintStyle: TextStyle(color: Colors.black),
                    suffixIcon: ImageIcon(
                      AssetImage(A.visaLogo),
                      color: null,
                    )),
                  inputFormatters: [maskFormatterCardnumber]

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
                        hintStyle: TextStyle(color: Colors.black)
                      ),
                        inputFormatters: [maskFormatterExpdate]
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
                        hintStyle: TextStyle(color: Colors.black)
                      ),
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(3),
                        ]
                    ),
                  ),
                ],
              ),
              SizedBox(height: 120),
              PrimaryButton(
                  title: AppLocalizations.of(context).pay, onTap: () {
                showModalBottomSheet<void>(
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (BuildContext context) {
                    return CheckoutBottomSheet();
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

