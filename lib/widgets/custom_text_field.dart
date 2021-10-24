import 'package:farmall/utils/app_config.dart';
import 'package:farmall/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final FocusNode? nextFocus;
  final FocusNode currentFocus;
  final Function fieldValidator;
  final String fieldHintText;
  final TextInputAction fieldTextInputAction;
  final TextEditingController fieldController;

  const CustomTextField({
    Key? key,
    required this.fieldController,
    required this.fieldValidator,
    required this.currentFocus,
    required this.fieldHintText,
    required this.fieldTextInputAction,
    this.nextFocus,
  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  void initState() {
    super.initState();
    widget.currentFocus.addListener(_onOnFocusNodeEvent);
  }

  _onOnFocusNodeEvent() {
    setState(() {});
  }

  bool isFocused = false;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return TextFormField(
      focusNode: widget.currentFocus,
      controller: widget.fieldController,
      textInputAction: widget.fieldTextInputAction,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        prefixIconConstraints: BoxConstraints(minWidth: 0, maxHeight: 40),
        // prefixIcon: Padding(
        //   padding: EdgeInsets.only(left: 10.0, right: 5.0),
        //   child: Icon(widget.fieldIcon),
        // ),
        filled: false,
        errorStyle: TextStyle(
          fontSize: 11.0,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: greenDarker),
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

        hintStyle: TextStyle(
          fontWeight: FontWeight.w400,
          color: Colors.blueGrey[300],
        ),
      ),
      keyboardType: TextInputType.text,
      style: TextStyle(color: blackPrimary),
      validator: (value) => widget.fieldValidator(value!),
      onFieldSubmitted: (v) {
        FocusScope.of(context).requestFocus(widget.nextFocus);
      },
    );
  }
}
