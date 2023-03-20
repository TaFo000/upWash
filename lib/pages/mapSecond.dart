import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:up_wash/pages/order.dart';
import 'package:up_wash/ui/Buttons.dart';


import '../../common_setup/Assets.dart';


class MapSecondScreen extends StatefulWidget {
  const MapSecondScreen({Key? key}) : super(key: key);

  @override
  State<MapSecondScreen> createState() => MapSecondScreenState();
}




class MapSecondScreenState extends State<MapSecondScreen> {

  late double lat;
  late double long;
  BitmapDescriptor? mark;
  bool isLoading = true;

  bool isNotAdded = true;
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
    return Scaffold(
      body: isLoading
        ? Center(child: CircularProgressIndicator()):
        Stack(children: [
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
          isNotAdded ? DraggableScrollableSheet(
            initialChildSize: 0.45,
            maxChildSize: 0.45,
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
                            Container(height: 86,
                                decoration: BoxDecoration(
                                  color: Color(0xffF6F6F6),
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(color: Color(0xffDEDEDE))
                                ),
                            child: Row(children: [
                              SizedBox(width: 8),
                              Image.asset(A.tireShine),
                              SizedBox(width: 15),
                              Padding(
                                padding: const EdgeInsets.only(top: 22),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                  Text(AppLocalizations.of(context).tireShine,
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
                              SizedBox(width: 80),
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
                                      onTap: (){isNotAdded = false;
                                        setState(() {

                                        });},
                                      child: Center(
                                        child: Text(
                                          AppLocalizations.of(context).add,
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
                            SizedBox(height: 14),
                            Container(height: 86,
                              decoration: BoxDecoration(
                                  color: Color(0xffF6F6F6),
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(color: Color(0xffDEDEDE))
                              ),
                              child: Row(children: [
                                SizedBox(width: 8),
                                Image.asset(A.ligthWaxing),
                                SizedBox(width: 15),
                                Padding(
                                  padding: const EdgeInsets.only(top: 22),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(AppLocalizations.of(context).ligthWaxing,
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
                                SizedBox(width: 60),
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
                                      onTap: (){isNotAdded = false;
                                        setState(() {

                                        });},
                                      child: Center(
                                        child: Text(
                                          AppLocalizations.of(context).add,
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
                            SizedBox(height: 14),
                            Container(height: 86,
                              decoration: BoxDecoration(
                                  color: Color(0xffF6F6F6),
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(color: Color(0xffDEDEDE))
                              ),
                              child: Row(children: [
                                SizedBox(width: 8),
                                Image.asset(A.washingDoor),
                                SizedBox(width: 15),
                                Padding(
                                  padding: const EdgeInsets.only(top: 22),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(AppLocalizations.of(context).washingDoor,
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500
                                        ),),
                                      SizedBox(height: 3,),
                                      Text("\$88",
                                        style: TextStyle(
                                            color: Color(0xffFF6600),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700
                                        ),)
                                    ],),
                                ),
                                SizedBox(width: 60),
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
                                      onTap: (){isNotAdded = false;
                                        setState(() {

                                        });},
                                      child: Center(
                                        child: Text(
                                          AppLocalizations.of(context).add,
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
          ) :
          DraggableScrollableSheet(
            initialChildSize: 0.25,
            maxChildSize: 0.25,
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
                            SizedBox(height: 15),
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
                                suffixIcon:
                                ImageIcon(
                                  AssetImage(A.cancelIcon),
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            SizedBox(height: 18),
                            PrimaryButton(
                                title: AppLocalizations.of(context).next,
                                onTap: (){
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => OrderScreen()));
                                })
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],

      ),
    );
  }

}