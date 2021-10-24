import 'package:farmall/utils/app_config.dart';
import 'package:farmall/utils/colors.dart';
import 'package:farmall/utils/constants.dart';
import 'package:flutter/material.dart';

class SelectorWidget extends StatefulWidget {
  final int choice;
  final List<String> title;
  final List<String> image;
  final Function(int) callback;

  const SelectorWidget({
    Key? key,
    required this.choice,
    required this.title,
    required this.image,
    required this.callback,
  }) : super(key: key);

  @override
  _SelectorWidgetState createState() => _SelectorWidgetState();
}

class _SelectorWidgetState extends State<SelectorWidget> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            widget.callback(0);
          },
          child: Column(
            children: [
              Container(
                height: SizeConfig.blockSizeVertical! * 17,
                width: SizeConfig.blockSizeVertical! * 17,
                margin: EdgeInsets.only(
                  right: SizeConfig.blockSizeHorizontal! * 4,
                  left: SizeConfig.blockSizeHorizontal! * 4,
                  top: SizeConfig.blockSizeVertical! * 2,
                  bottom: SizeConfig.blockSizeVertical! * 2,
                ),
                decoration: BoxDecoration(
                  color: widget.choice == 0 ? greenDarker : primaryWhite,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15.0),
                    topLeft: Radius.circular(15.0),
                    bottomRight: Radius.circular(15.0),
                    bottomLeft: Radius.circular(15.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.all(SizeConfig.blockSizeVertical! * 5),
                  child: ImageIcon(
                    AssetImage(
                      widget.image[0],
                    ),
                    size: 10,
                    color: widget.choice == 0 ? primaryWhite : greenDarker,
                  ),
                ),
              ),
              Text(
                widget.title[0],
                style: TextStyle(
                  letterSpacing: 0.5,
                  fontWeight: FontWeight.w500,
                  fontFamily: AvailableFonts.primaryFont,
                  fontSize: 17.0,
                  color: greyDarker,
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            widget.callback(1);
          },
          child: Column(
            children: [
              Container(
                height: SizeConfig.blockSizeVertical! * 17,
                width: SizeConfig.blockSizeVertical! * 17,
                margin: EdgeInsets.only(
                  right: SizeConfig.blockSizeHorizontal! * 4,
                  left: SizeConfig.blockSizeHorizontal! * 4,
                  top: SizeConfig.blockSizeVertical! * 2,
                  bottom: SizeConfig.blockSizeVertical! * 2,
                ),
                decoration: BoxDecoration(
                  color: widget.choice != 0 ? greenDarker : primaryWhite,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15.0),
                    topLeft: Radius.circular(15.0),
                    bottomRight: Radius.circular(15.0),
                    bottomLeft: Radius.circular(15.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.all(SizeConfig.blockSizeVertical! * 5),
                  child: ImageIcon(
                    AssetImage(
                      widget.image[1],
                    ),
                    size: 10,
                    color: widget.choice != 0 ? primaryWhite : greenDarker,
                  ),
                ),
              ),
              Text(
                widget.title[1],
                style: TextStyle(
                  letterSpacing: 0.5,
                  fontWeight: FontWeight.w500,
                  fontFamily: AvailableFonts.primaryFont,
                  fontSize: 17.0,
                  color: greyDarker,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
