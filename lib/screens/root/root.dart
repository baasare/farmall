import 'package:farmall/screens/root/home_screen.dart';
import 'package:farmall/screens/root/inventory/inventory_screen.dart';
import 'package:farmall/screens/root/order/order_screen.dart';
import 'package:farmall/screens/root/profile/settings_screen.dart';
import 'package:farmall/utils/app_config.dart';
import 'package:farmall/utils/colors.dart';
import 'package:farmall/widgets/custom_drawer.dart';
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

    return AppDrawer(
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.white,
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedFontSize: SizeConfig.safeBlockHorizontal! * 3.0,
          unselectedFontSize: SizeConfig.safeBlockHorizontal! * 3.0,
          selectedLabelStyle: TextStyle(color: greenDarker),
          unselectedLabelStyle: TextStyle(color: greyPrimary),
          selectedItemColor: greenDarker,
          currentIndex: _currentIndex,
          elevation: 0.0,
          onTap: onTabTapped,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: _currentIndex == 0 ? greenDarker : greyPrimary,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_bag_outlined,
                color: _currentIndex == 1 ? greenDarker : greyPrimary,
              ),
              label: "Inventory",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.add_shopping_cart_sharp,
                color: _currentIndex == 2 ? greenDarker : greyPrimary,
              ),
              label: "Orders",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
                color: _currentIndex == 3 ? greenDarker : greyPrimary,
              ),
              label: "settings",
            ),
          ],
        ),
        body: [
          HomeScreen(),
          InventoryScreen(),
          OrderScreen(),
          SettingScreen(),
        ][_currentIndex],
      ),
    );
  }
}
