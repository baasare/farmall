import 'package:farmall/routes/routes.dart';
import 'package:farmall/utils/app_config.dart';
import 'package:farmall/utils/colors.dart';
import 'package:farmall/utils/constants.dart';
import 'package:farmall/utils/validator.dart';
import 'package:farmall/widgets/custom_button.dart';
import 'package:farmall/widgets/custom_password_field.dart';
import 'package:farmall/widgets/custom_text_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  bool _saving = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    final title = Padding(
      padding: EdgeInsets.only(
        top: SizeConfig.blockSizeVertical! * 5,
      ),
      child: Center(
        child: Column(
          children: [
            Image.asset(
              AvailableImages.appLogo["assetPath"] as String,
              height: SizeConfig.blockSizeVertical! * 10,
              width: SizeConfig.blockSizeHorizontal! * 30,
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical! * 5,
            ),
            Text(
              "Welcome Back",
              style: TextStyle(
                color: blackPrimary,
                fontFamily: AvailableFonts.primaryFont,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.6,
                wordSpacing: 1.0,
                fontSize: 30.0,
              ),
            ),
          ],
        ),
      ),
    );

    final emailField = CustomTextField(
      currentFocus: emailFocusNode,
      nextFocus: passwordFocusNode,
      fieldHintText: "Email",
      fieldValidator: Validator.emailValidator,
      fieldController: emailController,
      fieldTextInputAction: TextInputAction.next,
    );

    final passwordField = CustomPasswordField(
      fieldIcon: Icons.lock_outline,
      currentFocus: passwordFocusNode,
      fieldHintText: "Password",
      fieldValidator: Validator.textValidator,
      fieldController: passwordController,
      fieldTextInputAction: TextInputAction.done,
    );

    final loginForm = Form(
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
                'Email',
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
            emailField,
            SizedBox(
              height: 20.0,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Password',
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
            passwordField,
          ],
        ),
      ),
    );

    final loginBtn = Padding(
      padding: EdgeInsets.only(
        top: SizeConfig.blockSizeVertical! * 3,
      ),
      child: CustomButton(
        buttonColor: greenDarker,
        buttonText: "Login",
        textColor: primaryWhite,
        elevation: 5,
        buttonHeight: SizeConfig.blockSizeVertical! * 7,
        buttonWidth: SizeConfig.blockSizeHorizontal! * 70,
        buttonOnPressed: () {
          if (_formKey.currentState!.validate()) {
            SystemChannels.textInput.invokeMethod('TextInput.hide');
            setState(() {
              _saving = true;
            });
            _emailLogin();
          }
        },
      ),
    );

    final forgotPassword = Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () =>
            Navigator.pushNamed(context, passwordResetRequestViewRoute),
        child: Text(
          'Forgot password?',
          style: TextStyle(
            letterSpacing: 0.5,
            fontWeight: FontWeight.w600,
            fontFamily: AvailableFonts.primaryFont,
            fontSize: 13.0,
            color: greenDarker,
          ),
        ),
      ),
    );

    final signUp = Container(
      padding: EdgeInsets.only(
        bottom: SizeConfig.blockSizeVertical! * 5,
        left: SizeConfig.safeBlockHorizontal! * 10,
        right: SizeConfig.safeBlockHorizontal! * 10,
      ),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: RichText(
          text: TextSpan(
              text: 'Don\'t have an account?',
              style: TextStyle(
                letterSpacing: 0.5,
                fontWeight: FontWeight.w400,
                fontFamily: AvailableFonts.primaryFont,
                fontSize: 14.0,
                color: greyPrimary,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: ' Sign up',
                  style: TextStyle(
                    letterSpacing: 0.5,
                    fontWeight: FontWeight.w500,
                    fontFamily: AvailableFonts.primaryFont,
                    fontSize: 14.0,
                    color: greenDarker,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.pushReplacementNamed(
                          context, registrationViewRoute);
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
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              top: SizeConfig.blockSizeVertical! * 5,
              left: SizeConfig.blockSizeHorizontal! * 5,
              right: SizeConfig.blockSizeHorizontal! * 5,
            ),
            child: SizedBox(
              height: SizeConfig.blockSizeVertical! * 90,
              child: Column(
                children: [
                  Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      title,
                      loginForm,
                      forgotPassword,
                      loginBtn,
                    ],
                  ),
                  Spacer(),
                  signUp
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _emailLogin() async {
    Navigator.pushNamed(context, rootViewRoute);
  }
}
