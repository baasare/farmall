import 'package:farmall/utils/app_config.dart';
import 'package:farmall/utils/colors.dart';
import 'package:farmall/utils/validator.dart';
import 'package:flutter/material.dart';

class CustomPasswordField extends StatefulWidget {
  final IconData fieldIcon;
  final FocusNode? nextFocus;
  final FocusNode currentFocus;
  final Function fieldValidator;
  final String? fieldHintText;
  final String? fieldHelpText;
  final TextInputAction fieldTextInputAction;
  final TextEditingController fieldController;

  const CustomPasswordField({
    Key? key,
    required this.fieldIcon,
    required this.fieldController,
    required this.fieldValidator,
    required this.currentFocus,
    this.fieldHintText,
    this.nextFocus,
    this.fieldHelpText,
    required this.fieldTextInputAction,
  }) : super(key: key);

  @override
  _CustomPasswordFieldState createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    widget.currentFocus.addListener(_onOnFocusNodeEvent);
  }

  _onOnFocusNodeEvent() {
    setState(() {});
  }

  void _toggleObscurity() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return TextFormField(
      focusNode: widget.currentFocus,
      controller: widget.fieldController,
      textInputAction: widget.fieldTextInputAction,
      decoration: InputDecoration(
        helperText: widget.fieldHelpText,
        contentPadding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        prefixIconConstraints: BoxConstraints(minWidth: 0, maxHeight: 40),
        suffixIcon: IconButton(
          icon: _obscureText == true
              ? Icon(
                  Icons.remove_red_eye_sharp,
                  color: greyPrimary,
                )
              : Icon(
                  Icons.remove_red_eye_sharp,
                  color: greyPrimary,
                ),
          onPressed: _toggleObscurity,
        ),
        filled: false,
        fillColor: greyPrimary,
        errorStyle: TextStyle(
          fontSize: 11.0,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: greenPrimary),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide(width: 3.0, style: BorderStyle.solid),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide(color: Colors.red),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide(color: Colors.red),
        ),
        // hintText: widget.fieldHintText,
        hintStyle: TextStyle(
          fontWeight: FontWeight.w400,
          color: Colors.blueGrey[300],
        ),
      ),
      keyboardType: TextInputType.text,
      style: TextStyle(color: blackPrimary),
      validator: (value) => Validator.passwordValidator(value!),
      obscureText: _obscureText,
      onFieldSubmitted: (v) {
        FocusScope.of(context).requestFocus(widget.nextFocus);
      },
    );
  }
}
