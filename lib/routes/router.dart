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
import 'package:farmall/screens/general/splash_screen.dart';
import 'package:farmall/screens/general/welcome_screen.dart';
import 'package:farmall/screens/root/root.dart';
import 'package:farmall/screens/test.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case splashViewRoute:
      return PageTransition(
        child: SplashScreen(),
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
