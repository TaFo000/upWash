import 'dart:ffi';

import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:up_wash/pages/mapThird.dart';
import 'package:up_wash/pages/order.dart';
import 'package:up_wash/ui/Buttons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../common_setup/Assets.dart';
import '../../common_setup/Routes.dart';
import '../upWashColors.dart';

class PaymentMethodScreen extends StatefulWidget {
  PaymentMethodScreen({Key? key}) : super(key: key);

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  bool isChoosenFirst = false;
  bool isChoosenSecond = false;

  @override
  Widget build(BuildContext context) {
    final UpWashColors upwashColors = Theme.of(context).extension<UpWashColors>()!;
    return Scaffold(
      backgroundColor: upwashColors.backgroundColor,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Column(children: [
                  Row(children: [
                    IconButton(icon: Icon(Icons.arrow_back),
                    onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => OrderScreen()));
                    },),
                    SizedBox(width: 24,),
                    Text(AppLocalizations.of(context).paymentMethod,
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500
                      ),),
                  ],),
                SizedBox(height: 33),
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
                    color: Colors.white,
                    child: ListTile(
                      leading: ImageIcon(
                        AssetImage(A.applePay),
                        color: Colors.black,
                      ),
                      title: Text(AppLocalizations.of(context).applePay,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black
                      ),),
                      trailing: isChoosenFirst ? Icon(Icons.check_circle,
                      color: Color(0xffFF6600),) : null,
                      onTap: (){
                        isChoosenFirst = true;
                        isChoosenSecond = false;
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
                    color: Colors.white,
                    child: ListTile(
                      leading: ImageIcon(
                        AssetImage(A.cardPay),
                        color: Colors.black,
                      ),
                      title: Text(AppLocalizations.of(context).addCard,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          color: Colors.black
                        ),),
                      trailing: isChoosenSecond ? Icon(Icons.check_circle,
                        color: Color(0xffFF6600),) : null,
                      onTap: (){
                        isChoosenSecond = true;
                        isChoosenFirst = false;
                        setState(() {

                        });
                      },
                    ),
                  ),
                ),
                SizedBox(height: 490),
                PrimaryButton(title: AppLocalizations.of(context).pay, onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MapThirdScreen()));
                })
              ],),
            ),
          ),
        )
    );
  }
}
