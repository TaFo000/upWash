import 'dart:async';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'package:up_wash/pages/Checkout.dart';
import 'package:up_wash/ui/Buttons.dart';

import '../../common_setup/Assets.dart';
import '../provider.dart';

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
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  var maskFormatterDate = new MaskTextInputFormatter(
      mask: '####-##-##',
      filter: { "#": RegExp(r'[0-9]') },
      type: MaskAutoCompletionType.lazy
  );
  var maskFormatterTime = new MaskTextInputFormatter(
      mask: '##:##',
      filter: { "#": RegExp(r'[0-9]') },
      type: MaskAutoCompletionType.lazy
  );

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
        ImageConfiguration(size: Size(42, 44)), 'assets/images/markerIcon.png');
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _key,
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
                          Builder(builder: (context) => // Ensure Scaffold is in context
                          IconButton(
                              icon: Icon(Icons.menu,
                                color: Colors.black,),
                            onPressed: (){
                              context.read<AppProvider>().myKey.currentState!.openDrawer();
                            },
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
                                      inputFormatters: [maskFormatterDate]
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
                                      inputFormatters: [maskFormatterTime]
                                  ),
                                  SizedBox(height: 13),
                                  Row(
                                    children: [
                                      PopupMenuButton<SampleItem>(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Color(0xffF6F6F6),
                                            borderRadius: BorderRadius.circular(5)
                                          ),
                                          width: 76,
                                          height: 57,
                                          child: Row(children: [
                                            SizedBox(width: 6),
                                            Image.asset(A.indiaIcon),
                                            SizedBox(width: 5),
                                            Icon(Icons.arrow_drop_down)
                                          ],),
                                        ),
                                        initialValue: selectedMenu,
                                        // Callback that sets the selected popup menu item.
                                        onSelected: (SampleItem item) {
                                          setState(() {
                                            selectedMenu = item;
                                          });
                                        },
                                        itemBuilder: (BuildContext context) => <PopupMenuEntry<SampleItem>>[
                                           PopupMenuItem<SampleItem>(
                                            value: SampleItem.itemOne,
                                            child: Container(
                                              width: 56,
                                                child: Image(image: AssetImage(A.indiaIcon))),
                                          ),
                                           PopupMenuItem<SampleItem>(
                                            value: SampleItem.itemTwo,
                                            child:  Container(
                                                width: 56,
                                                child: Image(image: AssetImage(A.indiaIcon))),
                                          ),
                                           PopupMenuItem<SampleItem>(
                                            value: SampleItem.itemThree,
                                            child:  Container(
                                                width: 56,
                                                child: Image(image: AssetImage(A.indiaIcon))),
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
