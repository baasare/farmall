import 'package:farmall/utils/app_config.dart';
import 'package:farmall/utils/colors.dart';
import 'package:farmall/utils/constants.dart';
import 'package:farmall/utils/validator.dart';
import 'package:farmall/widgets/custom_button.dart';
import 'package:farmall/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ForgotPasswordRequestScreen extends StatefulWidget {
  @override
  _ForgotPasswordRequestScreenState createState() =>
      _ForgotPasswordRequestScreenState();
}

class _ForgotPasswordRequestScreenState
    extends State<ForgotPasswordRequestScreen> {
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final phoneNumberController = TextEditingController();
  final phoneNumberFocusNode = FocusNode();

  bool _saving = false;

  @override
  void dispose() {
    phoneNumberController.dispose();

    phoneNumberFocusNode.dispose();

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
        "Forgot Password ",
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
      "Please enter your mobile number, we will send you a 5 digits verification code to reset your password.",
      textAlign: TextAlign.left,
      style: TextStyle(
        fontFamily: AvailableFonts.primaryFont,
        color: greyPrimary,
        fontWeight: FontWeight.w400,
        fontSize: 17,
        letterSpacing: 0.5,
      ),
    );

    final phoneNumberField = CustomTextField(
      currentFocus: phoneNumberFocusNode,
      fieldHintText: "Phone Number",
      fieldValidator: Validator.phoneNumberValidator,
      fieldController: phoneNumberController,
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
                'Phone Number',
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
            phoneNumberField,
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
        buttonText: "Continue",
        elevation: 5,
        buttonHeight: SizeConfig.blockSizeVertical! * 7,
        buttonWidth: SizeConfig.blockSizeHorizontal! * 100,
        buttonOnPressed: () {
          if (_formKey.currentState!.validate()) {
            SystemChannels.textInput.invokeMethod('TextInput.hide');
            setState(() {
              _saving = true;
            });
            _passwordResetRequest();
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
              children: <Widget>[title, loginForm, submitBtn],
            ),
          ),
        ),
      ),
    );
  }

  void _passwordResetRequest() async {}
}
