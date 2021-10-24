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

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  bool _saving = false;

  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final passwordOneController = TextEditingController();
  final passwordTwoController = TextEditingController();

  final emailFocusNode = FocusNode();
  final usernameFocusNode = FocusNode();
  final firstNameFocusNode = FocusNode();
  final lastNameFocusNode = FocusNode();
  final passwordOneFocusNode = FocusNode();
  final passwordTwoFocusNode = FocusNode();

  @override
  void dispose() {
    emailController.dispose();
    usernameController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    passwordOneController.dispose();
    passwordTwoController.dispose();

    emailFocusNode.dispose();
    usernameFocusNode.dispose();
    firstNameFocusNode.dispose();
    lastNameFocusNode.dispose();
    passwordOneFocusNode.dispose();
    passwordTwoFocusNode.dispose();
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
        child: Image.asset(
          AvailableImages.appLogo["assetPath"] as String,
          height: SizeConfig.blockSizeVertical! * 10,
          width: SizeConfig.blockSizeHorizontal! * 30,
        ),
      ),
    );

    final firstNameField = CustomTextField(
      currentFocus: firstNameFocusNode,
      nextFocus: lastNameFocusNode,
      fieldHintText: "Firstname",
      fieldValidator: Validator.textValidator,
      fieldController: firstNameController,
      fieldTextInputAction: TextInputAction.next,
    );

    final lastNameField = CustomTextField(
      currentFocus: lastNameFocusNode,
      nextFocus: emailFocusNode,
      fieldHintText: "lastname",
      fieldValidator: Validator.textValidator,
      fieldController: lastNameController,
      fieldTextInputAction: TextInputAction.next,
    );

    final emailField = CustomTextField(
      currentFocus: emailFocusNode,
      nextFocus: usernameFocusNode,
      fieldHintText: "Email",
      fieldValidator: Validator.emailValidator,
      fieldController: emailController,
      fieldTextInputAction: TextInputAction.next,
    );

    final usernameField = CustomTextField(
      currentFocus: usernameFocusNode,
      nextFocus: passwordOneFocusNode,
      fieldHintText: "Username",
      fieldValidator: Validator.textValidator,
      fieldController: usernameController,
      fieldTextInputAction: TextInputAction.next,
    );

    final passwordOneField = CustomPasswordField(
      fieldIcon: Icons.lock_outline,
      currentFocus: passwordOneFocusNode,
      nextFocus: passwordTwoFocusNode,
      fieldHintText: "Password",
      fieldValidator: Validator.passwordValidator,
      fieldController: passwordOneController,
      fieldTextInputAction: TextInputAction.next,
    );

    final passwordTwoField = CustomPasswordField(
      fieldIcon: Icons.lock_outline,
      currentFocus: passwordTwoFocusNode,
      fieldHintText: "Confirm Password",
      fieldValidator: Validator.passwordValidator,
      fieldController: passwordTwoController,
      fieldTextInputAction: TextInputAction.done,
    );

    final registrationForm = Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.only(
          top: SizeConfig.blockSizeVertical! * 5,
        ),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: SizeConfig.blockSizeHorizontal! * 40,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'First Name',
                          style: TextStyle(
                            letterSpacing: 0.5,
                            fontWeight: FontWeight.w600,
                            fontFamily: AvailableFonts.primaryFont,
                            fontSize: 17.0,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      firstNameField,
                    ],
                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
                SizedBox(
                  width: SizeConfig.blockSizeHorizontal! * 40,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Last Name',
                          style: TextStyle(
                            letterSpacing: 0.5,
                            fontWeight: FontWeight.w600,
                            fontFamily: AvailableFonts.primaryFont,
                            fontSize: 17.0,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      lastNameField,
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15.0,
            ),
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
            emailField,
            SizedBox(
              height: 15.0,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Username',
                style: TextStyle(
                  letterSpacing: 0.5,
                  fontWeight: FontWeight.w600,
                  fontFamily: AvailableFonts.primaryFont,
                  fontSize: 17.0,
                  color: Colors.black,
                ),
              ),
            ),
            usernameField,
            SizedBox(
              height: 15.0,
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
            passwordOneField,
            SizedBox(
              height: 15,
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
            passwordTwoField,
          ],
        ),
      ),
    );

    final registrationFormBtn = Center(
      child: Padding(
        padding: EdgeInsets.only(
          top: SizeConfig.blockSizeVertical! * 3,
        ),
        child: CustomButton(
            buttonColor: greenDarker,
            buttonText: "Create Account",
            textColor: primaryWhite,
            elevation: 5,
            buttonHeight: SizeConfig.blockSizeVertical! * 7,
            buttonWidth: SizeConfig.blockSizeHorizontal! * 70,
            buttonOnPressed: () {
              Navigator.pushNamed(
                context,
                verificationViewRoute,
                arguments: {"phone_number": "+233506461741"},
              );

              // if (_formKey.currentState!.validate()) {
              //   SystemChannels.textInput.invokeMethod('TextInput.hide');
              //   setState(() {
              //     _saving = true;
              //   });
              //
              //   if (passwordOneController.text != passwordTwoController.text) {
              //     ScaffoldMessenger.of(context).showSnackBar(
              //       SnackBar(
              //         backgroundColor: Color(0x5931D0F4),
              //         content: Text(
              //           "Passwords do not match",
              //           style: TextStyle(color: Colors.black),
              //         ),
              //         duration: Duration(seconds: 4),
              //       ),
              //     );
              //   } else {
              //     _registration();
              //   }
              // }
            }),
      ),
    );

    final signIn = Container(
      padding: EdgeInsets.only(
        top: SizeConfig.blockSizeVertical! * 5,
        bottom: SizeConfig.blockSizeVertical! * 2,
        left: SizeConfig.safeBlockHorizontal! * 10,
        right: SizeConfig.safeBlockHorizontal! * 10,
      ),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: RichText(
          text: TextSpan(
              text: 'Already have an account?',
              style: TextStyle(
                letterSpacing: 0.5,
                fontWeight: FontWeight.w400,
                fontFamily: AvailableFonts.primaryFont,
                fontSize: 14.0,
                color: greyDarker,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: ' Login',
                  style: TextStyle(
                    letterSpacing: 0.5,
                    fontWeight: FontWeight.w600,
                    fontFamily: AvailableFonts.primaryFont,
                    fontSize: 14.0,
                    color: greenDarker,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.pushReplacementNamed(context, loginViewRoute);
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
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.only(
              left: SizeConfig.blockSizeHorizontal! * 5,
              right: SizeConfig.blockSizeHorizontal! * 5,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                title,
                registrationForm,
                registrationFormBtn,
                signIn
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _registration() async {
    Navigator.pushNamed(context, verificationViewRoute);
  }
}
