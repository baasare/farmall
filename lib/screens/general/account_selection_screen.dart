import 'package:farmall/routes/routes.dart';
import 'package:farmall/utils/app_config.dart';
import 'package:farmall/utils/colors.dart';
import 'package:farmall/utils/constants.dart';
import 'package:farmall/widgets/custom_button.dart';
import 'package:farmall/widgets/selector_widget.dart';
import 'package:flutter/material.dart';

class AccountSelectionScreen extends StatefulWidget {
  @override
  _AccountSelectionScreenState createState() => _AccountSelectionScreenState();
}

class _AccountSelectionScreenState extends State<AccountSelectionScreen> {
  int accountType = 0;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: SizeConfig.blockSizeVertical! * 5,
                ),
                child: Image.asset(
                  AvailableImages.appLogo["assetPath"] as String,
                  height: SizeConfig.blockSizeVertical! * 10,
                  width: SizeConfig.blockSizeHorizontal! * 30,
                ),
              ),
              selectorBuilder(
                SelectorWidget(
                  choice: accountType,
                  title: ["Individual", "Cooperatives"],
                  image: [
                    AvailableImages.individual["assetPath"] as String,
                    AvailableImages.cooperative["assetPath"] as String
                  ],
                  callback: (value) {
                    setState(() {
                      accountType = value;
                    });
                  },
                ),
                "Choose Account Type",
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: SizeConfig.blockSizeVertical! * 10,
                  bottom: SizeConfig.blockSizeVertical! * 20,
                ),
                child: CustomButton(
                  buttonColor: greenDarker,
                  textColor: Colors.white,
                  buttonText: "Continue",
                  elevation: 10,
                  buttonHeight: SizeConfig.blockSizeVertical! * 7,
                  buttonWidth: SizeConfig.blockSizeHorizontal! * 55,
                  buttonOnPressed: () => Navigator.of(context)
                      .pushReplacementNamed(farmersWalkThroughViewRoute),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  selectorBuilder(Widget selector, String title) {
    return Container(
      padding: EdgeInsets.only(
        top: SizeConfig.blockSizeVertical! * 5,
        left: SizeConfig.blockSizeHorizontal! * 5,
        right: SizeConfig.blockSizeHorizontal! * 5,
        bottom: SizeConfig.blockSizeVertical! * 5,
      ),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              letterSpacing: 0.5,
              fontWeight: FontWeight.w600,
              fontFamily: AvailableFonts.primaryFont,
              fontSize: 30.0,
              color: Colors.black,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: SizeConfig.blockSizeVertical! * 5,
            ),
            child: selector,
          ),
        ],
      ),
    );
  }
}
