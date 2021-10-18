import 'package:farmall/screens/root/feed_screen.dart';
import 'package:farmall/screens/root/home_screen.dart';
import 'package:farmall/screens/root/inventory_screen.dart';
import 'package:farmall/screens/root/order_screen.dart';
import 'package:farmall/utils/app_config.dart';
import 'package:farmall/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Root extends StatefulWidget {
  @override
  _RootState createState() => _RootState();
}

class _RootState extends State<Root> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  int _currentIndex = 0;

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedFontSize: SizeConfig.safeBlockHorizontal! * 3.0,
        unselectedFontSize: SizeConfig.safeBlockHorizontal! * 3.0,
        selectedLabelStyle: TextStyle(color: greenPrimary),
        unselectedLabelStyle: TextStyle(color: greyPrimary),
        selectedItemColor: greenPrimary,
        currentIndex: _currentIndex,
        elevation: 0.0,
        onTap: onTabTapped,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: _currentIndex == 0 ? greenPrimary : greyPrimary,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.format_list_bulleted_sharp,
              color: _currentIndex == 1 ? greenPrimary : greyPrimary,
            ),
            label: "Feed",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_shopping_cart_sharp,
              color: _currentIndex == 2 ? greenPrimary : greyPrimary,
            ),
            label: "Orders",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_bag_outlined,
              color: _currentIndex == 3 ? greenPrimary : greyPrimary,
            ),
            label: "Inventory",
          ),
        ],
      ),
      body: [
        HomeScreen(),
        FeedScreen(),
        OrderScreen(),
        InventoryScreen(),
      ][_currentIndex],
    );
  }
}
