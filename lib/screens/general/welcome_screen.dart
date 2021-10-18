import 'package:farmall/routes/routes.dart';
import 'package:farmall/utils/app_config.dart';
import 'package:farmall/utils/colors.dart';
import 'package:farmall/utils/constants.dart';
import 'package:farmall/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: SizeConfig.blockSizeVertical! * 5,
              ),
              child: Center(
                child: Image.asset(
                  AvailableImages.appLogo["assetPath"] as String,
                  height: SizeConfig.blockSizeVertical! * 10,
                  width: SizeConfig.blockSizeHorizontal! * 30,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: SizeConfig.blockSizeVertical! * 5,
              ),
              child: Center(
                child: Container(
                  child: Image.asset(
                    AvailableImages.welcome["assetPath"] as String,
                    fit: BoxFit.cover,
                    height: SizeConfig.blockSizeVertical! * 50,
                  ),
                ),
              ),
            ),
            Column(
              children: [
                Text(
                  "Welcome to Farmall",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: blackPrimary,
                    fontSize: 35.0,
                    fontFamily: AvailableFonts.primaryFont,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.2,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    bottom: SizeConfig.blockSizeVertical! * 3,
                  ),
                  child: CustomButton(
                    buttonColor: greenPrimary,
                    textColor: primaryWhite,
                    buttonText: "Go to Home",
                    elevation: 0.0,
                    buttonHeight: SizeConfig.blockSizeVertical! * 7,
                    buttonWidth: SizeConfig.blockSizeHorizontal! * 85,
                    buttonOnPressed: () => Navigator.of(context)
                        .pushReplacementNamed(rootViewRoute),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
