import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:up_wash/ui/Buttons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


import '../../common_setup/Assets.dart';
import '../../common_setup/Routes.dart';

class LoginScreen extends StatelessWidget {

  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(126, 72, 126, 0),
              child: Image.asset(A.assetsLogo,
              height: 92,
              width: 122,),
            ),

          ],
        )
    );
  }
}