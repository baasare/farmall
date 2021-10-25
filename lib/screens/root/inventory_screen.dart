import 'package:farmall/routes/routes.dart';
import 'package:farmall/utils/app_config.dart';
import 'package:farmall/utils/colors.dart';
import 'package:farmall/utils/constants.dart';
import 'package:farmall/widgets/custom_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InventoryScreen extends StatefulWidget {
  const InventoryScreen({Key? key}) : super(key: key);

  @override
  _InventoryScreenState createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<InventoryScreen> {
  var sortType = [
    "All",
    "Date",
    "Largest",
    "Smallest",
  ];

  String _dropDownValue = "All Product";

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
        "Inventory",
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
            Icons.search,
            color: greyDarker,
          ),
          tooltip: 'Menu Icon',
          onPressed: () {
            _show(context);
          },
        ),
      ],
    );

    return Scaffold(
      key: widget.key,
      appBar: appBar,
      backgroundColor: Color(0xFFF5F7F9),
      body: SingleChildScrollView(
        child: Column(
          children: [
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
                  SizedBox(
                    width: SizeConfig.blockSizeHorizontal! * 30,
                    child: DropdownButton(
                      hint: Text(
                        _dropDownValue,
                        style: TextStyle(
                          fontFamily: AvailableFonts.primaryFont,
                          color: blackPrimary,
                          fontWeight: FontWeight.w400,
                          fontSize: 17,
                        ),
                      ),
                      underline: SizedBox(),
                      iconSize: 25.0,
                      items: [
                        "All Product",
                        "Active",
                        "Draft",
                        "Category",
                      ].map(
                        (val) {
                          return DropdownMenuItem(
                            value: val,
                            child: Text(
                              val,
                              style: TextStyle(
                                fontFamily: AvailableFonts.primaryFont,
                                color: blackPrimary,
                                fontWeight: FontWeight.w400,
                                fontSize: 17,
                              ),
                            ),
                          );
                        },
                      ).toList(),
                      onChanged: (String? newValue) {
                        _dropDownValue = newValue!;
                        setState(() {});
                      },
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _show(context);
                    },
                    child: Icon(
                      Icons.filter_list,
                      color: blackPrimary,
                    ),
                  ),
                ],
              ),
            ),
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
                  Radius.circular(3.0),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: SizeConfig.blockSizeHorizontal! * 25,
                    child: Text(
                      'Product',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        letterSpacing: 0.5,
                        fontWeight: FontWeight.w600,
                        fontFamily: AvailableFonts.primaryFont,
                        fontSize: 15.0,
                        color: blackPrimary,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: SizeConfig.blockSizeHorizontal! * 25,
                    child: Text(
                      'Status',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        letterSpacing: 0.5,
                        fontWeight: FontWeight.w600,
                        fontFamily: AvailableFonts.primaryFont,
                        fontSize: 15.0,
                        color: blackPrimary,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: SizeConfig.blockSizeHorizontal! * 25,
                    child: Text(
                      'Availability',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        letterSpacing: 0.5,
                        fontWeight: FontWeight.w600,
                        fontFamily: AvailableFonts.primaryFont,
                        fontSize: 15.0,
                        color: blackPrimary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () =>
                  Navigator.pushNamed(context, inventoryDetailViewRoute),
              child: Container(
                width: SizeConfig.blockSizeHorizontal! * 100,
                padding: EdgeInsets.only(
                  top: SizeConfig.blockSizeVertical! * 3,
                  bottom: SizeConfig.blockSizeVertical! * 3,
                  right: SizeConfig.blockSizeHorizontal! * 3,
                  left: SizeConfig.blockSizeHorizontal! * 3,
                ),
                margin: EdgeInsets.only(
                  right: SizeConfig.blockSizeHorizontal! * 3,
                  left: SizeConfig.blockSizeHorizontal! * 3,
                  top: SizeConfig.blockSizeVertical! * 0.2,
                ),
                decoration: BoxDecoration(
                  color: primaryWhite,
                  borderRadius: BorderRadius.all(
                    Radius.circular(3.0),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: SizeConfig.blockSizeHorizontal! * 25,
                      child: Text(
                        'Red Lentils',
                        overflow: TextOverflow.fade,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          letterSpacing: 0.5,
                          fontWeight: FontWeight.w600,
                          fontFamily: AvailableFonts.primaryFont,
                          fontSize: 15.0,
                          color: blackPrimary,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: SizeConfig.blockSizeHorizontal! * 25,
                      child: Text(
                        'Status',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          letterSpacing: 0.5,
                          fontWeight: FontWeight.w600,
                          fontFamily: AvailableFonts.primaryFont,
                          fontSize: 15.0,
                          color: blackPrimary,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: SizeConfig.blockSizeHorizontal! * 25,
                      child: Text(
                        '40Kg',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          letterSpacing: 0.5,
                          fontWeight: FontWeight.w600,
                          fontFamily: AvailableFonts.primaryFont,
                          fontSize: 15.0,
                          color: blackPrimary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () =>
                  Navigator.pushNamed(context, inventoryDetailViewRoute),
              child: Container(
                width: SizeConfig.blockSizeHorizontal! * 100,
                padding: EdgeInsets.only(
                  top: SizeConfig.blockSizeVertical! * 3,
                  bottom: SizeConfig.blockSizeVertical! * 3,
                  right: SizeConfig.blockSizeHorizontal! * 3,
                  left: SizeConfig.blockSizeHorizontal! * 3,
                ),
                margin: EdgeInsets.only(
                  right: SizeConfig.blockSizeHorizontal! * 3,
                  left: SizeConfig.blockSizeHorizontal! * 3,
                  top: SizeConfig.blockSizeVertical! * 0.2,
                ),
                decoration: BoxDecoration(
                  color: primaryWhite,
                  borderRadius: BorderRadius.all(
                    Radius.circular(3.0),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: SizeConfig.blockSizeHorizontal! * 25,
                      child: Text(
                        'Red Lentils',
                        overflow: TextOverflow.fade,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          letterSpacing: 0.5,
                          fontWeight: FontWeight.w600,
                          fontFamily: AvailableFonts.primaryFont,
                          fontSize: 15.0,
                          color: blackPrimary,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: SizeConfig.blockSizeHorizontal! * 25,
                      child: Text(
                        'Status',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          letterSpacing: 0.5,
                          fontWeight: FontWeight.w600,
                          fontFamily: AvailableFonts.primaryFont,
                          fontSize: 15.0,
                          color: blackPrimary,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: SizeConfig.blockSizeHorizontal! * 25,
                      child: Text(
                        '40Kg',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          letterSpacing: 0.5,
                          fontWeight: FontWeight.w600,
                          fontFamily: AvailableFonts.primaryFont,
                          fontSize: 15.0,
                          color: blackPrimary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
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
