import 'dart:ffi';

import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:up_wash/pages/paymentMethod.dart';
import 'package:up_wash/pages/settings.dart';
import 'package:up_wash/ui/Buttons.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../common_setup/Assets.dart';
import '../../common_setup/Routes.dart';
import '../upWashColors.dart';

class OrderScreen extends StatelessWidget {
  OrderScreen({Key? key}) : super(key: key);

  final GlobalKey _one = GlobalKey();
  var maskFormatter = new MaskTextInputFormatter(
      mask: '+# (###) ###-##-##',
      filter: { "#": RegExp(r'[0-9]') },
      type: MaskAutoCompletionType.lazy
  );



  @override
  Widget build(BuildContext context) {
    final UpWashColors upwashColors = Theme.of(context).extension<UpWashColors>()!;
    return Scaffold(
      backgroundColor: upwashColors.backgroundColor,
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
                  ListTile(
                    leading: SvgPicture.asset('assets/images/settingsIcon.svg'),
                    title: Text(AppLocalizations.of(context).settings,
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500
                      ),),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  SettingsScreen()));
                    },
                  ),
                  SizedBox(height: 90),
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
                        AppLocalizations.of(context).order,
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  SizedBox(height: 35),
                  Text(AppLocalizations.of(context).enterDetails,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500
                  ),),
                  SizedBox(height: 19),
                  TextField(
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
                        hintText: AppLocalizations.of(context).name,
                      hintStyle: TextStyle(color: Colors.black)
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
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
                        hintText: AppLocalizations.of(context).email,
                      hintStyle: TextStyle(color: Colors.black)
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
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
                        hintText: AppLocalizations.of(context).telephone,
                      hintStyle: TextStyle(color: Colors.black)

                    ),
                      inputFormatters: [maskFormatter]
                  ),
                  SizedBox(height: 24),
                  Text(AppLocalizations.of(context).orderDetails,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500
                    ),),
                  SizedBox(height: 17),
                  Row(children: [
                    Text(AppLocalizations.of(context).date,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500
                      ),),
                    SizedBox(width: 209),
                    Text("11/02/2022",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500
                      ),),
                  ],),
                  SizedBox(height: 11),
                  Row(children: [
                    Text(AppLocalizations.of(context).time,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500
                      ),),
                    SizedBox(width: 222),
                    Text("09:00 AM",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500
                      ),),
                  ],),
                  SizedBox(height: 11),
                  Row(children: [
                    Text(AppLocalizations.of(context).regNo,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500
                      ),),
                    SizedBox(width: 202),
                    Text("1263-NRO",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500
                      ),),
                  ],),
                  SizedBox(height: 11),
                  Row(children: [
                    Text(AppLocalizations.of(context).vehicleType,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500
                      ),),
                    SizedBox(width: 190),
                    Text("SEDAN",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500
                      ),),
                  ],),
                  SizedBox(height: 18),
                  Text(AppLocalizations.of(context).location,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500
                    ),),
                  SizedBox(height: 12),
                  TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xffF6F6F6),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      prefixIcon: ImageIcon(
                        AssetImage(A.locationIcon),
                        color: Colors.black,
                      ),
                      hintText: AppLocalizations.of(context).yourLocation,
                      hintStyle: TextStyle(color: Colors.black)
                    ),
                  ),
                  SizedBox(height: 22),
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
                  SizedBox(height: 17,),
                  Text(AppLocalizations.of(context).orderNote,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500
                    ),),
                  SizedBox(height: 12),
                  SizedBox(
                    width: 345, // <-- TextField width
                    height: 120, // <-- TextField height
                    child: TextField(
                      textAlign: TextAlign.start,
                      maxLines: null,
                      expands: true,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(filled: true, hintText: AppLocalizations.of(context).note,
                        hintStyle: TextStyle(color: Colors.black),
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),),
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(AppLocalizations.of(context).addCoupon,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500
                    ),),
                  SizedBox(height: 12),
                  Container(
                    height: 57,
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
                          hintText: AppLocalizations.of(context).couponCode,
                        hintStyle: TextStyle(color: Colors.black)
                      ),
                    ),
                  ),
                  SizedBox(height: 26),
                  Container(
                    width: 345,
                    height: 51,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: upwashColors.primaryOrange),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(16),
                        onTap: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => PaymentMethodScreen()));
                        },
                        child:Row(children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 18),
                            child: Text(
                              AppLocalizations.of(context).checkout,
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                          ),
                          SizedBox(width: 205),
                          Text(
                            "\$78",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          ),
                        ],)

                      ),
                    ),
                  ),
                  SizedBox(height: 30,)
                ],
              ),
            ),
          ),)
    );
  }
}
