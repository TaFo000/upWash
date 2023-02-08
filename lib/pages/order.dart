import 'dart:ffi';

import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:up_wash/pages/paymentMethod.dart';
import 'package:up_wash/ui/Buttons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../common_setup/Assets.dart';
import '../../common_setup/Routes.dart';

class OrderScreen extends StatelessWidget {
  OrderScreen({Key? key}) : super(key: key);

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
                        hintText: AppLocalizations.of(context).name
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
                        hintText: AppLocalizations.of(context).email
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
                        hintText: AppLocalizations.of(context).telephone
                    ),
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
                    ),
                  ),
                  SizedBox(height: 22),
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
                          hintText: AppLocalizations.of(context).couponCode
                      ),
                    ),
                  ),
                  SizedBox(height: 26),
                  Container(
                    width: 345,
                    height: 51,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color(0xffFF6600)),
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
                ],
              ),
            ),
          ),)
    );
  }
}
