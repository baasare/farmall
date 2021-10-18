import 'dart:async';

import 'package:farmall/utils/app_config.dart';
import 'package:farmall/utils/colors.dart';
import 'package:farmall/utils/constants.dart';
import 'package:farmall/widgets/custom_button.dart';
import 'package:farmall/widgets/custom_pin_field.dart';
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

    final appBar = AppBar(
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
        tooltip: 'Menu Icon',
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      elevation: 0,
      centerTitle: true,
      backgroundColor: Colors.white,
      title: Text(
        "Verify Phone",
        textAlign: TextAlign.left,
        style: TextStyle(
          fontFamily: AvailableFonts.primaryFont,
          color: blackPrimary,
          fontWeight: FontWeight.w600,
          fontSize: 20,
        ),
      ),
    );

    final title = Text(
      "Please enter the 4 digits code that was sent to  your phone number.",
      textAlign: TextAlign.left,
      style: TextStyle(
        fontFamily: AvailableFonts.primaryFont,
        color: greyPrimary,
        fontWeight: FontWeight.w400,
        fontSize: 17,
        letterSpacing: 0.5,
      ),
    );

    final submitBtn = Padding(
      padding: EdgeInsets.only(
        top: SizeConfig.blockSizeVertical! * 3,
      ),
      child: CustomButton(
          buttonColor: greenPrimary,
          buttonText: "Confirm",
          elevation: 5,
          buttonHeight: SizeConfig.blockSizeVertical! * 7,
          buttonWidth: SizeConfig.blockSizeHorizontal! * 100,
          buttonOnPressed: () {
            if (_pinCode.length == 4)
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
          fields: 4,
          isTextObscure: true,
          fieldWidth: SizeConfig.blockSizeHorizontal! * 15,
          onSubmit: getPinCode,
          cursorColor: greyPrimary,
          textColor: greyPrimary,
          boxColor: Colors.lightBlueAccent,
        ));

    final resendCode = Container(
      padding: EdgeInsets.only(
        top: SizeConfig.blockSizeVertical! * 5,
        left: SizeConfig.safeBlockHorizontal! * 10,
        right: SizeConfig.safeBlockHorizontal! * 10,
      ),
      child: Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            children: [
              Text(
                'I Didn\'t receive any code',
                style: TextStyle(
                  letterSpacing: 0.5,
                  fontWeight: FontWeight.w400,
                  fontFamily: AvailableFonts.primaryFont,
                  fontSize: 15.0,
                  color: greyPrimary,
                ),
              ),
              Text(
                'Resend',
                style: TextStyle(
                  letterSpacing: 0.5,
                  fontWeight: FontWeight.w500,
                  fontFamily: AvailableFonts.primaryFont,
                  fontSize: 15.0,
                  color: greenPrimary,
                ),
              )
            ],
          )),
    );

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: appBar,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            top: SizeConfig.blockSizeVertical! * 5,
            left: SizeConfig.blockSizeHorizontal! * 5,
            right: SizeConfig.blockSizeHorizontal! * 5,
          ),
          child: Column(
            children: <Widget>[
              title,
              verificationForm,
              submitBtn,
              resendCode,
            ],
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

  void _codeVerification() async {}
}
