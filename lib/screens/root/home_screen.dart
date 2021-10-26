import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:farmall/routes/routes.dart';
import 'package:farmall/utils/app_config.dart';
import 'package:farmall/utils/colors.dart';
import 'package:farmall/utils/constants.dart';
import 'package:farmall/utils/utils.dart';
import 'package:farmall/widgets/custom_button.dart';
import 'package:farmall/widgets/custom_drawer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Completer<GoogleMapController> _controller = Completer();
  GoogleMapController? mapController;

  Marker? currentLocationMarker;

  String currentLocation = "";

  Set<Marker> _markers = {};

  MapType _currentMapType = MapType.normal;

  static const LatLng _center = const LatLng(8.397233, -1.215936);

  static final CameraPosition _initialCameraPosition = CameraPosition(
    target: _center,
    zoom: 7,
  );

  // for my custom icons
  BitmapDescriptor? currentLocationIcon;

  bool accountSetUpComplete = false;
  var _accountSetUpStep;
  int _currentStep = 0;

  StepperType stepperType = StepperType.vertical;

  var sortType = [
    "Today",
    "This week",
    "This month",
    "This year",
  ];

  tapped(int step) {
    setState(() => _currentStep = step);
  }

  continued() {
    _currentStep < 4 ? setState(() => _currentStep += 1) : null;
  }

  cancel() {
    _currentStep > 0 ? setState(() => _currentStep -= 1) : null;
  }

  loadData() async {
    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    _accountSetUpStep =
        myPrefs.getString(SavedPreferencesKeys.accountSetupStepKey);

    if (_accountSetUpStep == AccountSetupStepKeys.certificateSetup) {
      setState(() {
        accountSetUpComplete = true;
      });
    }
  }

  static Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  _getCurrentLocation() async {
    await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    ).then((Position position) async {
      getAddressFormCoordinates(LatLng(position.latitude, position.longitude))
          .then((value) {
        setState(() {
          currentLocation = value;
        });
      });

      _updateLocation(position);
    }).catchError((e) {
      print(e);
    });
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    _controller.complete(controller);

    _getCurrentLocation();
  }

  void _onCameraMove(CameraPosition position) {}

  void _updateLocation(Position position) {
    setState(() {
      currentLocationMarker = Marker(
        markerId: MarkerId("my_current_location"),
        icon: currentLocationIcon!,
        position: LatLng(position.latitude, position.longitude),
      );

      _markers.add(currentLocationMarker!);
    });

    mapController!.moveCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(position.latitude, position.longitude),
          zoom: 14.0,
        ),
      ),
    );
  }

  @override
  void initState() {
    loadData();

    getBytesFromAsset('assets/images/riderMarker.png', 120).then((onValue) {
      currentLocationIcon = BitmapDescriptor.fromBytes(onValue);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    final appBar = AppBar(
      leading: Builder(
        builder: (BuildContext appBarContext) {
          return IconButton(
            icon: Icon(
              Icons.menu,
              color: greyDarker,
            ),
            tooltip: 'Menu Icon',
            onPressed: () {
              // Scaffold.of(context).openDrawer();
              AppDrawer.of(appBarContext)!.toggle();
            },
          );
        },
      ),
      elevation: 0,
      backgroundColor: Colors.white,
      title: Text(
        "Home",
        textAlign: TextAlign.left,
        style: TextStyle(
          fontFamily: AvailableFonts.primaryFont,
          color: greenDarker,
          fontWeight: FontWeight.w600,
          fontSize: 20,
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.search,
            color: greyDarker,
          ),
          tooltip: 'Menu Icon',
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(
            Icons.notifications_none_sharp,
            color: greyDarker,
          ),
          tooltip: 'Menu Icon',
          onPressed: () {},
        )
      ],
    );

    return Scaffold(
        key: widget.key,
        appBar: appBar,
        backgroundColor: whitePrimary,
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                height: SizeConfig.blockSizeVertical! * 17,
                width: SizeConfig.blockSizeVertical! * 100,
                padding: EdgeInsets.all(
                  SizeConfig.blockSizeHorizontal! * 4,
                ),
                margin: EdgeInsets.only(
                  right: SizeConfig.blockSizeHorizontal! * 3,
                  left: SizeConfig.blockSizeHorizontal! * 3,
                  top: SizeConfig.blockSizeVertical! * 2,
                  bottom: SizeConfig.blockSizeVertical! * 2,
                ),
                decoration: BoxDecoration(
                  color: primaryWhite,
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Total Sales",
                      style: TextStyle(
                        color: blackPrimary,
                        fontFamily: AvailableFonts.primaryFont,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.6,
                        wordSpacing: 1.0,
                        fontSize: 20.0,
                      ),
                    ),
                    Text(
                      "\$ 0.00",
                      style: TextStyle(
                        color: blackPrimary,
                        fontFamily: AvailableFonts.primaryFont,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.6,
                        wordSpacing: 1.0,
                        fontSize: 40.0,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: SizeConfig.blockSizeHorizontal! * 100,
                padding: EdgeInsets.all(
                  SizeConfig.blockSizeHorizontal! * 4,
                ),
                margin: EdgeInsets.only(
                  right: SizeConfig.blockSizeHorizontal! * 3,
                  left: SizeConfig.blockSizeHorizontal! * 3,
                  top: SizeConfig.blockSizeVertical! * 2,
                  bottom: SizeConfig.blockSizeVertical! * 2,
                ),
                decoration: BoxDecoration(
                  color: primaryWhite,
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Add Inventory",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            letterSpacing: 0.5,
                            fontWeight: FontWeight.w600,
                            fontFamily: AvailableFonts.primaryFont,
                            fontSize: 20.0,
                            color: blackPrimary,
                          ),
                        ),
                        Text(
                          "You have no products",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: greyDarker,
                            fontSize: 15.0,
                            height: 1.4,
                            fontFamily: AvailableFonts.primaryFont,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.6,
                          ),
                        ),
                      ],
                    ),
                    CustomButton(
                      buttonColor: greenDarker,
                      buttonText: "Add",
                      textColor: primaryWhite,
                      elevation: 10,
                      buttonHeight: SizeConfig.blockSizeVertical! * 5,
                      buttonWidth: SizeConfig.blockSizeHorizontal! * 25,
                      buttonOnPressed: () => Navigator.pushNamed(
                        context,
                        inventoryDetailViewRoute,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: SizeConfig.blockSizeHorizontal! * 100,
                padding: EdgeInsets.all(
                  SizeConfig.blockSizeHorizontal! * 4,
                ),
                margin: EdgeInsets.only(
                  right: SizeConfig.blockSizeHorizontal! * 3,
                  left: SizeConfig.blockSizeHorizontal! * 3,
                  top: SizeConfig.blockSizeVertical! * 2,
                  bottom: SizeConfig.blockSizeVertical! * 2,
                ),
                decoration: BoxDecoration(
                  color: primaryWhite,
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Nearest Storage Facilities",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        letterSpacing: 0.5,
                        fontWeight: FontWeight.w600,
                        fontFamily: AvailableFonts.primaryFont,
                        fontSize: 20.0,
                        color: blackPrimary,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(Icons.location_pin, color: greenDarker),
                        Text(
                          currentLocation,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: greenDarker,
                            fontSize: 15.0,
                            height: 1.4,
                            fontFamily: AvailableFonts.primaryFont,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.6,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: SizeConfig.blockSizeVertical! * 1),
                    SizedBox(
                      height: SizeConfig.blockSizeVertical! * 20,
                      child: GoogleMap(
                        myLocationButtonEnabled: true,
                        zoomGesturesEnabled: true,
                        zoomControlsEnabled: true,
                        tiltGesturesEnabled: true,
                        mapToolbarEnabled: false,
                        compassEnabled: true,
                        padding: EdgeInsets.only(bottom: 120, top: 80),
                        onMapCreated: _onMapCreated,
                        onCameraMove: _onCameraMove,
                        mapType: _currentMapType,
                        markers: _markers,
                        initialCameraPosition: _initialCameraPosition,
                        gestureRecognizers:
                            <Factory<OneSequenceGestureRecognizer>>[
                          Factory<OneSequenceGestureRecognizer>(
                            () => EagerGestureRecognizer(),
                          ),
                        ].toSet(),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: SizeConfig.blockSizeVertical! * 2,
                  left: SizeConfig.blockSizeHorizontal! * 3,
                  right: SizeConfig.blockSizeHorizontal! * 3,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Order Summary",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontFamily: AvailableFonts.primaryFont,
                        color: blackPrimary,
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _show(context);
                      },
                      child: Row(
                        children: [
                          Text(
                            "View all",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontFamily: AvailableFonts.primaryFont,
                              color: blackPrimary,
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                              letterSpacing: 0.5,
                            ),
                          ),
                          Icon(Icons.keyboard_arrow_down_rounded)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, orderDetailViewRoute),
                child: Container(
                  width: SizeConfig.blockSizeHorizontal! * 100,
                  padding: EdgeInsets.only(
                    top: SizeConfig.blockSizeVertical! * 2,
                    bottom: SizeConfig.blockSizeVertical! * 2,
                    right: SizeConfig.blockSizeHorizontal! * 3,
                    left: SizeConfig.blockSizeHorizontal! * 3,
                  ),
                  margin: EdgeInsets.only(
                    right: SizeConfig.blockSizeHorizontal! * 3,
                    left: SizeConfig.blockSizeHorizontal! * 3,
                    top: SizeConfig.blockSizeVertical! * 2,
                    bottom: SizeConfig.blockSizeVertical! * 0.5,
                  ),
                  decoration: BoxDecoration(
                    color: primaryWhite,
                    borderRadius: BorderRadius.all(
                      Radius.circular(3.0),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Red Lentils',
                            style: TextStyle(
                              letterSpacing: 0.5,
                              fontWeight: FontWeight.w600,
                              fontFamily: AvailableFonts.primaryFont,
                              fontSize: 17.0,
                              color: blackPrimary,
                            ),
                          ),
                          Text(
                            '\$400',
                            style: TextStyle(
                              letterSpacing: 0.5,
                              fontWeight: FontWeight.w600,
                              fontFamily: AvailableFonts.primaryFont,
                              fontSize: 16.0,
                              color: blackPrimary,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '23:05  20 July 2020',
                            style: TextStyle(
                              letterSpacing: 0.5,
                              fontWeight: FontWeight.w400,
                              fontFamily: AvailableFonts.primaryFont,
                              fontSize: 13.0,
                              color: greyDarkest,
                            ),
                          ),
                          Text(
                            'Pending',
                            style: TextStyle(
                              letterSpacing: 0.5,
                              fontWeight: FontWeight.w600,
                              fontFamily: AvailableFonts.primaryFont,
                              fontSize: 15.0,
                              color: Colors.red.shade500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, orderDetailViewRoute),
                child: Container(
                  width: SizeConfig.blockSizeHorizontal! * 100,
                  padding: EdgeInsets.only(
                    top: SizeConfig.blockSizeVertical! * 2,
                    bottom: SizeConfig.blockSizeVertical! * 2,
                    right: SizeConfig.blockSizeHorizontal! * 3,
                    left: SizeConfig.blockSizeHorizontal! * 3,
                  ),
                  margin: EdgeInsets.only(
                    right: SizeConfig.blockSizeHorizontal! * 3,
                    left: SizeConfig.blockSizeHorizontal! * 3,
                    bottom: SizeConfig.blockSizeVertical! * 0.5,
                  ),
                  decoration: BoxDecoration(
                    color: primaryWhite,
                    borderRadius: BorderRadius.all(
                      Radius.circular(3.0),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Black Lentils',
                            style: TextStyle(
                              letterSpacing: 0.5,
                              fontWeight: FontWeight.w600,
                              fontFamily: AvailableFonts.primaryFont,
                              fontSize: 17.0,
                              color: blackPrimary,
                            ),
                          ),
                          Text(
                            '\$500',
                            style: TextStyle(
                              letterSpacing: 0.5,
                              fontWeight: FontWeight.w600,
                              fontFamily: AvailableFonts.primaryFont,
                              fontSize: 16.0,
                              color: blackPrimary,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '23:05  20 July 2020',
                            style: TextStyle(
                              letterSpacing: 0.5,
                              fontWeight: FontWeight.w400,
                              fontFamily: AvailableFonts.primaryFont,
                              fontSize: 13.0,
                              color: greyDarkest,
                            ),
                          ),
                          Text(
                            'Pending',
                            style: TextStyle(
                              letterSpacing: 0.5,
                              fontWeight: FontWeight.w600,
                              fontFamily: AvailableFonts.primaryFont,
                              fontSize: 15.0,
                              color: Colors.red.shade500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, orderDetailViewRoute),
                child: Container(
                  width: SizeConfig.blockSizeHorizontal! * 100,
                  padding: EdgeInsets.only(
                    top: SizeConfig.blockSizeVertical! * 2,
                    bottom: SizeConfig.blockSizeVertical! * 2,
                    right: SizeConfig.blockSizeHorizontal! * 3,
                    left: SizeConfig.blockSizeHorizontal! * 3,
                  ),
                  margin: EdgeInsets.only(
                    right: SizeConfig.blockSizeHorizontal! * 3,
                    left: SizeConfig.blockSizeHorizontal! * 3,
                    bottom: SizeConfig.blockSizeVertical! * 0.5,
                  ),
                  decoration: BoxDecoration(
                    color: primaryWhite,
                    borderRadius: BorderRadius.all(
                      Radius.circular(3.0),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'English pea',
                            style: TextStyle(
                              letterSpacing: 0.5,
                              fontWeight: FontWeight.w600,
                              fontFamily: AvailableFonts.primaryFont,
                              fontSize: 17.0,
                              color: blackPrimary,
                            ),
                          ),
                          Text(
                            '\$200',
                            style: TextStyle(
                              letterSpacing: 0.5,
                              fontWeight: FontWeight.w600,
                              fontFamily: AvailableFonts.primaryFont,
                              fontSize: 16.0,
                              color: blackPrimary,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '23:05  20 July 2020',
                            style: TextStyle(
                              letterSpacing: 0.5,
                              fontWeight: FontWeight.w400,
                              fontFamily: AvailableFonts.primaryFont,
                              fontSize: 13.0,
                              color: greyDarkest,
                            ),
                          ),
                          Text(
                            'Fulfilled',
                            style: TextStyle(
                              letterSpacing: 0.5,
                              fontWeight: FontWeight.w600,
                              fontFamily: AvailableFonts.primaryFont,
                              fontSize: 15.0,
                              color: greenDarker,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
        // accountSetUpComplete
        // ?
        // : Column(
        //     children: [
        //       Expanded(
        //         child: Theme(
        //           data: ThemeData(
        //             colorScheme: ColorScheme.light(primary: greenDarker),
        //           ),
        //           child: Stepper(
        //             type: stepperType,
        //             physics: ScrollPhysics(),
        //             currentStep: _currentStep,
        //             onStepTapped: (step) => tapped(step),
        //             onStepContinue: continued,
        //             onStepCancel: cancel,
        //             steps: <Step>[
        //               Step(
        //                 title: Text(
        //                   "Profile",
        //                   textAlign: TextAlign.left,
        //                   style: TextStyle(
        //                     fontFamily: AvailableFonts.primaryFont,
        //                     color: greenDarker,
        //                     fontWeight: FontWeight.w600,
        //                     fontSize: 20,
        //                   ),
        //                 ),
        //                 subtitle: Text(
        //                   "Provide brief information",
        //                   textAlign: TextAlign.left,
        //                   style: TextStyle(
        //                     fontFamily: AvailableFonts.primaryFont,
        //                     color: greenDarker,
        //                     fontWeight: FontWeight.w500,
        //                     fontSize: 15,
        //                   ),
        //                 ),
        //                 content: Align(
        //                   alignment: Alignment.centerLeft,
        //                   child: CustomButton(
        //                     buttonColor: greenDarker,
        //                     textColor: whitePrimary,
        //                     buttonText: "Add",
        //                     elevation: 5,
        //                     buttonHeight: SizeConfig.blockSizeVertical! * 6,
        //                     buttonWidth: SizeConfig.blockSizeHorizontal! * 35,
        //                     buttonOnPressed: () {},
        //                   ),
        //                 ),
        //                 isActive: _currentStep >= 0,
        //                 state: _currentStep >= 0
        //                     ? StepState.complete
        //                     : StepState.disabled,
        //               ),
        //               Step(
        //                 title: Text(
        //                   "Add Products Categories",
        //                   textAlign: TextAlign.left,
        //                   style: TextStyle(
        //                     fontFamily: AvailableFonts.primaryFont,
        //                     color: greenDarker,
        //                     fontWeight: FontWeight.w600,
        //                     fontSize: 20,
        //                   ),
        //                 ),
        //                 subtitle: Text(
        //                   "Choose one or more produc category",
        //                   textAlign: TextAlign.left,
        //                   style: TextStyle(
        //                     fontFamily: AvailableFonts.primaryFont,
        //                     color: greenDarker,
        //                     fontWeight: FontWeight.w500,
        //                     fontSize: 15,
        //                   ),
        //                 ),
        //                 content: Align(
        //                   alignment: Alignment.centerLeft,
        //                   child: CustomButton(
        //                     buttonColor: greenDarker,
        //                     textColor: whitePrimary,
        //                     buttonText: "Add",
        //                     elevation: 5,
        //                     buttonHeight: SizeConfig.blockSizeVertical! * 6,
        //                     buttonWidth: SizeConfig.blockSizeHorizontal! * 35,
        //                     buttonOnPressed: () {},
        //                   ),
        //                 ),
        //                 isActive: _currentStep >= 0,
        //                 state: _currentStep >= 1
        //                     ? StepState.complete
        //                     : StepState.disabled,
        //               ),
        //               Step(
        //                 title: Text(
        //                   "Add Land Size",
        //                   textAlign: TextAlign.left,
        //                   style: TextStyle(
        //                     fontFamily: AvailableFonts.primaryFont,
        //                     color: greenDarker,
        //                     fontWeight: FontWeight.w600,
        //                     fontSize: 20,
        //                   ),
        //                 ),
        //                 subtitle: Text(
        //                   "Input the Land size of your farm",
        //                   textAlign: TextAlign.left,
        //                   style: TextStyle(
        //                     fontFamily: AvailableFonts.primaryFont,
        //                     color: greenDarker,
        //                     fontWeight: FontWeight.w500,
        //                     fontSize: 15,
        //                   ),
        //                 ),
        //                 content: Align(
        //                   alignment: Alignment.centerLeft,
        //                   child: CustomButton(
        //                     buttonColor: greenDarker,
        //                     textColor: whitePrimary,
        //                     buttonText: "Add",
        //                     elevation: 5,
        //                     buttonHeight: SizeConfig.blockSizeVertical! * 6,
        //                     buttonWidth: SizeConfig.blockSizeHorizontal! * 35,
        //                     buttonOnPressed: () {},
        //                   ),
        //                 ),
        //                 isActive: _currentStep >= 0,
        //                 state: _currentStep >= 2
        //                     ? StepState.complete
        //                     : StepState.disabled,
        //               ),
        //               Step(
        //                 title: Text(
        //                   "Add Location",
        //                   textAlign: TextAlign.left,
        //                   style: TextStyle(
        //                     fontFamily: AvailableFonts.primaryFont,
        //                     color: greenDarker,
        //                     fontWeight: FontWeight.w600,
        //                     fontSize: 20,
        //                   ),
        //                 ),
        //                 subtitle: Text(
        //                   "Input the location of your farm",
        //                   textAlign: TextAlign.left,
        //                   style: TextStyle(
        //                     fontFamily: AvailableFonts.primaryFont,
        //                     color: greenDarker,
        //                     fontWeight: FontWeight.w500,
        //                     fontSize: 15,
        //                   ),
        //                 ),
        //                 content: Align(
        //                   alignment: Alignment.centerLeft,
        //                   child: CustomButton(
        //                     buttonColor: greenDarker,
        //                     textColor: whitePrimary,
        //                     buttonText: "Add",
        //                     elevation: 5,
        //                     buttonHeight: SizeConfig.blockSizeVertical! * 6,
        //                     buttonWidth: SizeConfig.blockSizeHorizontal! * 35,
        //                     buttonOnPressed: () {},
        //                   ),
        //                 ),
        //                 isActive: _currentStep >= 0,
        //                 state: _currentStep >= 3
        //                     ? StepState.complete
        //                     : StepState.disabled,
        //               ),
        //               Step(
        //                 title: Text(
        //                   "Upload Certificate",
        //                   textAlign: TextAlign.left,
        //                   style: TextStyle(
        //                     fontFamily: AvailableFonts.primaryFont,
        //                     color: greenDarker,
        //                     fontWeight: FontWeight.w600,
        //                     fontSize: 20,
        //                   ),
        //                 ),
        //                 subtitle: Text(
        //                   "Upload your sales lincese",
        //                   textAlign: TextAlign.left,
        //                   style: TextStyle(
        //                     fontFamily: AvailableFonts.primaryFont,
        //                     color: greenDarker,
        //                     fontWeight: FontWeight.w500,
        //                     fontSize: 15,
        //                   ),
        //                 ),
        //                 content: Align(
        //                   alignment: Alignment.centerLeft,
        //                   child: CustomButton(
        //                     buttonColor: greenDarker,
        //                     textColor: whitePrimary,
        //                     buttonText: "Add",
        //                     elevation: 5,
        //                     buttonHeight: SizeConfig.blockSizeVertical! * 6,
        //                     buttonWidth: SizeConfig.blockSizeHorizontal! * 35,
        //                     buttonOnPressed: () {},
        //                   ),
        //                 ),
        //                 isActive: _currentStep >= 1,
        //                 state: _currentStep >= 4
        //                     ? StepState.complete
        //                     : StepState.disabled,
        //               ),
        //             ],
        //           ),
        //         ),
        //       ),
        //       Padding(
        //         padding: const EdgeInsets.all(8.0),
        //         child: CustomButton(
        //           buttonColor: greyPrimary,
        //           textColor: whitePrimary,
        //           buttonText: "Proceed to Payments",
        //           elevation: 5,
        //           buttonHeight: SizeConfig.blockSizeVertical! * 7,
        //           buttonWidth: SizeConfig.blockSizeHorizontal! * 70,
        //           buttonOnPressed: () {},
        //         ),
        //       ),
        //     ],
        //   ),
        );
  }

  void _show(BuildContext ctx) {
    showModalBottomSheet(
        isScrollControlled: true,
        elevation: 5,
        context: ctx,
        backgroundColor: primaryWhite,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(15.0),
            topLeft: Radius.circular(15.0),
          ),
        ),
        builder: (ctx) => Padding(
              padding: EdgeInsets.only(
                right: SizeConfig.blockSizeHorizontal! * 5,
                left: SizeConfig.blockSizeHorizontal! * 5,
                top: SizeConfig.blockSizeVertical! * 2,
                bottom: SizeConfig.blockSizeVertical! * 2,
              ),
              child: SizedBox(
                height: SizeConfig.blockSizeVertical! * 30,
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: sortType.length + 1,
                  itemBuilder: (context, index) {
                    var bar = Container(
                      margin: EdgeInsets.only(
                        right: SizeConfig.blockSizeHorizontal! * 40,
                        left: SizeConfig.blockSizeHorizontal! * 40,
                      ),
                      width: 10,
                      height: 5,
                      decoration: BoxDecoration(
                        color: Colors.grey[400],
                        borderRadius: BorderRadius.all(
                          Radius.circular(12.0),
                        ),
                      ),
                    );

                    if (index == 0) {
                      return bar;
                    }

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            sortType[index - 1],
                            style: TextStyle(
                              letterSpacing: 0.5,
                              fontWeight: FontWeight.w500,
                              fontFamily: AvailableFonts.primaryFont,
                              fontSize: 17.0,
                              color: greenDarker,
                            ),
                          ),
                        ),
                        Divider(
                          color: Colors.black,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ));
  }
}
