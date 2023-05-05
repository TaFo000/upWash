import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:up_wash/pages/settings.dart';
import 'package:up_wash/ui/Buttons.dart';


import '../../common_setup/Assets.dart';
import '../upWashColors.dart';


class MapThirdScreen extends StatefulWidget {
   MapThirdScreen({Key? key}) : super(key: key);



  @override
  State<MapThirdScreen> createState() => MapThirdScreenState();
}




class MapThirdScreenState extends State<MapThirdScreen> {

  late double lat;
  late double long;
  BitmapDescriptor? mark;
  bool isLoading = true;

  bool isLocationNotAdded = true;

  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();

  @override
  void initState() {
    super.initState();
    getPosition();
  }

  void getPosition() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    lat = position.latitude;
    long = position.longitude;

    mark = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(), 'assets/images/markerIcon.png');
    isLoading = false;
    setState(() {
    });

  }



  CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    final UpWashColors upwashColors = Theme.of(context).extension<UpWashColors>()!;
    return Scaffold(
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
        body: isLoading
            ? Center(child: CircularProgressIndicator())
            :Stack(
          children: [
            GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: CameraPosition(
                target: LatLng(lat, long),
                zoom: 14.4746,
              ),
              markers: {
                Marker(
                  markerId: MarkerId('1'),
                  position: LatLng(lat, long),
                  icon: mark!,
                ),
              },
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
              onCameraMove: (CameraPosition cumposition){
                long = cumposition.target.longitude;
                lat = cumposition.target.latitude;
                setState(() {

                });
              },
            ),
           SafeArea(
             child: Padding(
               padding: const EdgeInsets.fromLTRB(28, 5, 0, 0),
               child: Row(
                 children: [
                   Builder(builder: (context) => // Ensure Scaffold is in context
                   IconButton(
                       icon: Icon(Icons.menu,
                         color: Colors.black,),
                       onPressed: () => Scaffold.of(context).openDrawer()
                   )),
                   SizedBox(width: 15),
                   SizedBox(
                     width: 295,
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
                         prefixIcon: ImageIcon(
                           AssetImage(A.locationIcon),
                           color: Colors.black,
                         ),
                         hintText: AppLocalizations.of(context).searchtext,
                         suffixIcon: ImageIcon(
                           AssetImage(A.cancelIcon),
                           color: Colors.black,
                         ),
                       ),
                     ),
                   ),
                 ],
               ),
             ),
           ),
           isLocationNotAdded? DraggableScrollableSheet(
              initialChildSize: 0.45,
              maxChildSize: 0.45,
              minChildSize: 0.45,
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
                    color: upwashColors.backgroundColor,
                  ),
                  child: ListView.builder(
                    controller: scrollController,
                    itemCount: 1,
                    itemBuilder: (BuildContext context, scrollController) {
                      return SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: Color(0xffDEDFE4),
                                    borderRadius: BorderRadius.circular(30)),
                                width: 75,
                                height: 3,
                              ),
                              SizedBox(height: 23),
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
                                  hintStyle: TextStyle(color: Colors.black),
                                  suffixIcon: ImageIcon(AssetImage(A.cancelIcon),
                                  color: Colors.black,)
                                ),
                              ),
                              SizedBox(height: 16),
                              SizedBox(
                                child: Card(
                                  color: Colors.white,
                                  child: ListTile(
                                    leading: ImageIcon(AssetImage(A.locationIcon),
                                    color: Colors.black,),
                                    title: Text(AppLocalizations.of(context).upWash,
                                    style: TextStyle(
                                      color: Color(0xffFF6600),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500
                                    ),),
                                    subtitle:
                                    Text(AppLocalizations.of(context).helsinki,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500
                                    ),),
                                    isThreeLine: true,
                                    onTap: (){
                                      isLocationNotAdded = false;
                                      setState(() {

                                      });
                                    },
                                  ),
                                ),
                                height: 75,
                              ),
                              SizedBox(height: 9),
                              SizedBox(
                                child: Card(
                                  color: Colors.white,
                                  child: ListTile(
                                    leading: ImageIcon(AssetImage(A.locationIcon),
                                      color: Colors.black,),
                                    title: Text(AppLocalizations.of(context).upWash,
                                      style: TextStyle(
                                          color: Color(0xffFF6600),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500
                                      ),),
                                    subtitle:
                                    Text(AppLocalizations.of(context).suomi,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500
                                      ),),
                                    isThreeLine: true,
                                  ),
                                ),
                                height: 75,
                              ),
                              SizedBox(height: 9),
                              SizedBox(
                                child: Card(
                                  color: Colors.white,
                                  child: ListTile(
                                    leading: ImageIcon(AssetImage(A.locationIcon),
                                      color: Colors.black,),
                                    title: Text(AppLocalizations.of(context).upWash,
                                      style: TextStyle(
                                          color: Color(0xffFF6600),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500
                                      ),),
                                    subtitle:
                                    Text(AppLocalizations.of(context).suomi,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500
                                      ),),
                                    isThreeLine: true,
                                  ),
                                ),
                                height: 75,
                              ),
                              SizedBox(height: 9),
                              SizedBox(
                                child: Card(
                                  color: Colors.white,
                                  child: ListTile(
                                    leading: ImageIcon(AssetImage(A.locationIcon),
                                      color: Colors.black,),
                                    title: Text(AppLocalizations.of(context).upWash,
                                      style: TextStyle(
                                          color: Color(0xffFF6600),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500
                                      ),),
                                    subtitle:
                                    Text(AppLocalizations.of(context).suomi,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500
                                      ),),
                                    isThreeLine: true,
                                  ),
                                ),
                                height: 75,
                              ),
                              SizedBox(height: 9),
                              SizedBox(
                                child: Card(
                                  color: Colors.white,
                                  child: ListTile(
                                    leading: ImageIcon(AssetImage(A.locationIcon),
                                      color: Colors.black,),
                                    title: Text(AppLocalizations.of(context).upWash,
                                      style: TextStyle(
                                          color: Color(0xffFF6600),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500
                                      ),),
                                    subtitle:
                                    Text(AppLocalizations.of(context).suomi,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500
                                      ),),
                                    isThreeLine: true,
                                  ),
                                ),
                                height: 75,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ) :
           DraggableScrollableSheet(
             initialChildSize: 0.45,
             maxChildSize: 0.5,
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
                   color: upwashColors.backgroundColor,
                 ),
                 child: ListView.builder(
                   controller: scrollController,
                   itemCount: 1,
                   itemBuilder: (BuildContext context, scrollController) {
                     return SingleChildScrollView(
                       child: Padding(
                         padding: const EdgeInsets.symmetric(horizontal: 20),
                         child: Column(
                           children: [
                             Container(
                               decoration: BoxDecoration(
                                   color: Color(0xffDEDFE4),
                                   borderRadius: BorderRadius.circular(30)),
                               width: 75,
                               height: 3,
                             ),
                             SizedBox(height: 29),
                             SizedBox(
                               height: 40,
                               child: ListView(
                                 scrollDirection: Axis.horizontal,
                                 children: [
                                   Container(
                                     width: 76,
                                     height: 38,
                                     decoration: BoxDecoration(
                                         borderRadius: BorderRadius.circular(5),
                                         color: upwashColors.primaryOrange),
                                     child: Material(
                                       color: Colors.transparent,
                                       child: InkWell(
                                         borderRadius: BorderRadius.circular(16),
                                         onTap: (){},
                                         child: Center(
                                           child: Text(
                                             AppLocalizations.of(context).all,
                                             style: TextStyle(
                                                 fontSize: 12,
                                                 fontWeight: FontWeight.w700,
                                                 color: Colors.white),
                                           ),
                                         ),
                                       ),
                                     ),
                                   ),
                                   SizedBox(width: 11),
                                   Container(
                                     width: 76,
                                     height: 38,
                                     decoration: BoxDecoration(
                                         borderRadius: BorderRadius.circular(5),
                                         color: upwashColors.primaryOrange),
                                     child: Material(
                                       color: Colors.transparent,
                                       child: InkWell(
                                         borderRadius: BorderRadius.circular(16),
                                         onTap: (){},
                                         child: Center(
                                           child: Text(
                                             AppLocalizations.of(context).basic,
                                             style: TextStyle(
                                                 fontSize: 12,
                                                 fontWeight: FontWeight.w700,
                                                 color: Colors.white),
                                           ),
                                         ),
                                       ),
                                     ),
                                   ),
                                   SizedBox(width: 11),
                                   Container(
                                     width: 145,
                                     height: 38,
                                     decoration: BoxDecoration(
                                         borderRadius: BorderRadius.circular(5),
                                         color: upwashColors.primaryOrange),
                                     child: Material(
                                       color: Colors.transparent,
                                       child: InkWell(
                                         borderRadius: BorderRadius.circular(16),
                                         onTap: (){},
                                         child: Center(
                                           child: Text(
                                             AppLocalizations.of(context).interiorWashes,
                                             style: TextStyle(
                                                 fontSize: 12,
                                                 fontWeight: FontWeight.w700,
                                                 color: Colors.white),
                                           ),
                                         ),
                                       ),
                                     ),
                                   ),
                                   SizedBox(width: 11),
                                   Container(
                                     width: 76,
                                     height: 38,
                                     decoration: BoxDecoration(
                                         borderRadius: BorderRadius.circular(5),
                                         color: upwashColors.primaryOrange),
                                     child: Material(
                                       color: Colors.transparent,
                                       child: InkWell(
                                         borderRadius: BorderRadius.circular(16),
                                         onTap: (){},
                                         child: Center(
                                           child: Text(
                                             AppLocalizations.of(context).all,
                                             style: TextStyle(
                                                 fontSize: 12,
                                                 fontWeight: FontWeight.w700,
                                                 color: Colors.white),
                                           ),
                                         ),
                                       ),
                                     ),
                                   ),
                                 ],
                               ),
                             ),
                             SizedBox(height: 25),
                             Container(height: 86,
                               decoration: BoxDecoration(
                                   color: Color(0xffF6F6F6),
                                   borderRadius: BorderRadius.circular(5),
                                   border: Border.all(color: Color(0xffDEDEDE))
                               ),
                               child: Row(children: [
                                 SizedBox(width: 8),
                                 Image.asset(A.tireChanges),
                                 SizedBox(width: 15),
                                 Padding(
                                   padding: const EdgeInsets.only(top: 22),
                                   child: Column(
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       Text(AppLocalizations.of(context).tireChanges,
                                         style: TextStyle(
                                             fontSize: 16,
                                             fontWeight: FontWeight.w500,
                                           color: Colors.black
                                         ),),
                                       SizedBox(height: 3,),
                                       Text("\$39",
                                         style: TextStyle(
                                             color: Color(0xffFF6600),
                                             fontSize: 16,
                                             fontWeight: FontWeight.w700
                                         ),)
                                     ],),
                                 ),
                                 SizedBox(width: 62),
                                 Container(
                                   width: 67,
                                   height: 28,
                                   decoration: BoxDecoration(
                                       borderRadius: BorderRadius.circular(5),
                                       color: Color(0xffFF6600)),
                                   child: Material(
                                     color: Colors.transparent,
                                     child: InkWell(
                                       borderRadius: BorderRadius.circular(16),
                                       onTap: (){},
                                       child: Center(
                                         child: Text(
                                           AppLocalizations.of(context).book,
                                           style: TextStyle(
                                               fontSize: 12,
                                               fontWeight: FontWeight.w700,
                                               color: Colors.white),
                                         ),
                                       ),
                                     ),
                                   ),
                                 )
                               ],),),
                             SizedBox(height: 12),
                             Container(height: 86,
                               decoration: BoxDecoration(
                                   color: Color(0xffF6F6F6),
                                   borderRadius: BorderRadius.circular(5),
                                   border: Border.all(color: Color(0xffDEDEDE))
                               ),
                               child: Row(children: [
                                 SizedBox(width: 8),
                                 Image.asset(A.outsidePro),
                                 SizedBox(width: 15),
                                 Padding(
                                   padding: const EdgeInsets.only(top: 22),
                                   child: Column(
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       Text(AppLocalizations.of(context).outsidePro,
                                         style: TextStyle(
                                             fontSize: 16,
                                             fontWeight: FontWeight.w500,
                                           color: Colors.black
                                         ),),
                                       SizedBox(height: 3,),
                                       Text("\$39",
                                         style: TextStyle(
                                             color: Color(0xffFF6600),
                                             fontSize: 16,
                                             fontWeight: FontWeight.w700
                                         ),)
                                     ],),
                                 ),
                                 SizedBox(width: 62),
                                 Container(
                                   width: 67,
                                   height: 28,
                                   decoration: BoxDecoration(
                                       borderRadius: BorderRadius.circular(5),
                                       color: Color(0xffFF6600)),
                                   child: Material(
                                     color: Colors.transparent,
                                     child: InkWell(
                                       borderRadius: BorderRadius.circular(16),
                                       onTap: (){},
                                       child: Center(
                                         child: Text(
                                           AppLocalizations.of(context).book,
                                           style: TextStyle(
                                               fontSize: 12,
                                               fontWeight: FontWeight.w700,
                                               color: Colors.white),
                                         ),
                                       ),
                                     ),
                                   ),
                                 )
                               ],),),
                             SizedBox(height: 12),
                             Container(height: 86,
                               decoration: BoxDecoration(
                                   color: Color(0xffF6F6F6),
                                   borderRadius: BorderRadius.circular(5),
                                   border: Border.all(color: Color(0xffDEDEDE))
                               ),
                               child: Row(children: [
                                 SizedBox(width: 8),
                                 Image.asset(A.outsideProCoating),
                                 SizedBox(width: 15),
                                 Padding(
                                   padding: const EdgeInsets.only(top: 22),
                                   child: Column(
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       Text(AppLocalizations.of(context).outsideProCoating,
                                         style: TextStyle(
                                             fontSize: 16,
                                             fontWeight: FontWeight.w500,
                                           color: Colors.black
                                         ),),
                                       SizedBox(height: 3,),
                                       Text("\$39",
                                         style: TextStyle(
                                             color: Color(0xffFF6600),
                                             fontSize: 16,
                                             fontWeight: FontWeight.w700
                                         ),)
                                     ],),
                                 ),
                                 SizedBox(width: 62),
                                 Container(
                                   width: 67,
                                   height: 28,
                                   decoration: BoxDecoration(
                                       borderRadius: BorderRadius.circular(5),
                                       color: Color(0xffFF6600)),
                                   child: Material(
                                     color: Colors.transparent,
                                     child: InkWell(
                                       borderRadius: BorderRadius.circular(16),
                                       onTap: (){},
                                       child: Center(
                                         child: Text(
                                           AppLocalizations.of(context).book,
                                           style: TextStyle(
                                               fontSize: 12,
                                               fontWeight: FontWeight.w700,
                                               color: Colors.white),
                                         ),
                                       ),
                                     ),
                                   ),
                                 )
                               ],),),



                           ],
                         ),
                       ),
                     );
                   },
                 ),
               );
             },
           )

          ],

        )
    );
  }

}