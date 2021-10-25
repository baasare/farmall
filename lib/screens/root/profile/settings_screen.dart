import 'package:farmall/routes/routes.dart';
import 'package:farmall/utils/app_config.dart';
import 'package:farmall/utils/colors.dart';
import 'package:farmall/utils/constants.dart';
import 'package:farmall/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';

class ListItem {
  String? name;
  String? path;

  ListItem({this.name, this.path});
}

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    final appBar = AppBar(
      leading: Builder(
        builder: (BuildContext appBarContext) {
          return IconButton(
            icon: Icon(
              Icons.menu,
              color: greyDarker,
            ),
            tooltip: 'Menu Icon',
            onPressed: () {
              // Scaffold.of(context).openDrawer();
              AppDrawer.of(appBarContext)!.toggle();
            },
          );
        },
      ),
      elevation: 0,
      backgroundColor: Colors.white,
      title: Text(
        "Profile",
        textAlign: TextAlign.left,
        style: TextStyle(
          fontFamily: AvailableFonts.primaryFont,
          color: greenDarker,
          fontWeight: FontWeight.w600,
          fontSize: 20,
        ),
      ),
    );

    return Scaffold(
      key: widget.key,
      appBar: appBar,
      body: Column(
        children: [
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, profileViewRoute),
            child: Container(
              // height: SizeConfig.blockSizeVertical! * 15,
              width: SizeConfig.blockSizeHorizontal! * 100,
              padding: EdgeInsets.only(
                top: SizeConfig.blockSizeVertical! * 2,
                bottom: SizeConfig.blockSizeVertical! * 2,
                right: SizeConfig.blockSizeHorizontal! * 3,
                left: SizeConfig.blockSizeHorizontal! * 3,
              ),
              margin: EdgeInsets.only(
                right: SizeConfig.blockSizeHorizontal! * 3,
                left: SizeConfig.blockSizeHorizontal! * 3,
                top: SizeConfig.blockSizeVertical! * 2,
                bottom: SizeConfig.blockSizeVertical! * 2,
              ),
              decoration: BoxDecoration(
                color: primaryWhite,
                borderRadius: BorderRadius.all(
                  Radius.circular(3.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: SizeConfig.blockSizeVertical! * 5,
                    backgroundColor: greyPrimary,
                    child: Text(
                      'SJ',
                      style: TextStyle(
                        letterSpacing: 0.5,
                        fontWeight: FontWeight.w600,
                        fontFamily: AvailableFonts.primaryFont,
                        fontSize: 25.0,
                        color: primaryWhite,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                      Text(
                        '+2330558587127',
                        style: TextStyle(
                          letterSpacing: 0.5,
                          fontWeight: FontWeight.w600,
                          fontFamily: AvailableFonts.primaryFont,
                          fontSize: 13.0,
                          color: greyDarker,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          for (var item in [
            // ListItem(name: "Orders", path: ordersViewRoute),
            ListItem(name: "Notification", path: notificationViewRoute),
            ListItem(name: "Terms & Conditions", path: termsViewRoute),
            ListItem(name: "FAQs", path: faqViewRoute),
          ])
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, item.path!),
              child: Container(
                // height: SizeConfig.blockSizeVertical! * 15,
                width: SizeConfig.blockSizeHorizontal! * 100,
                padding: EdgeInsets.only(
                  top: SizeConfig.blockSizeVertical! * 2,
                  bottom: SizeConfig.blockSizeVertical! * 2,
                  right: SizeConfig.blockSizeHorizontal! * 3,
                  left: SizeConfig.blockSizeHorizontal! * 3,
                ),
                margin: EdgeInsets.only(
                  right: SizeConfig.blockSizeHorizontal! * 3,
                  left: SizeConfig.blockSizeHorizontal! * 3,
                  top: SizeConfig.blockSizeVertical! * 2,
                ),
                decoration: BoxDecoration(
                  color: primaryWhite,
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      item.name!,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: blackPrimary,
                        fontSize: 18.0,
                        height: 1.4,
                        fontFamily: AvailableFonts.primaryFont,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.6,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                    )
                  ],
                ),
              ),
            ),
          Spacer(),
          Container(
            // height: SizeConfig.blockSizeVertical! * 15,
            width: SizeConfig.blockSizeHorizontal! * 100,
            padding: EdgeInsets.only(
              top: SizeConfig.blockSizeVertical! * 2,
              bottom: SizeConfig.blockSizeVertical! * 2,
            ),
            margin: EdgeInsets.only(
              right: SizeConfig.blockSizeHorizontal! * 3,
              left: SizeConfig.blockSizeHorizontal! * 3,
              bottom: SizeConfig.blockSizeVertical! * 2,
            ),
            decoration: BoxDecoration(
              color: primaryWhite,
              borderRadius: BorderRadius.all(
                Radius.circular(5.0),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.logout, color: Colors.red),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "Logout",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: blackPrimary,
                    fontSize: 18.0,
                    height: 1.4,
                    fontFamily: AvailableFonts.primaryFont,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.6,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
