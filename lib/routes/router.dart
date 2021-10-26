import 'package:farmall/routes/routes.dart';
import 'package:farmall/screens/authentication/forgot_password/forgot_password_complete_screen.dart';
import 'package:farmall/screens/authentication/forgot_password/forgot_password_request_screen.dart';
import 'package:farmall/screens/authentication/forgot_password/forgot_password_screen.dart';
import 'package:farmall/screens/authentication/forgot_password/verification_screen.dart';
import 'package:farmall/screens/authentication/login_screen.dart';
import 'package:farmall/screens/authentication/registration_screen.dart';
import 'package:farmall/screens/general/account_selection_screen.dart';
import 'package:farmall/screens/general/customer_walkthrough_screen.dart';
import 'package:farmall/screens/general/farmer_walkthrough_screen.dart';
import 'package:farmall/screens/general/first_screen.dart';
import 'package:farmall/screens/general/welcome_screen.dart';
import 'package:farmall/screens/root/inventory/inventory_detaill_screen.dart';
import 'package:farmall/screens/root/inventory/inventory_screen.dart';
import 'package:farmall/screens/root/order/order_detaill_screen.dart';
import 'package:farmall/screens/root/order/order_screen.dart';
import 'package:farmall/screens/root/profile/notification_screen.dart';
import 'package:farmall/screens/root/profile/profile_screen.dart';
import 'package:farmall/screens/root/profile/terms_screen.dart';
import 'package:farmall/screens/root/root.dart';
import 'package:farmall/screens/test.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case firstViewRoute:
      return PageTransition(
        child: FirstScreen(),
        type: PageTransitionType.fade,
      );
    case accountSelectionViewRoute:
      return PageTransition(
        child: AccountSelectionScreen(),
        type: PageTransitionType.fade,
      );
    case farmersWalkThroughViewRoute:
      return PageTransition(
        child: FarmerWalkThroughScreen(),
        type: PageTransitionType.fade,
      );
    case customersWalkThroughViewRoute:
      return PageTransition(
        child: CustomerWalkThroughScreen(),
        type: PageTransitionType.fade,
      );

    case registrationViewRoute:
      return PageTransition(
        child: RegistrationScreen(),
        type: PageTransitionType.fade,
      );
    case loginViewRoute:
      return PageTransition(
        child: LoginScreen(),
        type: PageTransitionType.fade,
      );

    case welcomeViewRoute:
      return PageTransition(
        child: WelcomeScreen(),
        type: PageTransitionType.fade,
      );

    case passwordResetRequestViewRoute:
      return PageTransition(
        child: ForgotPasswordRequestScreen(),
        type: PageTransitionType.fade,
      );
    case verificationViewRoute:
      final Map<String, dynamic> arguments =
          settings.arguments as Map<String, dynamic>;

      return PageTransition(
        child: VerificationScreen(
          phoneNumber: arguments["phone_number"],
        ),
        type: PageTransitionType.fade,
      );
    case passwordResetViewRoute:
      return PageTransition(
        child: ForgotPasswordScreen(),
        type: PageTransitionType.fade,
      );
    case passwordResetCompleteViewRoute:
      return PageTransition(
        child: ForgotPasswordCompleteScreen(),
        type: PageTransitionType.fade,
      );

    case rootViewRoute:
      return PageTransition(
        child: Root(),
        type: PageTransitionType.fade,
      );

    case profileViewRoute:
      return PageTransition(
        child: ProfileScreen(),
        type: PageTransitionType.fade,
      );
    case termsViewRoute:
      return PageTransition(
        child: TermsScreen(),
        type: PageTransitionType.fade,
      );
    case notificationViewRoute:
      return PageTransition(
        child: NotificationScreen(),
        type: PageTransitionType.fade,
      );
    case ordersViewRoute:
      return PageTransition(
        child: OrderScreen(),
        type: PageTransitionType.fade,
      );
    case orderDetailViewRoute:
      return PageTransition(
        child: OrderDetailScreen(),
        type: PageTransitionType.fade,
      );
    case inventoryViewRoute:
      return PageTransition(
        child: InventoryScreen(),
        type: PageTransitionType.fade,
      );
    case inventoryDetailViewRoute:
      return PageTransition(
        child: InventoryDetailScreen(),
        type: PageTransitionType.fade,
      );

    case testViewRoute:
      return PageTransition(
        child: TestScreen(),
        type: PageTransitionType.fade,
      );

    default:
      return PageTransition(
        child: Root(),
        type: PageTransitionType.fade,
      );
  }
}
