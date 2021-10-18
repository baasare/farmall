import 'package:farmall/routes/routes.dart';
import 'package:farmall/utils/app_config.dart';
import 'package:farmall/utils/colors.dart';
import 'package:farmall/utils/constants.dart';
import 'package:farmall/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class ForgotPasswordCompleteScreen extends StatefulWidget {
  @override
  _ForgotPasswordCompleteScreenState createState() =>
      _ForgotPasswordCompleteScreenState();
}

class _ForgotPasswordCompleteScreenState
    extends State<ForgotPasswordCompleteScreen> {
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
                top: SizeConfig.blockSizeVertical! * 20,
              ),
              child: Center(
                child: Container(
                  child: Image.asset(
                    AvailableImages.appLogo["assetPath"] as String,
                    fit: BoxFit.cover,
                    height: SizeConfig.blockSizeVertical! * 25,
                  ),
                ),
              ),
            ),
            Column(
              children: [
                Text(
                  "Welcome to Health Direct \nGlobal",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: blackPrimary,
                    fontSize: 25.0,
                    fontFamily: AvailableFonts.primaryFont,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.2,
                  ),
                ),
                SizedBox(
                  height: SizeConfig.blockSizeVertical! * 1.0,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: SizeConfig.blockSizeHorizontal! * 5,
                    right: SizeConfig.blockSizeHorizontal! * 5,
                  ),
                  child: Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing eli",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: greyPrimary,
                      fontSize: 18.0,
                      height: 1.4,
                      fontFamily: AvailableFonts.primaryFont,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.6,
                      wordSpacing: 0.5,
                    ),
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
                    textColor: Colors.black,
                    buttonText: "Get Started",
                    elevation: 0.0,
                    buttonHeight: SizeConfig.blockSizeVertical! * 7,
                    buttonWidth: SizeConfig.blockSizeHorizontal! * 85,
                    buttonOnPressed: () => Navigator.of(context)
                        .pushReplacementNamed(registrationViewRoute),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    bottom: SizeConfig.blockSizeVertical! * 5,
                  ),
                  width: SizeConfig.blockSizeHorizontal! * 85,
                  child: OutlinedButton(
                    onPressed: () => Navigator.of(context).pushNamed(
                      loginViewRoute,
                    ),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(
                        width: 1.5,
                        color: greyPrimary,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(17.0),
                      child: Text(
                        "login",
                        style: TextStyle(
                          letterSpacing: 1.5,
                          fontWeight: FontWeight.w500,
                          fontFamily: AvailableFonts.primaryFont,
                          fontSize: 17.0,
                          color: greyPrimary,
                        ),
                      ),
                    ),
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
