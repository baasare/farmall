import 'package:farmall/utils/app_config.dart';
import 'package:farmall/utils/colors.dart';
import 'package:farmall/utils/constants.dart';
import 'package:farmall/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var sortType = [
    "Today",
    "This week",
    "This month",
    "This year",
  ];

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
      actions: [
        IconButton(
          icon: Icon(
            Icons.sort,
            color: greyDarker,
          ),
          tooltip: 'Menu Icon',
          onPressed: () {
            _show(context);
          },
        ),
        IconButton(
          icon: Icon(
            Icons.search,
            color: greyDarker,
          ),
          tooltip: 'Menu Icon',
          onPressed: () {
            _show(context);
          },
        ),
        IconButton(
          icon: Icon(
            Icons.notifications_none_sharp,
            color: greyDarker,
          ),
          tooltip: 'Menu Icon',
          onPressed: () {
            _show(context);
          },
        )
      ],
    );

    return Scaffold(
      key: widget.key,
      appBar: appBar,
    );
  }

  void _show(BuildContext ctx) {
    showModalBottomSheet(
        isScrollControlled: true,
        elevation: 5,
        context: ctx,
        backgroundColor: primaryWhite,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(15.0),
            topLeft: Radius.circular(15.0),
          ),
        ),
        builder: (ctx) => Padding(
              padding: EdgeInsets.only(
                right: SizeConfig.blockSizeHorizontal! * 5,
                left: SizeConfig.blockSizeHorizontal! * 5,
                top: SizeConfig.blockSizeVertical! * 2,
                bottom: SizeConfig.blockSizeVertical! * 2,
              ),
              child: SizedBox(
                height: SizeConfig.blockSizeVertical! * 30,
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: sortType.length + 1,
                  itemBuilder: (context, index) {
                    var bar = Container(
                      margin: EdgeInsets.only(
                        right: SizeConfig.blockSizeHorizontal! * 40,
                        left: SizeConfig.blockSizeHorizontal! * 40,
                      ),
                      width: 10,
                      height: 5,
                      decoration: BoxDecoration(
                        color: Colors.grey[400],
                        borderRadius: BorderRadius.all(
                          Radius.circular(12.0),
                        ),
                      ),
                    );

                    if (index == 0) {
                      return bar;
                    }

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            sortType[index - 1],
                            style: TextStyle(
                              letterSpacing: 0.5,
                              fontWeight: FontWeight.w500,
                              fontFamily: AvailableFonts.primaryFont,
                              fontSize: 17.0,
                              color: greenDarker,
                            ),
                          ),
                        ),
                        Divider(
                          color: Colors.black,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ));
  }
}