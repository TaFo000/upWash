

import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'package:up_wash/pages/NavigationBar.dart';
import 'package:up_wash/pages/checkoutBottomSheet.dart';
import 'package:up_wash/pages/home.dart';
import 'package:up_wash/pages/mapSecond.dart';
import 'package:up_wash/provider.dart';
import 'package:up_wash/ui/Buttons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../common_setup/Assets.dart';
import '../../common_setup/Routes.dart';
import '../upWashColors.dart';

class SettingsScreen extends StatefulWidget {
  SettingsScreen({Key? key}) : super(key: key);




  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool light0 = true;

  @override
  Widget build(BuildContext context) {
    final UpWashColors upwashColors = Theme.of(context).extension<UpWashColors>()!;
    return Scaffold(
       backgroundColor: upwashColors.backgroundColor,
      body: Column(children: [
        SizedBox(height: 66,),
        Row(children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(AppLocalizations.of(context).settings, style: TextStyle(color: upwashColors.textColor,
            fontSize: 24),),
          ),
          SizedBox(width: 208,),
          IconButton(
            icon: ImageIcon(AssetImage(A.cancelIconSettings)),
            color: upwashColors.textColor,
            onPressed: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => NavigationBarScreen()));
            },
          ),
        ],),
        SizedBox(height: 26,),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Row(children: [
            Image.asset(A.premium),
            SizedBox(width: 15),
            Text(AppLocalizations.of(context).premium, style: TextStyle(color: upwashColors.textColor, fontSize: 16),)
          ],),
        ),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Divider(thickness: 0.75, color: upwashColors.textColor,),
        ),
        SizedBox(height: 30,),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Row(children: [
            SvgPicture.asset('assets/images/systemColorIcon.svg'),
            SizedBox(width: 16),
            Text(AppLocalizations.of(context).theme, style: TextStyle(color: upwashColors.textColor, fontSize: 16),),
            SizedBox(width: 150,),
            CupertinoSwitch(
              activeColor: Colors.black38,
              thumbColor: upwashColors.primaryOrange,
              trackColor: Colors.black38,
              value: light0,
              onChanged: (value) {
                setState(() {

                });
                light0 = value;
                context.read<AppProvider>().changeTheme();
              },
            ),
          ],),
        ),
        SizedBox(height: 28),
       Padding(
         padding: const EdgeInsets.only(left: 8),
         child: Row(children: [ SvgPicture.asset('assets/images/changePasswordicon.svg'),
         SizedBox(width: 16,),
           Text(AppLocalizations.of(context).changePassword, style: TextStyle(color: upwashColors.textColor, fontSize: 16),),],),
       ),
        SizedBox(height: 34),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Row(children: [
            SvgPicture.asset('assets/images/systemColorIcon.svg'),
            SizedBox(width: 16),
            Text(AppLocalizations.of(context).changeIcon, style: TextStyle(color: upwashColors.textColor, fontSize: 16),),
          ],),
        ),
        SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Row(children: [
            SvgPicture.asset('assets/images/systemColorIcon.svg'),
            SizedBox(width: 16),
            Text(AppLocalizations.of(context).language, style: TextStyle(color: upwashColors.textColor, fontSize: 16),),
          ],),
        ),
        SizedBox(height: 30,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Divider(thickness: 0.75, color: upwashColors.textColor,),
        ),
        SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Row(children: [
            SvgPicture.asset('assets/images/supportSettingsIcon.svg'),
            SizedBox(width: 16),
            Text(AppLocalizations.of(context).support, style: TextStyle(color: upwashColors.textColor, fontSize: 16),),
          ],),
        ),
        SizedBox(height: 30,),
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Row(children: [
            SvgPicture.asset('assets/images/termsOfUseIcon.svg'),
            SizedBox(width: 16),
            Text(AppLocalizations.of(context).termsOfUse, style: TextStyle(color: upwashColors.textColor, fontSize: 16),),
          ],),
        ),
        SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Row(children: [
            SvgPicture.asset('assets/images/termsOfUseIcon.svg'),
            SizedBox(width: 16),
            Text(AppLocalizations.of(context).privacyPolicy, style: TextStyle(color: upwashColors.textColor, fontSize: 16),),
          ],),
        ),
        SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Divider(thickness: 0.75, color: upwashColors.textColor,),
        ),


      ],),
    );
  }
}

