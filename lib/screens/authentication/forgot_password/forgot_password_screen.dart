import 'package:farmall/utils/app_config.dart';
import 'package:farmall/utils/colors.dart';
import 'package:farmall/utils/constants.dart';
import 'package:farmall/utils/validator.dart';
import 'package:farmall/widgets/custom_button.dart';
import 'package:farmall/widgets/custom_password_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ForgotPasswordScreen extends StatefulWidget {
  final String? token;

  const ForgotPasswordScreen({Key? key, this.token}) : super(key: key);

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final passwordOneController = TextEditingController();
  final passwordTwoController = TextEditingController();
  final passwordOneFocusNode = FocusNode();
  final passwordTwoFocusNode = FocusNode();

  @override
  void dispose() {
    passwordOneController.dispose();
    passwordTwoController.dispose();
    passwordOneFocusNode.dispose();
    passwordTwoFocusNode.dispose();
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
        "New Password",
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
      "New Password should be different from old password.",
      textAlign: TextAlign.left,
      style: TextStyle(
        fontFamily: AvailableFonts.primaryFont,
        color: greyPrimary,
        fontWeight: FontWeight.w400,
        fontSize: 17,
        letterSpacing: 0.5,
      ),
    );

    final passwordOneField = CustomPasswordField(
      fieldIcon: Icons.lock_outline,
      currentFocus: passwordOneFocusNode,
      nextFocus: passwordTwoFocusNode,
      fieldHelpText: "Must be at least 8 characters.",
      fieldHintText: "New Password",
      fieldValidator: Validator.textValidator,
      fieldController: passwordOneController,
      fieldTextInputAction: TextInputAction.next,
    );

    final passwordTwoField = CustomPasswordField(
      fieldIcon: Icons.lock_outline,
      currentFocus: passwordTwoFocusNode,
      fieldHintText: "Repeat New Password",
      fieldValidator: Validator.textValidator,
      fieldController: passwordTwoController,
      fieldTextInputAction: TextInputAction.done,
    );

    final passwordResetForm = Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.only(
          top: SizeConfig.blockSizeVertical! * 5,
        ),
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'New Password',
                style: TextStyle(
                  letterSpacing: 0.5,
                  fontWeight: FontWeight.w600,
                  fontFamily: AvailableFonts.primaryFont,
                  fontSize: 17.0,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            passwordOneField,
            SizedBox(
              height: 10.0,
            ),
            SizedBox(
              height: 10.0,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Confirm Password',
                style: TextStyle(
                  letterSpacing: 0.5,
                  fontWeight: FontWeight.w600,
                  fontFamily: AvailableFonts.primaryFont,
                  fontSize: 17.0,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            SizedBox(
              height: 10.0,
            ),
            passwordTwoField,
          ],
        ),
      ),
    );

    final submitBtn = Padding(
      padding: EdgeInsets.only(
        top: SizeConfig.blockSizeVertical! * 5,
      ),
      child: CustomButton(
        buttonColor: greenDarker,
        buttonText: "Set Password",
        elevation: 5,
        buttonHeight: SizeConfig.blockSizeVertical! * 7,
        buttonWidth: SizeConfig.blockSizeHorizontal! * 100,
        buttonOnPressed: () {
          if (_formKey.currentState!.validate()) {
            SystemChannels.textInput.invokeMethod('TextInput.hide');

            if (passwordOneController.text == passwordTwoController.text) {
              _passwordReset();
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Color(0x5931D0F4),
                  content: Text(
                    "Passwords do not match",
                    style: TextStyle(color: Colors.black),
                  ),
                  duration: Duration(seconds: 10),
                ),
              );
            }
          }
        },
      ),
    );

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: appBar,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              top: SizeConfig.blockSizeVertical! * 5,
              left: SizeConfig.blockSizeHorizontal! * 5,
              right: SizeConfig.blockSizeHorizontal! * 5,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[title, passwordResetForm, submitBtn],
            ),
          ),
        ),
      ),
    );
  }

  void _passwordReset() async {}
}
