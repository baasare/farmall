import 'dart:io';

import 'package:farmall/utils/app_config.dart';
import 'package:farmall/utils/colors.dart';
import 'package:farmall/utils/constants.dart';
import 'package:farmall/utils/utils.dart';
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
  List<File>? _images;

  Widget _previewImage() {
    return Container(
      height: 70,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _images!.length + 1,
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
        "Inventory Summary",
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
                  Text(
                    'Red Lentil',
                    style: TextStyle(
                      letterSpacing: 0.5,
                      fontWeight: FontWeight.w600,
                      fontFamily: AvailableFonts.primaryFont,
                      fontSize: 20.0,
                      color: blackPrimary,
                    ),
                  ),
                  _previewImage(),
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
                bottom: SizeConfig.blockSizeVertical! * 2,
              ),
              decoration: BoxDecoration(
                color: primaryWhite,
                borderRadius: BorderRadius.all(
                  Radius.circular(3.0),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        'Quantity (kg)',
                        style: TextStyle(
                          letterSpacing: 0.5,
                          fontWeight: FontWeight.w600,
                          fontFamily: AvailableFonts.primaryFont,
                          fontSize: 17.0,
                          color: greenDarker,
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 35.0,
                            height: 35.0,
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  // itemQuantity++;
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                onSurface: greenLight,
                                primary: greenLight,
                                padding: EdgeInsets.zero,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              child: Icon(
                                Icons.add,
                                color: greenDarker,
                              ),
                            ),
                          ),
                          Container(
                            child: Text(
                              "0",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.grey.withOpacity(1),
                                fontFamily: AvailableFonts.primaryFont,
                                letterSpacing: 1.2,
                                fontSize: 15.0,
                              ),
                            ),
                          ),
                          Container(
                            width: 35.0,
                            height: 35.0,
                            child: ElevatedButton(
                              onPressed: () {
                                // setState(() {
                                //   if (itemQuantity > 0) {
                                //     itemQuantity--;
                                //   }
                                // });
                              },
                              style: ElevatedButton.styleFrom(
                                onSurface: greenLight,
                                primary: greenLight,
                                padding: EdgeInsets.zero,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              child: Icon(
                                Icons.remove,
                                color: greenDarker,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'Price',
                        style: TextStyle(
                          letterSpacing: 0.5,
                          fontWeight: FontWeight.w400,
                          fontFamily: AvailableFonts.primaryFont,
                          fontSize: 15.0,
                          color: blackPrimary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
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
