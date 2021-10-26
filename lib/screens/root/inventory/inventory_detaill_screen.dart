import 'dart:io';

import 'package:farmall/utils/app_config.dart';
import 'package:farmall/utils/colors.dart';
import 'package:farmall/utils/constants.dart';
import 'package:farmall/utils/utils.dart';
import 'package:farmall/widgets/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class InventoryDetailScreen extends StatefulWidget {
  const InventoryDetailScreen({Key? key}) : super(key: key);

  @override
  _InventoryDetailScreenState createState() => _InventoryDetailScreenState();
}

class _InventoryDetailScreenState extends State<InventoryDetailScreen> {
  final ImagePicker _picker = ImagePicker();
  List<File>? _images = [];

  int quantity = 1;
  double price = 100.0;
  bool itemStatus = true;
  List<String> products = [
    "Brown lentil",
    "Green lentil",
    "Red lentil",
    "Black lentil",
    "English pea",
    "Snow pea",
    "Sugar snap pea",
    "Black beans",
    "Kidney beans",
    "Lima beans",
    "Desi chickpeas",
    "Kabuli chickpeas",
  ];

  String _dropDownValue = "Red Lentils";

  Widget _previewImage() {
    return Container(
      height: 70,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3 + 1,
        // itemCount: _images!.length + 1,
        itemBuilder: (BuildContext context, int i) {
          if ((_images!.isEmpty || i == _images!.length) &&
              _images!.length < 4) {
            return Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: InkWell(
                  onTap: () => showAlert(context),
                  child: Container(
                    color: Colors.grey[300],
                    height: 50.0,
                    width: 60.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.add,
                          size: 17.0,
                          color: Colors.black26,
                        ),
                        Text(
                          "PHOTO",
                          style:
                              TextStyle(fontSize: 11.0, color: Colors.black26),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          }

          return Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.file(
                _images![i],
                fit: BoxFit.cover,
                height: 50.0,
                width: 60.0,
              ),
            ),
          );
        },
      ),
    );
  }

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
            Icons.delete,
            color: greyDarker,
          ),
          tooltip: 'Menu Icon',
          onPressed: () {},
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
                bottom: SizeConfig.blockSizeVertical! * 2,
              ),
              decoration: BoxDecoration(
                color: primaryWhite,
                borderRadius: BorderRadius.all(
                  Radius.circular(3.0),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DropdownButton(
                        hint: Text(
                          _dropDownValue,
                          style: TextStyle(
                            fontFamily: AvailableFonts.primaryFont,
                            color: blackPrimary,
                            fontWeight: FontWeight.w600,
                            fontSize: 17,
                          ),
                        ),
                        underline: SizedBox(),
                        iconSize: 25.0,
                        items: products.map(
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
                    ],
                  ),
                  SizedBox(height: 20.0),
                  _previewImage(),
                ],
              ),
            ),
            Container(
              width: SizeConfig.blockSizeHorizontal! * 100,
              padding: EdgeInsets.only(
                top: SizeConfig.blockSizeVertical! * 2,
                bottom: SizeConfig.blockSizeVertical! * 1,
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
              ),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Quantity (kg)',
                            style: TextStyle(
                              letterSpacing: 0.5,
                              fontWeight: FontWeight.w600,
                              fontFamily: AvailableFonts.primaryFont,
                              fontSize: 17.0,
                              color: blackPrimary,
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 35.0,
                                height: 30.0,
                                margin: EdgeInsets.only(
                                  right: SizeConfig.blockSizeHorizontal! * 1.5,
                                ),
                                child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      quantity++;
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                    // onSurface: greenLight,
                                    primary: greenLight,
                                    padding: EdgeInsets.zero,
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  child: Icon(
                                    Icons.add,
                                    color: greenDarker,
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: greyDarker),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5.0),
                                  ),
                                ),
                                padding: EdgeInsets.only(
                                  right: SizeConfig.blockSizeHorizontal! * 5,
                                  left: SizeConfig.blockSizeHorizontal! * 5,
                                  top: SizeConfig.blockSizeVertical! * 1,
                                  bottom: SizeConfig.blockSizeVertical! * 1,
                                ),
                                child: Text(
                                  "$quantity",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: greenDarker,
                                    fontFamily: AvailableFonts.primaryFont,
                                    letterSpacing: 1.2,
                                    fontSize: 20.0,
                                  ),
                                ),
                              ),
                              Container(
                                width: 35.0,
                                height: 30.0,
                                margin: EdgeInsets.only(
                                  left: SizeConfig.blockSizeHorizontal! * 1.5,
                                ),
                                child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      if (quantity > 1) {
                                        quantity--;
                                      }
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                    // onSurface: greenLight,
                                    primary: greenLight,
                                    padding: EdgeInsets.zero,
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  child: Icon(
                                    Icons.remove,
                                    color: greenDarker,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Price',
                            style: TextStyle(
                              letterSpacing: 0.5,
                              fontWeight: FontWeight.w600,
                              fontFamily: AvailableFonts.primaryFont,
                              fontSize: 17.0,
                              color: blackPrimary,
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: greyDarker),
                              borderRadius: BorderRadius.all(
                                Radius.circular(5.0),
                              ),
                            ),
                            padding: EdgeInsets.only(
                              right: SizeConfig.blockSizeHorizontal! * 5,
                              left: SizeConfig.blockSizeHorizontal! * 5,
                              top: SizeConfig.blockSizeVertical! * 1,
                              bottom: SizeConfig.blockSizeVertical! * 1,
                            ),
                            child: Text(
                              "\$ ${price * quantity}",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: greyDarker,
                                fontFamily: AvailableFonts.primaryFont,
                                letterSpacing: 1.2,
                                fontSize: 20.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 30.0),
                  Text(
                    "Product price is determined by the quantity of product",
                    style: TextStyle(
                      letterSpacing: 0.5,
                      fontWeight: FontWeight.w400,
                      fontFamily: AvailableFonts.primaryFont,
                      fontSize: 14.0,
                      color: greyPrimary,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: SizeConfig.blockSizeVertical! * 15),
            CustomButton(
              buttonColor: greenDarker,
              textColor: Colors.white,
              buttonText: "Save",
              elevation: 10,
              buttonHeight: SizeConfig.blockSizeVertical! * 7,
              buttonWidth: SizeConfig.blockSizeHorizontal! * 40,
              buttonOnPressed: () {},
            ),
            SizedBox(height: 20),
            CustomButton(
              buttonColor: Color(0xFFF5F7F9),
              textColor: greyDarkest,
              buttonText: "Cancel",
              elevation: 0,
              buttonHeight: SizeConfig.blockSizeVertical! * 7,
              buttonWidth: SizeConfig.blockSizeHorizontal! * 40,
              buttonOnPressed: () => Navigator.pop(context),
            )
          ],
        ),
      ),
    );
  }

  //  modal pop up to display more details about a user. gives you the option to follow that user
  void showAlert(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder: (context, setState) {
              return Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ), //this right here
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    FlatButton(
                      color: Colors.white,
                      child: Container(
                        margin: EdgeInsets.all(10.0),
                        child: Text(
                          "Gallery",
                          style: TextStyle(
                              color: HexColor("#D82626"),
                              fontSize: 15.0,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1.5),
                        ),
                      ),
                      shape: StadiumBorder(),
                      onPressed: () {
                        _onImageButtonPressed(ImageSource.gallery, context);
                        Navigator.pop(context);
                      },
                    ),
                    FlatButton(
                      color: Colors.white,
                      child: Container(
                        margin: EdgeInsets.all(10.0),
                        child: Text(
                          "Camera",
                          style: TextStyle(
                              color: HexColor("#D82626"),
                              fontSize: 15.0,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1.5),
                        ),
                      ),
                      shape: StadiumBorder(),
                      onPressed: () {
                        _onImageButtonPressed(ImageSource.camera, context);
                        Navigator.pop(context);
                      },
                    )
                  ],
                ),
              );
            },
          );
        });
  }

  void _onImageButtonPressed(ImageSource source, BuildContext context) async {
    var pickedImage = await _picker.pickImage(source: source);

    setState(() {
      _images!.add(File(pickedImage!.path));
    });
  }
}
