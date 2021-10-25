import 'package:farmall/utils/app_config.dart';
import 'package:farmall/utils/colors.dart';
import 'package:farmall/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationItem {
  String? title;

  bool? status;

  NotificationItem({
    this.title,
    this.status,
  });
}

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List<NotificationItem> _notifications = [
    NotificationItem(
      title: "Push Notifications",
      status: true,
    ),
    NotificationItem(
      title: "SMS Notifications",
      status: false,
    ),
    NotificationItem(
      title: "Orders",
      status: true,
    ),
  ];

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
      title: Text(
        "Notification",
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
          for (var i in _notifications)
            Container(
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
                    i.title!,
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
                  CupertinoSwitch(
                    value: i.status!,
                    onChanged: (val) {
                      setState(() {
                        i.status = val;
                      });
                    },
                  )
                ],
              ),
            ),
        ],
      ),
    );
  }
}
