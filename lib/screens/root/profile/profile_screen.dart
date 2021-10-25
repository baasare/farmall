import 'package:farmall/utils/app_config.dart';
import 'package:farmall/utils/colors.dart';
import 'package:farmall/utils/constants.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    final appBar = AppBar(
      leading: Builder(
        builder: (BuildContext appBarContext) {
          return IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: greenDarker,
            ),
            tooltip: 'Menu Icon',
            onPressed: () {
              Navigator.pop(context);
            },
          );
        },
      ),
      elevation: 0,
      backgroundColor: Colors.white,
    );

    return Scaffold(
      appBar: appBar,
      backgroundColor: Color(0xFFF5F7F9),
      body: Stack(
        children: [
          Image.asset(
            AvailableImages.profileBackground["assetPath"] as String,
            width: SizeConfig.blockSizeHorizontal! * 100,
            height: SizeConfig.blockSizeVertical! * 15,
            fit: BoxFit.fill,
          ),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: SizeConfig.blockSizeVertical! * 5,
                  bottom: SizeConfig.blockSizeVertical! * 2,
                ),
                child: Center(
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: SizeConfig.blockSizeVertical! * 9,
                        backgroundColor: Colors.transparent,
                        backgroundImage: AvailableImages.profile["assetImage"]
                            as ImageProvider,
                      ),
                      Positioned(
                        bottom: 0,
                        right: -SizeConfig.blockSizeHorizontal! * 5,
                        child: MaterialButton(
                          onPressed: () => null,
                          elevation: 2,
                          color: Colors.white,
                          textColor: Colors.black,
                          child: Icon(
                            Icons.camera_alt,
                            size: 22,
                            color: greenPrimary,
                          ),
                          padding: EdgeInsets.all(3),
                          shape: CircleBorder(),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Text(
                'Sean Jozie',
                style: TextStyle(
                  letterSpacing: 0.5,
                  fontWeight: FontWeight.w600,
                  fontFamily: AvailableFonts.primaryFont,
                  fontSize: 25.0,
                  color: blackPrimary,
                ),
              ),
              Text(
                '+2330558587127',
                style: TextStyle(
                  letterSpacing: 0.5,
                  fontWeight: FontWeight.w300,
                  fontFamily: AvailableFonts.primaryFont,
                  fontSize: 17.0,
                  color: greyDarker,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: SizeConfig.blockSizeVertical! * 2,
                  left: SizeConfig.blockSizeHorizontal! * 3,
                  right: SizeConfig.blockSizeHorizontal! * 3,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Personal Information',
                      style: TextStyle(
                        letterSpacing: 0.5,
                        fontWeight: FontWeight.w600,
                        fontFamily: AvailableFonts.primaryFont,
                        fontSize: 21.0,
                        color: blackPrimary,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Icon(
                        Icons.edit,
                        color: greenPrimary,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: SizeConfig.blockSizeVertical! * 40,
                margin: EdgeInsets.only(
                  right: SizeConfig.blockSizeHorizontal! * 3,
                  left: SizeConfig.blockSizeHorizontal! * 3,
                  top: SizeConfig.blockSizeVertical! * 2,
                  bottom: SizeConfig.blockSizeVertical! * 2,
                ),
                padding: EdgeInsets.only(
                  // top: SizeConfig.blockSizeVertical! * 2,
                  // bottom: SizeConfig.blockSizeVertical! * 2,
                  right: SizeConfig.blockSizeHorizontal! * 4,
                  left: SizeConfig.blockSizeHorizontal! * 4,
                ),
                decoration: BoxDecoration(
                  color: Color(0xFFF5F7F9),
                  border: Border.all(color: greyDarker),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Name: ',
                          style: TextStyle(
                            letterSpacing: 0.5,
                            fontWeight: FontWeight.w400,
                            fontFamily: AvailableFonts.primaryFont,
                            fontSize: 17.0,
                            color: greyDarkest,
                          ),
                        ),
                        Text(
                          'Sean Jozie',
                          style: TextStyle(
                            letterSpacing: 0.5,
                            fontWeight: FontWeight.w600,
                            fontFamily: AvailableFonts.primaryFont,
                            fontSize: 17.0,
                            color: blackPrimary,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Email: ',
                          style: TextStyle(
                            letterSpacing: 0.5,
                            fontWeight: FontWeight.w400,
                            fontFamily: AvailableFonts.primaryFont,
                            fontSize: 17.0,
                            color: greyDarkest,
                          ),
                        ),
                        Text(
                          'seanjozie@gmail.com',
                          style: TextStyle(
                            letterSpacing: 0.5,
                            fontWeight: FontWeight.w600,
                            fontFamily: AvailableFonts.primaryFont,
                            fontSize: 17.0,
                            color: blackPrimary,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Location: ',
                          style: TextStyle(
                            letterSpacing: 0.5,
                            fontWeight: FontWeight.w400,
                            fontFamily: AvailableFonts.primaryFont,
                            fontSize: 17.0,
                            color: greyDarkest,
                          ),
                        ),
                        Text(
                          'Nairobi',
                          style: TextStyle(
                            letterSpacing: 0.5,
                            fontWeight: FontWeight.w600,
                            fontFamily: AvailableFonts.primaryFont,
                            fontSize: 17.0,
                            color: blackPrimary,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Zip Code: ',
                          style: TextStyle(
                            letterSpacing: 0.5,
                            fontWeight: FontWeight.w400,
                            fontFamily: AvailableFonts.primaryFont,
                            fontSize: 17.0,
                            color: greyDarkest,
                          ),
                        ),
                        Text(
                          '1200',
                          style: TextStyle(
                            letterSpacing: 0.5,
                            fontWeight: FontWeight.w600,
                            fontFamily: AvailableFonts.primaryFont,
                            fontSize: 17.0,
                            color: blackPrimary,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Phone Number: ',
                          style: TextStyle(
                            letterSpacing: 0.5,
                            fontWeight: FontWeight.w400,
                            fontFamily: AvailableFonts.primaryFont,
                            fontSize: 17.0,
                            color: greyDarkest,
                          ),
                        ),
                        Text(
                          '+233 50 641 2478',
                          style: TextStyle(
                            letterSpacing: 0.5,
                            fontWeight: FontWeight.w600,
                            fontFamily: AvailableFonts.primaryFont,
                            fontSize: 17.0,
                            color: blackPrimary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
