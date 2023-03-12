import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../common_setup/Assets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../ui/Buttons.dart';
import 'mapSecond.dart';

class CheckoutBottomSheet extends StatefulWidget {

  CheckoutBottomSheet({Key? key}) : super(key: key);

  @override
  State<CheckoutBottomSheet> createState() => _CheckoutBottomSheetState();
}

class _CheckoutBottomSheetState extends State<CheckoutBottomSheet> {

  bool isChoosenFirst = false;
  bool isChoosenSecond = false;
  bool isChoosenThird = false;
  bool isChoosenFour = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
                child:  Card(
                  child: ListTile(
                    leading: ImageIcon(
                      AssetImage(A.cardPay),
                      color: Colors.black,
                    ),
                    title: Text(AppLocalizations.of(context).addCard,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500
                      ),),
                    trailing: isChoosenFirst ? Icon(Icons.check_circle,
                      color: Color(0xffFF6600),) : null,
                    onTap: (){
                      isChoosenFirst = true;
                      isChoosenSecond = false;
                      isChoosenThird = false;
                      isChoosenFour = false;
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
                    trailing: isChoosenSecond ? Icon( Icons.check_circle,
                      color: Color(0xffFF6600),) : null,
                    onTap: (){
                      isChoosenSecond = true;
                      isChoosenFirst = false;
                      isChoosenThird = false;
                      isChoosenFour = false;
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
                    trailing: isChoosenThird ? Icon( Icons.check_circle,
                      color: Color(0xffFF6600),) : null,
                    onTap: (){
                      isChoosenThird = true;
                      isChoosenFirst = false;
                      isChoosenSecond = false;
                      isChoosenFour = false;
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
                    trailing: isChoosenFour ? Icon( Icons.check_circle,
                      color: Color(0xffFF6600),) : null,
                    onTap: (){
                      isChoosenFour = true;
                      isChoosenFirst = false;
                      isChoosenSecond = false;
                      isChoosenThird = false;
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
              }),
              SizedBox(height: 23,)
            ],
          ),
        ),
      ),
    );

  }

}
