import 'package:farmall/utils/app_config.dart';
import 'package:farmall/utils/colors.dart';
import 'package:farmall/utils/constants.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatefulWidget {
  final Widget child;

  AppDrawer({key, required this.child}) : super(key: key);

  static _AppDrawerState? of(BuildContext context) =>
      context.findAncestorStateOfType<_AppDrawerState>();

  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer>
    with SingleTickerProviderStateMixin {
  static Duration duration = Duration(milliseconds: 50);
  late AnimationController _controller;
  static const double maxSlide = 255;
  static const dragRightStartVal = 60;
  static const dragLeftStartVal = maxSlide - 20;
  static bool shouldDrag = false;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: _AppDrawerState.duration);
    super.initState();
  }

  void close() => _controller.reverse();

  void open() => _controller.forward();

  void toggle() {
    if (_controller.isCompleted) {
      close();
    } else {
      open();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onDragStart(DragStartDetails startDetails) {
    bool isDraggingFromLeft = _controller.isDismissed &&
        startDetails.globalPosition.dx < dragRightStartVal;
    bool isDraggingFromRight = _controller.isCompleted &&
        startDetails.globalPosition.dx > dragLeftStartVal;
    shouldDrag = isDraggingFromLeft || isDraggingFromRight;
  }

  void _onDragUpdate(DragUpdateDetails updateDetails) {
    if (shouldDrag == false) {
      return;
    }
    double delta = updateDetails.primaryDelta! / maxSlide;
    _controller.value += delta;
  }

  void _onDragEnd(DragEndDetails dragEndDetails) {
    if (_controller.isDismissed || _controller.isCompleted) {
      return;
    }

    double _kMinFlingVelocity = 365.0;
    double dragVelocity = dragEndDetails.velocity.pixelsPerSecond.dx.abs();

    if (dragVelocity >= _kMinFlingVelocity) {
      double visualVelocityInPx = dragEndDetails.velocity.pixelsPerSecond.dx /
          MediaQuery.of(context).size.width;
      _controller.fling(velocity: visualVelocityInPx);
    } else if (_controller.value < 0.5) {
      close();
    } else {
      open();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragStart: _onDragStart,
      onHorizontalDragUpdate: _onDragUpdate,
      onHorizontalDragEnd: _onDragEnd,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (BuildContext context, _) {
          double animationVal = _controller.value;
          double translateVal = animationVal * maxSlide;
          double scaleVal = 1 - (animationVal * 0.3);
          return Stack(
            children: <Widget>[
              CustomDrawer(),
              Transform(
                alignment: Alignment.centerLeft,
                transform: Matrix4.identity()
                  ..translate(translateVal)
                  ..scale(scaleVal),
                child: GestureDetector(
                    onTap: () {
                      if (_controller.isCompleted) {
                        close();
                      }
                    },
                    child: widget.child),
              ),
            ],
          );
        },
      ),
    );
  }
}

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Material(
      color: primaryWhite,
      child: SafeArea(
        child: Theme(
          data: ThemeData(
            brightness: Brightness.dark,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(
                  right: SizeConfig.blockSizeHorizontal! * 2,
                  left: SizeConfig.blockSizeHorizontal! * 2,
                  top: SizeConfig.blockSizeVertical! * 5,
                  bottom: SizeConfig.blockSizeVertical! * 5,
                ),
                child: Row(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: SizeConfig.blockSizeVertical! * 4,
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
                    SizedBox(
                      width: SizeConfig.blockSizeHorizontal! * 10,
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        color: blackPrimary,
                      ),
                      tooltip: 'Menu Icon',
                      onPressed: () => AppDrawer.of(context)!.toggle(),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: Icon(Icons.perm_identity_sharp, color: greenDarker),
                title: Text(
                  'Customers',
                  style: TextStyle(
                    letterSpacing: 0.5,
                    fontWeight: FontWeight.w600,
                    fontFamily: AvailableFonts.primaryFont,
                    fontSize: 20.0,
                    color: blackPrimary,
                  ),
                ),
              ),
              ListTile(
                leading:
                    Icon(Icons.add_shopping_cart_outlined, color: greenDarker),
                title: Text(
                  'Discount',
                  style: TextStyle(
                    letterSpacing: 0.5,
                    fontWeight: FontWeight.w600,
                    fontFamily: AvailableFonts.primaryFont,
                    fontSize: 20.0,
                    color: blackPrimary,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.settings, color: greenDarker),
                title: Text(
                  'Settings',
                  style: TextStyle(
                    letterSpacing: 0.5,
                    fontWeight: FontWeight.w600,
                    fontFamily: AvailableFonts.primaryFont,
                    fontSize: 20.0,
                    color: blackPrimary,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.info_outline_rounded, color: greenDarker),
                title: Text(
                  'Support',
                  style: TextStyle(
                    letterSpacing: 0.5,
                    fontWeight: FontWeight.w600,
                    fontFamily: AvailableFonts.primaryFont,
                    fontSize: 20.0,
                    color: blackPrimary,
                  ),
                ),
              ),
              Spacer(),
              ListTile(
                leading: Icon(Icons.login_sharp, color: Colors.red),
                title: Text(
                  'Logout',
                  style: TextStyle(
                    letterSpacing: 0.5,
                    fontWeight: FontWeight.w600,
                    fontFamily: AvailableFonts.primaryFont,
                    fontSize: 20.0,
                    color: blackPrimary,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  right: SizeConfig.blockSizeHorizontal! * 2,
                  left: SizeConfig.blockSizeHorizontal! * 5,
                  top: SizeConfig.blockSizeVertical! * 5,
                  bottom: SizeConfig.blockSizeVertical! * 3,
                ),
                child: Image.asset(
                  AvailableImages.appLogo["assetPath"] as String,
                  height: SizeConfig.blockSizeVertical! * 10,
                  width: SizeConfig.blockSizeHorizontal! * 30,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
