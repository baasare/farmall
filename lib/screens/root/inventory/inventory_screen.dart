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
    "Active",
    "Draft",
  ];

  String _dropDownValue = "All Product";

  bool itemStatus = false;

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
          onPressed: () {},
        ),
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: SizedBox(
            width: 40,
            height: 40,
            child: MaterialButton(
              onPressed: () =>
                  Navigator.pushNamed(context, inventoryDetailViewRoute),
              elevation: 0,
              color: greenLight,
              textColor: Colors.black,
              child: Icon(
                Icons.add,
                size: 17,
                color: greenDarker,
              ),
              padding: EdgeInsets.zero,
              shape: CircleBorder(),
            ),
          ),
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
              child: Align(
                alignment: Alignment.topLeft,
                child: SizedBox(
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
                      'Quantity',
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
                  top: SizeConfig.blockSizeVertical! * 2,
                  bottom: SizeConfig.blockSizeVertical! * 2,
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
                    Container(
                      height: SizeConfig.blockSizeVertical! * 4,
                      padding: EdgeInsets.only(
                        // top: SizeConfig.blockSizeVertical! * 2,
                        // bottom: SizeConfig.blockSizeVertical! * 2,
                        right: SizeConfig.blockSizeHorizontal! * 3,
                        left: SizeConfig.blockSizeHorizontal! * 3,
                      ),
                      decoration: BoxDecoration(
                        color: itemStatus ? greenDarker : greyDarker,
                        borderRadius: BorderRadius.all(
                          Radius.circular(30.0),
                        ),
                      ),
                      child: DropdownButton(
                        hint: Text(
                          itemStatus ? "Active" : "Draft",
                          style: TextStyle(
                            letterSpacing: 0.5,
                            fontWeight: FontWeight.w400,
                            fontFamily: AvailableFonts.primaryFont,
                            fontSize: 14.0,
                            color: whitePrimary,
                          ),
                        ),
                        underline: SizedBox(),
                        iconSize: 25.0,
                        iconEnabledColor: Colors.white,
                        items: [
                          "Active",
                          "Draft",
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
                          if (newValue == "Active") {
                            itemStatus = true;
                          } else {
                            itemStatus = false;
                          }
                          setState(() {});
                        },
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
}
