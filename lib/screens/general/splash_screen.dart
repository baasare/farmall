import 'package:farmall/routes/routes.dart';
import 'package:farmall/utils/app_config.dart';
import 'package:farmall/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var _accessToken, _walkThroughSeen;
  bool _isLoggedIn = true, _hasSeenWalkThrough = true;

  bool isVisible = true;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    _accessToken = myPrefs.getString(SavedPreferencesKeys.userTokenKey);
    _walkThroughSeen = myPrefs.getBool(SavedPreferencesKeys.seenWalkThroughKey);

    if (_accessToken == null || _accessToken == "") {
      setState(() {
        _isLoggedIn = false;
      });
    }

    if (_walkThroughSeen == null || _walkThroughSeen == false) {
      setState(() {
        _hasSeenWalkThrough = false;
      });
    }

    Navigator.of(context).pushNamedAndRemoveUntil(
      accountSelectionViewRoute,
      (Route<dynamic> route) => false,
    );

    // Timer(Duration(seconds: 1), () {
    //   Navigator.of(context).pushNamedAndRemoveUntil(
    //       customersWalkThroughViewRoute, (Route<dynamic> route) => false);
    //
    //   if (_isLoggedIn) {
    //     Navigator.of(context).pushNamedAndRemoveUntil(
    //         rootViewRoute, (Route<dynamic> route) => false);
    //   } else {
    //     if (_hasSeenWalkThrough) {
    //       Navigator.of(context).pushNamedAndRemoveUntil(
    //           welcomeViewRoute, (Route<dynamic> route) => false);
    //     } else {
    //       Navigator.of(context).pushNamedAndRemoveUntil(
    //           customersWalkThroughViewRoute, (Route<dynamic> route) => false);
    //     }
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: SizeConfig.blockSizeVertical! * 100,
        width: SizeConfig.blockSizeHorizontal! * 100,
        decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: AssetImage(
              AvailableImages.splashBackground["assetPath"] as String,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Image.asset(
            AvailableImages.appLogo["assetPath"] as String,
            height: SizeConfig.blockSizeVertical! * 7,
          ),
        ),
      ),
    );
  }
}
