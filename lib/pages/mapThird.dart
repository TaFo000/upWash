import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:up_wash/ui/Buttons.dart';


import '../../common_setup/Assets.dart';


class MapThirdScreen extends StatefulWidget {
   MapThirdScreen({Key? key}) : super(key: key);



  @override
  State<MapThirdScreen> createState() => MapThirdScreenState();
}




class MapThirdScreenState extends State<MapThirdScreen> {

  bool isLocationNotAdded = true;

  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();

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
    print(position.latitude);
    print(position.longitude);
  }



  CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: _kGooglePlex,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
           SafeArea(
             child: Padding(
               padding: const EdgeInsets.fromLTRB(28, 5, 0, 0),
               child: Row(
                 children: [
                   Icon(
                     Icons.menu,
                     color: Colors.black,
                   ),
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
                                  suffixIcon: ImageIcon(AssetImage(A.cancelIcon),
                                  color: Colors.black,)
                                ),
                              ),
                              SizedBox(height: 16),
                              SizedBox(
                                child: Card(
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
                                         color: Color(0xffFF6600)),
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
                                         color: Color(0xffFF6600)),
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
                                         color: Color(0xffFF6600)),
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
                                         color: Color(0xffFF6600)),
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
                                             fontWeight: FontWeight.w500
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
                                             fontWeight: FontWeight.w500
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
                                             fontWeight: FontWeight.w500
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