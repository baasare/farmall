import 'dart:async';

import 'package:farmall/routes/routes.dart';
import 'package:farmall/utils/app_config.dart';
import 'package:farmall/utils/colors.dart';
import 'package:farmall/utils/constants.dart';
import 'package:farmall/widgets/custom_button.dart';
import 'package:farmall/widgets/custom_pin_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class VerificationScreen extends StatefulWidget {
  final String? phoneNumber;

  const VerificationScreen({Key? key, this.phoneNumber}) : super(key: key);

  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  String _pinCode = "";

  Timer? _timer;
  int _seconds = 60;
  int _countDown = 10;
  int _countDownCalls = 0;
  bool _countingDown = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _timer!.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    final header = Align(
      alignment: Alignment.center,
      child: Image.asset(
        AvailableImages.appLogo["assetPath"] as String,
        height: SizeConfig.blockSizeVertical! * 7,
      ),
    );

    final title = Column(
      children: [
        SizedBox(
          height: SizeConfig.blockSizeVertical! * 10.0,
        ),
        Text(
          "Let’s verify your account",
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
            "A code has been sent to phone number used for registration",
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
      ],
    );

    final submitBtn = Padding(
      padding: EdgeInsets.only(
        top: SizeConfig.blockSizeVertical! * 20,
      ),
      child: CustomButton(
          buttonColor: greenDarker,
          textColor: Colors.white,
          buttonText: "Verify",
          elevation: 5,
          buttonHeight: SizeConfig.blockSizeVertical! * 7,
          buttonWidth: SizeConfig.blockSizeHorizontal! * 70,
          buttonOnPressed: () {
            if (_pinCode.length == 6)
              _codeVerification();
            else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Color(0x5931D0F4),
                  content: Text(
                    "Code incomplete",
                    style: TextStyle(color: Colors.black),
                  ),
                  duration: Duration(seconds: 10),
                ),
              );
            }
          }),
    );

    final verificationForm = Container(
        constraints: BoxConstraints(maxWidth: 500),
        padding: EdgeInsets.only(
          top: SizeConfig.blockSizeVertical! * 5,
        ),
        child: PinEntryTextField(
          fields: 6,
          isTextObscure: false,
          fieldWidth: SizeConfig.blockSizeHorizontal! * 10,
          onSubmit: getPinCode,
          cursorColor: greenPrimary,
          textColor: greenPrimary,
          boxColor: greenPrimary,
        ));

    final resendCode = Container(
      padding: EdgeInsets.only(
        top: SizeConfig.blockSizeVertical! * 5,
        // left: SizeConfig.safeBlockHorizontal! * 10,
        // right: SizeConfig.safeBlockHorizontal! * 10,
      ),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: RichText(
          text: TextSpan(
              text: 'Didn\'t receive the code?',
              style: TextStyle(
                letterSpacing: 0.5,
                fontWeight: FontWeight.w400,
                fontFamily: AvailableFonts.primaryFont,
                fontSize: 14.0,
                color: greyPrimary,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: ' send again',
                  style: TextStyle(
                    letterSpacing: 0.5,
                    fontWeight: FontWeight.w500,
                    fontFamily: AvailableFonts.primaryFont,
                    fontSize: 14.0,
                    color: greenDarker,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      // Navigator.pushReplacementNamed(
                      //     context, registrationViewRoute);
                    },
                )
              ]),
        ),
      ),
    );

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            top: SizeConfig.blockSizeVertical! * 5,
            left: SizeConfig.blockSizeHorizontal! * 5,
            right: SizeConfig.blockSizeHorizontal! * 5,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                header,
                title,
                verificationForm,
                resendCode,
                submitBtn,
              ],
            ),
          ),
        ),
      ),
    );
  }

  void getPinCode(String value) {
    setState(() => _pinCode = value);
    print(_pinCode);
  }

  void startTimer() {
    setState(() {
      _countingDown = true;
    });
    _timer = new Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) => setState(
        () {
          if (_countDown < 1) {
            timer.cancel();
            setState(() {
              _countingDown = false;
              _countDownCalls++;
              _countDown = _seconds * (_countDownCalls + 2);
            });
          } else {
            _countDown = _countDown - 1;
          }
        },
      ),
    );
  }

  void _codeVerification() async {
    Navigator.pushNamed(context, welcomeViewRoute);
  }
}
