import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:up_wash/ui/Buttons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../common_setup/Assets.dart';
import '../../common_setup/Routes.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffFF6600),
        body: Stack(children: <Widget>[
          Positioned(
            top: 61,
            left: 21,
            right: 0,
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.menu,
                      color: Colors.white,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Image.asset(A.locationLogo),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 11),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppLocalizations.of(context).locationText,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            AppLocalizations.of(context).locationTextUnder,
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.6),
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: CircleAvatar(
                        backgroundImage: AssetImage(A.avatar),
                        radius: 26,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(right: 18),
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xffF6F6F6),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      suffixIcon: Icon(
                        Icons.search,
                        color: Color(0xffFF6600),
                      ),
                      hintText: AppLocalizations.of(context).searchtext,
                    ),
                  ),
                ),
              ],
            ),
          ),
          DraggableScrollableSheet(
            maxChildSize: 0.75,
            initialChildSize: 0.75,
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
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: 1,
                  itemBuilder: (BuildContext context, scrollController) {
                    return SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 21),
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Color(0xffDEDFE4),
                                  borderRadius: BorderRadius.circular(30)),
                              width: 75,
                              height: 3,
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            SizedBox(
                              height: 140,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: [
                                  Container(
                                    child: Stack(
                                      clipBehavior: Clip.none,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              color: Color(0xff5C1F15),
                                              borderRadius:
                                                  BorderRadius.circular(12)),
                                          width: 270,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        16, 14, 0, 0),
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      AppLocalizations.of(
                                                              context)
                                                          .offerTitleFirst,
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                    SizedBox(width: 3),
                                                    Text(
                                                      AppLocalizations.of(
                                                              context)
                                                          .offerTitleSecond,
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              SizedBox(height: 6),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 16),
                                                child: Text(
                                                  AppLocalizations.of(context)
                                                      .offerDescription,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 11,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                              ),
                                              SizedBox(height: 18),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 16),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4),
                                                      color: Colors.white),
                                                  height: 26,
                                                  width: 81,
                                                  child: Material(
                                                    color: Colors.transparent,
                                                    child: InkWell(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4),
                                                      onTap: () {},
                                                      child: Center(
                                                        child: Text(
                                                          AppLocalizations.of(
                                                                  context)
                                                              .offerButton,
                                                          style: TextStyle(
                                                              fontSize: 10,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color: Color(
                                                                  0xff5C1F15)),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              145, 38, 0, 0),
                                          child: Image.asset(A.car),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  Container(
                                    child: Stack(
                                      clipBehavior: Clip.none,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              color: Color(0xff5C1F15),
                                              borderRadius:
                                                  BorderRadius.circular(12)),
                                          width: 270,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        16, 14, 0, 0),
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      AppLocalizations.of(
                                                              context)
                                                          .offerTitleFirst,
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                    SizedBox(width: 3),
                                                    Text(
                                                      AppLocalizations.of(
                                                              context)
                                                          .offerTitleSecond,
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              SizedBox(height: 6),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 16),
                                                child: Text(
                                                  AppLocalizations.of(context)
                                                      .offerDescription,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 11,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                              ),
                                              SizedBox(height: 18),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 16),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4),
                                                      color: Colors.white),
                                                  height: 26,
                                                  width: 81,
                                                  child: Material(
                                                    color: Colors.transparent,
                                                    child: InkWell(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4),
                                                      onTap: () {},
                                                      child: Center(
                                                        child: Text(
                                                          AppLocalizations.of(
                                                                  context)
                                                              .offerButton,
                                                          style: TextStyle(
                                                              fontSize: 10,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color: Color(
                                                                  0xff5C1F15)),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              145, 38, 0, 0),
                                          child: Image.asset(A.car),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  Container(
                                    child: Stack(
                                      clipBehavior: Clip.none,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              color: Color(0xff5C1F15),
                                              borderRadius:
                                                  BorderRadius.circular(12)),
                                          width: 270,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        16, 14, 0, 0),
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      AppLocalizations.of(
                                                              context)
                                                          .offerTitleFirst,
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                    SizedBox(width: 3),
                                                    Text(
                                                      AppLocalizations.of(
                                                              context)
                                                          .offerTitleSecond,
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              SizedBox(height: 6),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 16),
                                                child: Text(
                                                  AppLocalizations.of(context)
                                                      .offerDescription,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 11,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                              ),
                                              SizedBox(height: 18),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 16),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4),
                                                      color: Colors.white),
                                                  height: 26,
                                                  width: 81,
                                                  child: Material(
                                                    color: Colors.transparent,
                                                    child: InkWell(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4),
                                                      onTap: () {},
                                                      child: Center(
                                                        child: Text(
                                                          AppLocalizations.of(
                                                                  context)
                                                              .offerButton,
                                                          style: TextStyle(
                                                              fontSize: 10,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color: Color(
                                                                  0xff5C1F15)),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              145, 38, 0, 0),
                                          child: Image.asset(A.car),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 16),
                            Row(
                              children: [
                                Text(
                                  AppLocalizations.of(context).specialities,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                Spacer(),
                                Padding(
                                  padding: const EdgeInsets.only(right: 22),
                                  child: Text(
                                    AppLocalizations.of(context).seeAll,
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 80,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        height: 57,
                                        width: 150,
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                                offset: Offset(0, 5),
                                                blurRadius: 32,
                                                color: Color(0xffD9D9D9))
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: Colors.white,
                                        ),
                                        child: Material(
                                          color: Colors.transparent,
                                          child: InkWell(
                                            borderRadius:
                                                BorderRadius.circular(16),
                                            onTap: () {},
                                            child: Center(
                                                child: Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          15, 0, 3, 0),
                                                  child:
                                                      Image.asset(A.carLogo1),
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets
                                                          .fromLTRB(7, 9, 0, 0),
                                                      child: Text(
                                                          AppLocalizations.of(
                                                                  context)
                                                              .all,
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color: Colors
                                                                  .black)),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 7),
                                                      child: Text(
                                                          AppLocalizations.of(
                                                                  context)
                                                              .specialities,
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color: Colors
                                                                  .black)),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            )),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 13),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        height: 57,
                                        width: 150,
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                                offset: Offset(0, 5),
                                                blurRadius: 32,
                                                color: Color(0xffD9D9D9))
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: Colors.white,
                                        ),
                                        child: Material(
                                          color: Colors.transparent,
                                          child: InkWell(
                                            borderRadius:
                                                BorderRadius.circular(16),
                                            onTap: () {},
                                            child: Center(
                                                child: Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          15, 0, 3, 0),
                                                  child:
                                                      Image.asset(A.carLogo2),
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets
                                                          .fromLTRB(7, 9, 0, 0),
                                                      child: Text(
                                                          AppLocalizations.of(
                                                                  context)
                                                              .interior,
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color: Colors
                                                                  .black)),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 7),
                                                      child: Text(
                                                          AppLocalizations.of(
                                                                  context)
                                                              .wash,
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color: Colors
                                                                  .black)),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            )),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 13),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        height: 57,
                                        width: 150,
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                                offset: Offset(0, 5),
                                                blurRadius: 32,
                                                color: Color(0xffD9D9D9))
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: Colors.white,
                                        ),
                                        child: Material(
                                          color: Colors.transparent,
                                          child: InkWell(
                                            borderRadius:
                                                BorderRadius.circular(16),
                                            onTap: () {},
                                            child: Center(
                                                child: Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          15, 0, 3, 0),
                                                  child:
                                                      Image.asset(A.carLogo1),
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets
                                                          .fromLTRB(7, 9, 0, 0),
                                                      child: Text(
                                                          AppLocalizations.of(
                                                                  context)
                                                              .all,
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color: Colors
                                                                  .black)),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 7),
                                                      child: Text(
                                                          AppLocalizations.of(
                                                                  context)
                                                              .specialities,
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color: Colors
                                                                  .black)),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            )),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 19),
                            Row(
                              children: [
                                Text(
                                  AppLocalizations.of(context).topService,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                Spacer(),
                                Padding(
                                  padding: const EdgeInsets.only(right: 22),
                                  child: Text(
                                    AppLocalizations.of(context).seeAll,
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 12),
                            SizedBox(
                              height: 194,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: [
                                  Container(
                                    width: 156,
                                      child: Stack(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                                offset: Offset(0, 5),
                                                blurRadius: 32,
                                                color: Color(0xffD9D9D9))
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: Colors.white,
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Image.asset(A.deepCleaning1),
                                            SizedBox(height: 7),
                                            Padding(
                                              padding: const EdgeInsets.only(left: 9),
                                              child: Text(
                                                AppLocalizations.of(context)
                                                    .service,
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w500),
                                              ),
                                            ),
                                            SizedBox(height: 8),
                                            Padding(
                                              padding: const EdgeInsets.only(left: 9),
                                              child: Row(
                                                children: [
                                                  Image.asset(A.clock),
                                                  SizedBox(width: 5),
                                                  Text(
                                                      AppLocalizations.of(context)
                                                          .time)
                                                ],
                                              ),
                                            ),
                                            SizedBox(height: 9),
                                            Padding(
                                              padding: const EdgeInsets.only(left: 9),
                                              child: Text(
                                                AppLocalizations.of(context)
                                                    .price,
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Positioned(
                                        top:83,
                                          left:123,
                                          child: Image.asset(A.favotire))
                                    ],
                                  )
                                  ),
                                  SizedBox(width: 15),
                                  Container(
                                      width: 156,
                                      child: Stack(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                    offset: Offset(0, 5),
                                                    blurRadius: 32,
                                                    color: Color(0xffD9D9D9))
                                              ],
                                              borderRadius:
                                              BorderRadius.circular(5),
                                              color: Colors.white,
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Image.asset(A.deepCleaning2),
                                                SizedBox(height: 7),
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 9),
                                                  child: Text(
                                                    AppLocalizations.of(context)
                                                        .service,
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight: FontWeight.w500),
                                                  ),
                                                ),
                                                SizedBox(height: 8),
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 9),
                                                  child: Row(
                                                    children: [
                                                      Image.asset(A.clock),
                                                      SizedBox(width: 5),
                                                      Text(
                                                          AppLocalizations.of(context)
                                                              .time)
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(height: 9),
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 9),
                                                  child: Text(
                                                    AppLocalizations.of(context)
                                                        .price,
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight: FontWeight.bold),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Positioned(
                                              top:83,
                                              left:123,
                                              child: Image.asset(A.favotire))
                                        ],
                                      )
                                  ),
                                  SizedBox(width: 15),
                                  Container(
                                      width: 156,
                                      child: Stack(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                    offset: Offset(0, 5),
                                                    blurRadius: 32,
                                                    color: Color(0xffD9D9D9))
                                              ],
                                              borderRadius:
                                              BorderRadius.circular(5),
                                              color: Colors.white,
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Image.asset(A.deepCleaning1),
                                                SizedBox(height: 7),
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 9),
                                                  child: Text(
                                                    AppLocalizations.of(context)
                                                        .service,
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight: FontWeight.w500),
                                                  ),
                                                ),
                                                SizedBox(height: 8),
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 9),
                                                  child: Row(
                                                    children: [
                                                      Image.asset(A.clock),
                                                      SizedBox(width: 5),
                                                      Text(
                                                          AppLocalizations.of(context)
                                                              .time)
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(height: 9),
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 9),
                                                  child: Text(
                                                    AppLocalizations.of(context)
                                                        .price,
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight: FontWeight.bold),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Positioned(
                                              top:83,
                                              left:123,
                                              child: Image.asset(A.favotire))
                                        ],
                                      )
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ]
        ),
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
