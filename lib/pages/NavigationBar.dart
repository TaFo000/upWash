import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:up_wash/pages/home.dart';



class NavigationBarScreen extends StatefulWidget {
  const NavigationBarScreen({Key? key}) : super(key: key);

  @override
  State<NavigationBarScreen> createState() => NavigationBarScreenState();
}

class NavigationBarScreenState extends State<NavigationBarScreen> {

  PageController page = PageController();

  int index = 0;
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            PageView(
              physics: NeverScrollableScrollPhysics(),
              controller: page,
              children: [
                HomeScreen(),
                HomeScreen(),
                HomeScreen(),
                HomeScreen(),
                HomeScreen(),

              ],),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 60,
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
                          child: SvgPicture.asset('assets/images/homePage.svg', color: index == 2? Color(0xffFF6600): Colors.grey)),
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