import 'package:farmall/utils/app_config.dart';
import 'package:farmall/utils/colors.dart';
import 'package:farmall/utils/constants.dart';
import 'package:farmall/widgets/custom_button.dart';
import 'package:farmall/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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

  tapped(int step) {
    setState(() => _currentStep = step);
  }

  continued() {
    _currentStep < 4 ? setState(() => _currentStep += 1) : null;
  }

  cancel() {
    _currentStep > 0 ? setState(() => _currentStep -= 1) : null;
  }

  @override
  void initState() {
    loadData();
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
      body: accountSetUpComplete
          ? SingleChildScrollView(
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
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "Your Online Shop",
                              style: TextStyle(
                                color: blackPrimary,
                                fontFamily: AvailableFonts.primaryFont,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.6,
                                wordSpacing: 1.0,
                                fontSize: 25.0,
                              ),
                            ),
                            Text(
                              "https://farmweel.com/mantefoods",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: greenDarker,
                                fontSize: 18.0,
                                height: 1.4,
                                fontFamily: AvailableFonts.primaryFont,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.6,
                              ),
                            ),
                            Text(
                              "Your customers can place order through this link",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: greyDarker,
                                fontSize: 15.0,
                                height: 1.4,
                                fontFamily: AvailableFonts.primaryFont,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.6,
                              ),
                            ),
                          ],
                        ),
                        CircleAvatar(
                          radius: SizeConfig.blockSizeVertical! * 3,
                          backgroundColor: greyLighter,
                          child: IconButton(
                            icon: Icon(
                              Icons.share,
                              color: greenDarker,
                            ),
                            tooltip: 'Menu Icon',
                            onPressed: () {},
                          ),
                        ),
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
                          "Dashboard",
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
                          child: Text(
                            "View all",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontFamily: AvailableFonts.primaryFont,
                              color: greyDarker,
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: SizeConfig.blockSizeVertical! * 15,
                        width: SizeConfig.blockSizeHorizontal! * 27,
                        padding: EdgeInsets.all(
                          SizeConfig.blockSizeHorizontal! * 2,
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
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "Total Sales",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: blackPrimary,
                                fontSize: 18.0,
                                height: 1.4,
                                fontFamily: AvailableFonts.primaryFont,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.6,
                              ),
                            ),
                            Text(
                              "\$190",
                              style: TextStyle(
                                color: greenDarker,
                                fontFamily: AvailableFonts.primaryFont,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.6,
                                wordSpacing: 1.0,
                                fontSize: 25.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: SizeConfig.blockSizeVertical! * 15,
                        width: SizeConfig.blockSizeHorizontal! * 27,
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
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "Orders",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: blackPrimary,
                                fontSize: 18.0,
                                height: 1.4,
                                fontFamily: AvailableFonts.primaryFont,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.6,
                              ),
                            ),
                            Text(
                              "9",
                              style: TextStyle(
                                color: greenDarker,
                                fontFamily: AvailableFonts.primaryFont,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.6,
                                wordSpacing: 1.0,
                                fontSize: 25.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: SizeConfig.blockSizeVertical! * 15,
                        width: SizeConfig.blockSizeHorizontal! * 27,
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
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "Visits",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: blackPrimary,
                                fontSize: 18.0,
                                height: 1.4,
                                fontFamily: AvailableFonts.primaryFont,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.6,
                              ),
                            ),
                            Text(
                              "39",
                              style: TextStyle(
                                color: greenDarker,
                                fontFamily: AvailableFonts.primaryFont,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.6,
                                wordSpacing: 1.0,
                                fontSize: 25.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: SizeConfig.blockSizeVertical! * 40,
                    width: SizeConfig.blockSizeHorizontal! * 100,
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
                    child: Image.asset(
                      AvailableImages.graph["assetPath"] as String,
                      height: SizeConfig.blockSizeVertical! * 10,
                      width: SizeConfig.blockSizeHorizontal! * 30,
                    ),
                  ),
                  Container(
                    height: SizeConfig.blockSizeVertical! * 10,
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
                        RichText(
                          text: TextSpan(
                              text: 'You have',
                              style: TextStyle(
                                letterSpacing: 0.5,
                                fontWeight: FontWeight.w600,
                                fontFamily: AvailableFonts.primaryFont,
                                fontSize: 17.0,
                                color: blackPrimary,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: ' 8 ',
                                  style: TextStyle(
                                    letterSpacing: 0.5,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: AvailableFonts.primaryFont,
                                    fontSize: 17.0,
                                    color: greenDarker,
                                  ),
                                ),
                                TextSpan(
                                  text: 'new orders.',
                                  style: TextStyle(
                                    letterSpacing: 0.5,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: AvailableFonts.primaryFont,
                                    fontSize: 17.0,
                                    color: blackPrimary,
                                  ),
                                )
                              ]),
                        ),
                        CustomButton(
                          buttonColor: greenDarker,
                          buttonText: "Process",
                          textColor: primaryWhite,
                          elevation: 5,
                          buttonHeight: SizeConfig.blockSizeVertical! * 7,
                          buttonWidth: SizeConfig.blockSizeHorizontal! * 30,
                          buttonOnPressed: () {},
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: Theme(
                    data: ThemeData(
                      colorScheme: ColorScheme.light(primary: greenDarker),
                    ),
                    child: Stepper(
                      type: stepperType,
                      physics: ScrollPhysics(),
                      currentStep: _currentStep,
                      onStepTapped: (step) => tapped(step),
                      onStepContinue: continued,
                      onStepCancel: cancel,
                      steps: <Step>[
                        Step(
                          title: Text(
                            "Profile",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontFamily: AvailableFonts.primaryFont,
                              color: greenDarker,
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                            ),
                          ),
                          subtitle: Text(
                            "Provide brief information",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontFamily: AvailableFonts.primaryFont,
                              color: greenDarker,
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                            ),
                          ),
                          content: Align(
                            alignment: Alignment.centerLeft,
                            child: CustomButton(
                              buttonColor: greenDarker,
                              textColor: whitePrimary,
                              buttonText: "Add",
                              elevation: 5,
                              buttonHeight: SizeConfig.blockSizeVertical! * 6,
                              buttonWidth: SizeConfig.blockSizeHorizontal! * 35,
                              buttonOnPressed: () {},
                            ),
                          ),
                          isActive: _currentStep >= 0,
                          state: _currentStep >= 0
                              ? StepState.complete
                              : StepState.disabled,
                        ),
                        Step(
                          title: Text(
                            "Add Products Categories",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontFamily: AvailableFonts.primaryFont,
                              color: greenDarker,
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                            ),
                          ),
                          subtitle: Text(
                            "Choose one or more produc category",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontFamily: AvailableFonts.primaryFont,
                              color: greenDarker,
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                            ),
                          ),
                          content: Align(
                            alignment: Alignment.centerLeft,
                            child: CustomButton(
                              buttonColor: greenDarker,
                              textColor: whitePrimary,
                              buttonText: "Add",
                              elevation: 5,
                              buttonHeight: SizeConfig.blockSizeVertical! * 6,
                              buttonWidth: SizeConfig.blockSizeHorizontal! * 35,
                              buttonOnPressed: () {},
                            ),
                          ),
                          isActive: _currentStep >= 0,
                          state: _currentStep >= 1
                              ? StepState.complete
                              : StepState.disabled,
                        ),
                        Step(
                          title: Text(
                            "Add Land Size",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontFamily: AvailableFonts.primaryFont,
                              color: greenDarker,
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                            ),
                          ),
                          subtitle: Text(
                            "Input the Land size of your farm",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontFamily: AvailableFonts.primaryFont,
                              color: greenDarker,
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                            ),
                          ),
                          content: Align(
                            alignment: Alignment.centerLeft,
                            child: CustomButton(
                              buttonColor: greenDarker,
                              textColor: whitePrimary,
                              buttonText: "Add",
                              elevation: 5,
                              buttonHeight: SizeConfig.blockSizeVertical! * 6,
                              buttonWidth: SizeConfig.blockSizeHorizontal! * 35,
                              buttonOnPressed: () {},
                            ),
                          ),
                          isActive: _currentStep >= 0,
                          state: _currentStep >= 2
                              ? StepState.complete
                              : StepState.disabled,
                        ),
                        Step(
                          title: Text(
                            "Add Location",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontFamily: AvailableFonts.primaryFont,
                              color: greenDarker,
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                            ),
                          ),
                          subtitle: Text(
                            "Input the location of your farm",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontFamily: AvailableFonts.primaryFont,
                              color: greenDarker,
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                            ),
                          ),
                          content: Align(
                            alignment: Alignment.centerLeft,
                            child: CustomButton(
                              buttonColor: greenDarker,
                              textColor: whitePrimary,
                              buttonText: "Add",
                              elevation: 5,
                              buttonHeight: SizeConfig.blockSizeVertical! * 6,
                              buttonWidth: SizeConfig.blockSizeHorizontal! * 35,
                              buttonOnPressed: () {},
                            ),
                          ),
                          isActive: _currentStep >= 0,
                          state: _currentStep >= 3
                              ? StepState.complete
                              : StepState.disabled,
                        ),
                        Step(
                          title: Text(
                            "Upload Certificate",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontFamily: AvailableFonts.primaryFont,
                              color: greenDarker,
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                            ),
                          ),
                          subtitle: Text(
                            "Upload your sales lincese",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontFamily: AvailableFonts.primaryFont,
                              color: greenDarker,
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                            ),
                          ),
                          content: Align(
                            alignment: Alignment.centerLeft,
                            child: CustomButton(
                              buttonColor: greenDarker,
                              textColor: whitePrimary,
                              buttonText: "Add",
                              elevation: 5,
                              buttonHeight: SizeConfig.blockSizeVertical! * 6,
                              buttonWidth: SizeConfig.blockSizeHorizontal! * 35,
                              buttonOnPressed: () {},
                            ),
                          ),
                          isActive: _currentStep >= 1,
                          state: _currentStep >= 4
                              ? StepState.complete
                              : StepState.disabled,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomButton(
                    buttonColor: greyPrimary,
                    textColor: whitePrimary,
                    buttonText: "Proceed to Payments",
                    elevation: 5,
                    buttonHeight: SizeConfig.blockSizeVertical! * 7,
                    buttonWidth: SizeConfig.blockSizeHorizontal! * 70,
                    buttonOnPressed: () {},
                  ),
                ),
              ],
            ),
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
