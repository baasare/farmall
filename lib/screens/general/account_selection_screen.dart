import 'package:farmall/routes/routes.dart';
import 'package:farmall/services/local_storage_service.dart';
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
  PageController controller = PageController();
  int currentPage = 0;

  int accountType = 0, buyerType = 0, sellerType = 0;

  List<String> titles = [
    "Choose Account Type",
    "Choose Buyer Account Type",
    "Choose Seller Account Type",
  ];

  void pageChange() {
    if (currentPage == 1) {
      LocalStorageService.saveToDisk(
        SavedPreferencesKeys.currentUserType,
        0,
      );
      if (accountType == 0) {
        Navigator.of(context).pushNamedAndRemoveUntil(
          customersWalkThroughViewRoute,
          (Route<dynamic> route) => false,
        );
      } else {
        Navigator.of(context).pushNamedAndRemoveUntil(
          farmersWalkThroughViewRoute,
          (Route<dynamic> route) => false,
        );
      }
    } else {
      setState(() {
        currentPage++;
      });

      controller.animateToPage(
        currentPage,
        duration: Duration(milliseconds: 550),
        curve: Curves.linearToEaseOut,
      );
    }
  }

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
              Expanded(
                child: PageView(
                  controller: controller,
                  physics: NeverScrollableScrollPhysics(),
                  children: <Widget>[
                    selectorBuilder(
                      SelectorWidget(
                        choice: accountType,
                        title: ["Buyer", "Seller"],
                        image: [
                          AvailableImages.buyer["assetPath"] as String,
                          AvailableImages.seller["assetPath"] as String
                        ],
                        callback: (value) {
                          setState(() {
                            accountType = value;
                          });
                        },
                      ),
                      titles[0],
                    ),
                    accountType == 0
                        ? selectorBuilder(
                            SelectorWidget(
                              choice: buyerType,
                              title: ["Individual", "Business"],
                              image: [
                                AvailableImages.individual["assetPath"]
                                    as String,
                                AvailableImages.business["assetPath"] as String
                              ],
                              callback: (value) {
                                setState(() {
                                  buyerType = value;
                                });
                              },
                            ),
                            titles[1],
                          )
                        : selectorBuilder(
                            SelectorWidget(
                              choice: sellerType,
                              title: ["Individual", "Cooperatives"],
                              image: [
                                AvailableImages.individual["assetPath"]
                                    as String,
                                AvailableImages.cooperative["assetPath"]
                                    as String
                              ],
                              callback: (value) {
                                setState(() {
                                  sellerType = value;
                                });
                              },
                            ),
                            titles[2],
                          ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  bottom: SizeConfig.blockSizeVertical! * 20,
                ),
                child: CustomButton(
                  buttonColor: greenPrimary,
                  textColor: Colors.white,
                  buttonText: "Continue",
                  elevation: 10,
                  buttonHeight: SizeConfig.blockSizeVertical! * 7,
                  buttonWidth: SizeConfig.blockSizeHorizontal! * 55,
                  buttonOnPressed: pageChange,
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
