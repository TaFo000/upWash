import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:up_wash/pages/Checkout.dart';
import 'package:up_wash/ui/Buttons.dart';

import '../../common_setup/Assets.dart';

class MapFirstScreen extends StatefulWidget {
  const MapFirstScreen({Key? key}) : super(key: key);

  @override
  State<MapFirstScreen> createState() => MapFirstScreenState();
}

class MapFirstScreenState extends State<MapFirstScreen> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  void dropdownCallback(Widget? selectedValue) {
    if (selectedValue is Widget) {
      setState(() {});
    }
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
        DraggableScrollableSheet(
          initialChildSize: 0.5,
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
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      SizedBox(height: 11),
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
                          prefixIcon: Icon(
                            Icons.date_range,
                            color: Colors.black,
                          ),
                          hintText: AppLocalizations.of(context).date,
                        ),
                      ),
                      SizedBox(height: 13),
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
                          prefixIcon: Icon(
                            Icons.access_time_outlined,
                            color: Colors.black,
                          ),
                          hintText: AppLocalizations.of(context).time,
                        ),
                      ),
                      SizedBox(height: 13),
                      Row(
                        children: [
                          SizedBox(
                            child: TextField(
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
                                prefixIcon: Icon(
                                  Icons.access_time_outlined,
                                  color: Colors.black,
                                ),
                                hintText: AppLocalizations.of(context).time,
                              ),
                            ),
                            width: 76,
                          ),
                          SizedBox(width: 11),
                          SizedBox(
                            child: TextField(
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
                                hintText: '123NRO',
                              ),
                            ),
                            width: 259,
                          ),
                        ],
                      ),
                      SizedBox(height: 13),
                      Row(children: [
                        InkWell(
                          child: Material(
                          child: Container(
                            height: 72,
                            width: 100,
                            decoration: BoxDecoration(
                              color: Color(0xffF6F6F6),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                  Image.asset(A.sedan,),
                                SizedBox(height: 11),
                                Text("Sedan",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500
                                ),)
                            ],),

                          )
                        ),),
                        SizedBox(width: 13),
                        InkWell(
                          child: Material(
                              child: Container(
                                height: 72,
                                width: 100,
                                decoration: BoxDecoration(
                                  color: Color(0xffF6F6F6),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(A.suv,),
                                    SizedBox(height: 11),
                                    Text("SUV",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500
                                      ),)
                                  ],),

                              )
                          ),),
                        SizedBox(width: 13),
                        InkWell(
                          child: Material(
                              child: Container(
                                height: 72,
                                width: 100,
                                decoration: BoxDecoration(
                                  color: Color(0xffF6F6F6),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(A.smallCar,),
                                    SizedBox(height: 11),
                                    Text("Small",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500
                                      ),)
                                  ],),

                              )
                          ),),
                      ],),
                      SizedBox(height: 21),
                      PrimaryButton(title: AppLocalizations.of(context).pay, onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => CheckoutScreen()));
                      })
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ],
    ));
  }
}
