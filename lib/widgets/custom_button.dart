import 'package:farmall/utils/app_config.dart';
import 'package:farmall/utils/constants.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Color buttonColor;
  final Color? textColor;
  final String buttonText;
  final double elevation;
  final double buttonHeight;
  final double buttonWidth;
  final VoidCallback buttonOnPressed;

  const CustomButton({
    required this.buttonColor,
    this.textColor,
    required this.buttonText,
    required this.elevation,
    required this.buttonHeight,
    required this.buttonWidth,
    required this.buttonOnPressed,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Container(
      height: buttonHeight,
      width: buttonWidth,
      child: Material(
        borderRadius: BorderRadius.circular(8.0),
        color: buttonColor,
        elevation: elevation,
        shadowColor: Colors.white70,
        child: MaterialButton(
          onPressed: buttonOnPressed,
          child: Text(
            buttonText,
            style: TextStyle(
              letterSpacing: 1.5,
              fontWeight: FontWeight.w500,
              fontFamily: AvailableFonts.primaryFont,
              fontSize: 17.0,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
