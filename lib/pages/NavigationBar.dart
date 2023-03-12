import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:up_wash/pages/home.dart';
import 'package:up_wash/pages/mapFirst.dart';
import 'package:up_wash/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../common_setup/Assets.dart';



class NavigationBarScreen extends StatefulWidget {
  const NavigationBarScreen({Key? key}) : super(key: key);

  @override
  State<NavigationBarScreen> createState() => NavigationBarScreenState();
}

class NavigationBarScreenState extends State<NavigationBarScreen> {

  PageController page = PageController();
  GlobalKey<ScaffoldState> _key = GlobalKey();

  int index = 0;
  bool isTapped = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //print(context.read<AppProvider>()._context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context.watch<AppProvider>().myKey,
        drawer: Container(
          width: 250,
          child: Drawer(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white
              ),
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  SizedBox(
                    height: 250,
                    child: DrawerHeader(
                      decoration: BoxDecoration(color: Colors.white),
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
        body: Stack(
          children: [
            PageView(
              physics: NeverScrollableScrollPhysics(),
              controller: page,
              children: [
                HomeScreen(),
                HomeScreen(),
                MapFirstScreen(),
                HomeScreen(),
                HomeScreen(),

              ],),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                          onTap: (){
                            index = 0;
                            page.animateToPage(index, duration: Duration(milliseconds: 500), curve: Curves.ease);
                            setState(() {

                            });
                          },
                          child: SvgPicture.asset('assets/images/page1.svg', color: index == 0? Color(0xffFF6600): Colors.grey)),
                      GestureDetector(
                          onTap: (){
                            index = 1;
                            page.animateToPage(index, duration: Duration(seconds: 1), curve: Curves.ease);
                            setState(() {

                            });
                          },
                          child: SvgPicture.asset('assets/images/page2.svg', color: index == 1? Color(0xffFF6600): Colors.grey)),
                      GestureDetector(
                          onTap: (){
                            index = 2;
                            page.animateToPage(index, duration: Duration(seconds: 1), curve: Curves.ease);
                            setState(() {

                            });
                          },
                          child: SvgPicture.asset('assets/images/home.svg', color: index == 2? Color(0xffFF6600): Colors.grey)),
                      GestureDetector(
                          onTap: (){
                            index = 3;
                            page.animateToPage(index, duration: Duration(seconds: 1), curve: Curves.ease);
                            setState(() {

                            });
                          },
                          child: SvgPicture.asset('assets/images/page4.svg', color: index == 3? Color(0xffFF6600): Colors.grey)),
                      GestureDetector(
                          onTap: (){
                            index = 4;
                            page.animateToPage(index, duration: Duration(seconds: 1), curve: Curves.ease);
                            setState(() {

                            });
                          },
                          child: SvgPicture.asset('assets/images/page5.svg', color: index == 4? Color(0xffFF6600): Colors.grey)),

                    ],
                  ),
                ))
          ],
        )
    );
  }
}