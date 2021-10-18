import 'package:farmall/routes/routes.dart';
import 'package:farmall/services/local_storage_service.dart';
import 'package:farmall/utils/app_config.dart';
import 'package:farmall/utils/colors.dart';
import 'package:farmall/utils/constants.dart';
import 'package:farmall/widgets/custom_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class FarmerWalkThroughScreen extends StatefulWidget {
  @override
  _FarmerWalkThroughScreenState createState() =>
      _FarmerWalkThroughScreenState();
}

class _FarmerWalkThroughScreenState extends State<FarmerWalkThroughScreen> {
  PageController controller = PageController();
  int currentPage = 0;

  List<String> titles = [
    "Get your own online shop",
    "Manage your orders",
    "Receive Payments"
  ];
  List<String> details = [
    "Create and set up your own shopping website within 3 Minutes.",
    "Manage your own orders coming to your website.",
    "Start accepting mobile money, popular payment apps, bank and card payments .",
  ];

  @override
  initState() {
    super.initState();
    controller = PageController(
      initialPage: currentPage,
      keepPage: false,
      viewportFraction: 1.0,
    );
  }

  @override
  dispose() {
    controller.dispose();
    super.dispose();
  }

  void pageChange() {
    if (currentPage == 2) {
      LocalStorageService.saveToDisk(
        SavedPreferencesKeys.seenWalkThroughKey,
        true,
      );
      Navigator.of(context).pushNamedAndRemoveUntil(
        registrationViewRoute,
        (Route<dynamic> route) => false,
      );
    } else {
      controller.animateToPage(
        currentPage + 1,
        duration: Duration(milliseconds: 250),
        curve: Curves.linearToEaseOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: SizeConfig.blockSizeVertical! * 5,
              ),
              child: Align(
                alignment: Alignment.center,
                child: Image.asset(
                  AvailableImages.appLogo["assetPath"] as String,
                  height: SizeConfig.blockSizeVertical! * 7,
                ),
              ),
            ),
            Expanded(
              child: PageView(
                controller: controller,
                onPageChanged: (index) => setState(() => currentPage = index),
                children: <Widget>[
                  _pageBuilder(
                    AvailableImages.walkThroughImg_1["assetPath"] as String,
                    titles[0],
                    details[0],
                  ),
                  _pageBuilder(
                    AvailableImages.walkThroughImg_2["assetPath"] as String,
                    titles[1],
                    details[1],
                  ),
                  _pageBuilder(
                    AvailableImages.walkThroughImg_3["assetPath"] as String,
                    titles[2],
                    details[2],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: SizeConfig.blockSizeHorizontal! * 4,
                right: SizeConfig.blockSizeHorizontal! * 4,
                bottom: SizeConfig.blockSizeVertical! * 2,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SmoothPageIndicator(
                    controller: controller,
                    count: 3,
                    effect: WormEffect(
                      activeDotColor: greenPrimary,
                      dotColor: greyPrimary,
                      dotWidth: 8.0,
                      dotHeight: 8.0,
                      radius: 5,
                      spacing: 6,
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical! * 2.5,
                  ),
                  CustomButton(
                    buttonColor: greenPrimary,
                    textColor: Colors.white,
                    buttonText: "Get Started",
                    elevation: 10,
                    buttonHeight: SizeConfig.blockSizeVertical! * 7,
                    buttonWidth: SizeConfig.blockSizeHorizontal! * 60,
                    buttonOnPressed: () =>
                        Navigator.pushNamed(context, registrationViewRoute),
                  ),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical! * 1.5,
                  ),
                  CustomButton(
                    buttonColor: blackPrimary,
                    textColor: Colors.white,
                    buttonText: "Login",
                    elevation: 10,
                    buttonHeight: SizeConfig.blockSizeVertical! * 7,
                    buttonWidth: SizeConfig.blockSizeHorizontal! * 60,
                    buttonOnPressed: () =>
                        Navigator.pushNamed(context, loginViewRoute),
                  ),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical! * 1.5,
                  ),
                  SizedBox(
                    width: SizeConfig.blockSizeHorizontal! * 70,
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          text: 'By Clicking Continue, you agree to the',
                          style: TextStyle(
                            color: greyDarker,
                            fontSize: 14.0,
                            height: 1.4,
                            fontFamily: AvailableFonts.primaryFont,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.6,
                          ),
                          children: [
                            TextSpan(
                              text: ' User Agreement',
                              style: TextStyle(
                                color: greenPrimary,
                                fontSize: 14.0,
                                height: 1.4,
                                fontFamily: AvailableFonts.primaryFont,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 0.6,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => print('User Agreement'),
                            ),
                            TextSpan(
                              text: ' and ',
                              style: TextStyle(
                                color: greyPrimary,
                                fontSize: 14.0,
                                height: 1.4,
                                fontFamily: AvailableFonts.primaryFont,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 0.6,
                              ),
                            ),
                            TextSpan(
                              text: 'Privacy Policy.',
                              style: TextStyle(
                                color: greenPrimary,
                                fontSize: 14.0,
                                height: 1.4,
                                fontFamily: AvailableFonts.primaryFont,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 0.6,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => print('Privacy Policy'),
                            ),
                          ]),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _pageBuilder(String imagePath, String title, String content) {
    return Container(
      padding: EdgeInsets.only(
        top: SizeConfig.blockSizeVertical! * 5,
        left: SizeConfig.blockSizeHorizontal! * 5,
        right: SizeConfig.blockSizeHorizontal! * 5,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              color: blackPrimary,
              fontFamily: AvailableFonts.primaryFont,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.6,
              wordSpacing: 1.0,
              fontSize: 30.0,
            ),
          ),
          SizedBox(
            height: SizeConfig.blockSizeVertical! * 2.0,
          ),
          SizedBox(
            width: SizeConfig.blockSizeHorizontal! * 60,
            child: Text(
              content,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: blackPrimary,
                fontSize: 17.0,
                height: 1.4,
                fontFamily: AvailableFonts.primaryFont,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.6,
              ),
            ),
          ),
          Image.asset(
            imagePath,
            height: SizeConfig.blockSizeVertical! * 35,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
