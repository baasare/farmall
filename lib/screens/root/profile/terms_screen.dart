import 'package:farmall/utils/app_config.dart';
import 'package:farmall/utils/colors.dart';
import 'package:farmall/utils/constants.dart';
import 'package:flutter/material.dart';

class TermsScreen extends StatefulWidget {
  const TermsScreen({Key? key}) : super(key: key);

  @override
  _TermsScreenState createState() => _TermsScreenState();
}

class _TermsScreenState extends State<TermsScreen> {
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
        "Terms & Conditions",
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
      body: Padding(
        padding: EdgeInsets.only(
          top: SizeConfig.blockSizeVertical! * 2,
          bottom: SizeConfig.blockSizeVertical! * 2,
          right: SizeConfig.blockSizeHorizontal! * 3,
          left: SizeConfig.blockSizeHorizontal! * 3,
        ),
        child: RichText(
          text: TextSpan(
              text: 'Updated on 12.10.2021',
              style: TextStyle(
                letterSpacing: 0.5,
                fontWeight: FontWeight.w600,
                fontFamily: AvailableFonts.primaryFont,
                fontSize: 17.0,
                color: blackPrimary,
              ),
              children: [
                TextSpan(
                  text: '\n\nOverview\n\n',
                  style: TextStyle(
                    letterSpacing: 0.5,
                    fontWeight: FontWeight.w600,
                    fontFamily: AvailableFonts.primaryFont,
                    fontSize: 16.0,
                    color: blackPrimary,
                  ),
                ),
                TextSpan(
                  text:
                      'Please read these Terms of Service (“Terms”, “Terms of Service”) carefully before using ASMR app. products (the “Service”) operated by Tingles, Inc. (“us”, “we”, or “our”). Your access to and use of the Service is conditioned on your acceptance of and compliance with these Terms. These Terms of Service apply to all visitors, users and others who access or use the Service. By accessing or using the Service you agree to be bound by these Terms. If you disagree with any part of the terms then you may not access the Service.',
                  style: TextStyle(
                    letterSpacing: 0.5,
                    fontWeight: FontWeight.w500,
                    fontFamily: AvailableFonts.primaryFont,
                    fontSize: 14.0,
                    color: blackPrimary,
                  ),
                ),
                TextSpan(
                  text: '\n\nPurchases\n\n',
                  style: TextStyle(
                    letterSpacing: 0.5,
                    fontWeight: FontWeight.w600,
                    fontFamily: AvailableFonts.primaryFont,
                    fontSize: 16.0,
                    color: blackPrimary,
                  ),
                ),
                TextSpan(
                  text:
                      'If you wish to purchase any product or service made available through the Service (“Purchase”) you may be asked to supply certain information relevant to your Purchase including: email address. You represent and warrant that: The information you supply to us is true, correct and complete. You expressly agree that ASMR app. is not responsible for any loss or damage arising from the submission of false or inaccurate information.',
                  style: TextStyle(
                    letterSpacing: 0.5,
                    fontWeight: FontWeight.w500,
                    fontFamily: AvailableFonts.primaryFont,
                    fontSize: 14.0,
                    color: blackPrimary,
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
