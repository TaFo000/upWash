import 'dart:async';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:up_wash/pages/Checkout.dart';
import 'package:up_wash/ui/Buttons.dart';

import '../../common_setup/Assets.dart';

enum SampleItem { itemOne, itemTwo, itemThree }

class MapFirstScreen extends StatefulWidget {
  const MapFirstScreen({Key? key}) : super(key: key);

  @override
  State<MapFirstScreen> createState() => MapFirstScreenState();
}

class MapFirstScreenState extends State<MapFirstScreen> {


  SampleItem? selectedMenu;

  late double lat;
  late double long;
  BitmapDescriptor? mark;
  bool isLoading = true;

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  void dropdownCallback(Widget? selectedValue) {
    if (selectedValue is Widget) {
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    getPosition();
  }

  Future getPosition() async {
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
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: isLoading
            ? Center(child: CircularProgressIndicator())
            : Stack(
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
                    onCameraMove: (CameraPosition cumposition) {
                      long = cumposition.target.longitude;
                      lat = cumposition.target.latitude;
                      setState(() {});
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
                                hintText:
                                    AppLocalizations.of(context).searchtext,
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
                  SizedBox.expand(
                    child: DraggableScrollableSheet(
                      minChildSize: 0.25,
                      initialChildSize: 0.25,
                      maxChildSize: 0.55,
                      builder: (BuildContext context,
                          ScrollController scrollController) {
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
                            controller: scrollController,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                children: [
                                  SizedBox(height: 11),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Color(0xffDEDFE4),
                                        borderRadius:
                                            BorderRadius.circular(30)),
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
                                      hintText:
                                          AppLocalizations.of(context).date,
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
                                      hintText:
                                          AppLocalizations.of(context).time,
                                    ),
                                  ),
                                  SizedBox(height: 13),
                                  Row(
                                    children: [
                                      PopupMenuButton<SampleItem>(
                                        initialValue: selectedMenu,
                                        // Callback that sets the selected popup menu item.
                                        onSelected: (SampleItem item) {
                                          setState(() {
                                            selectedMenu = item;
                                          });
                                        },
                                        itemBuilder: (BuildContext context) => <PopupMenuEntry<SampleItem>>[
                                          const PopupMenuItem<SampleItem>(
                                            value: SampleItem.itemOne,
                                            child: Image(image: AssetImage(A.indiaIcon), width: 76,),
                                          ),
                                          const PopupMenuItem<SampleItem>(
                                            value: SampleItem.itemTwo,
                                            child:  Image(image: AssetImage(A.indiaIcon)),
                                          ),
                                          const PopupMenuItem<SampleItem>(
                                            value: SampleItem.itemThree,
                                            child:  Image(image: AssetImage(A.indiaIcon)),
                                          ),
                                        ],
                                      ),
                                      SizedBox(width: 11),
                                      SizedBox(
                                        child: TextField(
                                          decoration: InputDecoration(
                                            filled: true,
                                            fillColor: Color(0xffF6F6F6),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              borderSide: BorderSide(
                                                width: 0,
                                                style: BorderStyle.none,
                                              ),
                                            ),
                                            hintText: '123NRO',
                                          ),
                                        ),
                                        width: 245,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 13),
                                  Row(
                                    children: [
                                      InkWell(
                                        child: Material(
                                            child: Container(
                                          height: 72,
                                          width: 100,
                                          decoration: BoxDecoration(
                                            color: Color(0xffF6F6F6),
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Image.asset(
                                                A.sedan,
                                              ),
                                              SizedBox(height: 11),
                                              Text(
                                                "Sedan",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              )
                                            ],
                                          ),
                                        )),
                                      ),
                                      SizedBox(width: 13),
                                      InkWell(
                                        child: Material(
                                            child: Container(
                                          height: 72,
                                          width: 100,
                                          decoration: BoxDecoration(
                                            color: Color(0xffF6F6F6),
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Image.asset(
                                                A.suv,
                                              ),
                                              SizedBox(height: 11),
                                              Text(
                                                "SUV",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              )
                                            ],
                                          ),
                                        )),
                                      ),
                                      SizedBox(width: 13),
                                      InkWell(
                                        child: Material(
                                            child: Container(
                                          height: 72,
                                          width: 100,
                                          decoration: BoxDecoration(
                                            color: Color(0xffF6F6F6),
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Image.asset(
                                                A.smallCar,
                                              ),
                                              SizedBox(height: 11),
                                              Text(
                                                "Small",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              )
                                            ],
                                          ),
                                        )),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 21),
                                  PrimaryButton(
                                      title: AppLocalizations.of(context).pay,
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    CheckoutScreen()));
                                      })
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ));
  }
}

class MenuItem {
  final IconData icon;

  const MenuItem({
    required this.icon,
  });
}

class MenuItems {
  static const List<MenuItem> firstItems = [countryFirst, countrySecond];
  static const List<MenuItem> secondItems = [countryThird];

  static const countryFirst = MenuItem(icon: Icons.flag);
  static const countrySecond = MenuItem(icon: Icons.flag);
  static const countryThird = MenuItem(icon: Icons.flag);

  static Widget buildItem(MenuItem item) {
    return Icon(item.icon, color: Colors.white, size: 22);
  }

  static void onChanged(BuildContext context, MenuItem item) {
    switch (item) {
      case MenuItems.countryFirst:
        //Do something
        break;
      case MenuItems.countrySecond:
        //Do something
        break;
      case MenuItems.countryThird:
        //Do something
        break;
    }
  }
}
