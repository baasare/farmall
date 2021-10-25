import 'package:flutter/material.dart';

// Fonts
class AvailableFonts {
  static const primaryFont = "ProductSans";
  static const secondaryFont = "Poppins";
}

// Endpoints
class ApiEndpoints {
  // static final baseEndpoint = FlutterConfig.get('BASE_URL');
}

// sharedPreferences keys
class SavedPreferencesKeys {
  static const userTokenKey = "token";
  static const userEmailKey = "email";
  static const currentUserKey = "current_user";
  static const currentUserType = "current_user_type";
  static const seenWalkThroughKey = "walkthrough";
  static const deviceFirebaseTokenKey = "firebase_token";
  static const accountSetupStepKey = "firebase_token";
}

// sharedPreferences keys
class AccountSetupStepKeys {
  static const profileSetup = "profile_setup";
  static const productCategorySetup = "product_category_setup";
  static const landSizeSetup = "land_size_setup";
  static const currentLocationSetup = "current_location_setup";
  static const certificateSetup = "certificate_setup";
}

// Icons
class AvailableIcons {
  static const homeActive = {
    'assetImage': AssetImage('assets/images/nav_active_home_icon.png'),
    'assetPath': 'assets/images/nav_active_home_icon.png',
  };

  static const historyActive = {
    'assetImage': AssetImage('assets/images/nav_active_history_icon.png'),
    'assetPath': 'assets/images/nav_active_history_icon.png',
  };

  static const notificationActive = {
    'assetImage': AssetImage('assets/images/nav_active_notification_icon.png'),
    'assetPath': 'assets/images/nav_active_notification_icon.png',
  };

  static const drugActive = {
    'assetImage': AssetImage('assets/images/nav_active_drug_icon.png'),
    'assetPath': 'assets/images/nav_active_drug_icon.png',
  };

  static const settingsActive = {
    'assetImage': AssetImage('assets/images/nav_active_settings_icon.png'),
    'assetPath': 'assets/images/nav_active_settings_icon.png',
  };

  static const homeInactive = {
    'assetImage': AssetImage('assets/images/nav_inactive_home_icon.png'),
    'assetPath': 'assets/images/nav_inactive_home_icon.png',
  };

  static const historyInactive = {
    'assetImage': AssetImage('assets/images/nav_inactive_history_icon.png'),
    'assetPath': 'assets/images/nav_inactive_history_icon.png',
  };

  static const notificationInactive = {
    'assetImage':
        AssetImage('assets/images/nav_inactive_notification_icon.png'),
    'assetPath': 'assets/images/nav_inactive_notification_icon.png',
  };

  static const drugInactive = {
    'assetImage': AssetImage('assets/images/nav_inactive_drug_icon.png'),
    'assetPath': 'assets/images/nav_inactive_drug_icon.png',
  };

  static const settingsInactive = {
    'assetImage': AssetImage('assets/images/nav_inactive_settings_icon.png'),
    'assetPath': 'assets/images/nav_inactive_settings_icon.png',
  };

  static const visaIcon = {
    'assetImage': AssetImage('assets/images/visa_logo.png'),
    'assetPath': 'assets/images/visa_logo.png',
  };

  static const mastercardIcon = {
    'assetImage': AssetImage('assets/images/mastercard_logo.png'),
    'assetPath': 'assets/images/mastercard_logo.png',
  };

  static const drugIcon = {
    'assetImage': AssetImage('assets/images/drug_logo.png'),
    'assetPath': 'assets/images/drug_logo.png',
  };
}

// Images
class AvailableImages {
  static const appLogo = {
    'assetImage': AssetImage('assets/images/app_logo.png'),
    'assetPath': 'assets/images/app_logo.png',
  };

  static const profile = {
    'assetImage': AssetImage('assets/images/profile.png'),
    'assetPath': 'assets/images/profile.png',
  };

  static const buyer = {
    'assetImage': AssetImage('assets/images/buyer.png'),
    'assetPath': 'assets/images/buyer.png',
  };

  static const seller = {
    'assetImage': AssetImage('assets/images/seller.png'),
    'assetPath': 'assets/images/seller.png',
  };

  static const individual = {
    'assetImage': AssetImage('assets/images/individual.png'),
    'assetPath': 'assets/images/individual.png',
  };

  static const business = {
    'assetImage': AssetImage('assets/images/business.png'),
    'assetPath': 'assets/images/business.png',
  };

  static const cooperative = {
    'assetImage': AssetImage('assets/images/cooperative.png'),
    'assetPath': 'assets/images/cooperative.png',
  };

  static const splashBackground = {
    'assetImage': AssetImage('assets/images/splash_background.png'),
    'assetPath': 'assets/images/splash_background.png',
  };

  static const walkThroughImg_1 = {
    'assetImage': AssetImage('assets/images/walk_1.png'),
    'assetPath': 'assets/images/walk_1.png',
  };

  static const walkThroughImg_2 = {
    'assetImage': AssetImage('assets/images/walk_2.png'),
    'assetPath': 'assets/images/walk_2.png',
  };

  static const walkThroughImg_3 = {
    'assetImage': AssetImage('assets/images/walk_3.png'),
    'assetPath': 'assets/images/walk_3.png',
  };

  static const customerWalkThroughImg_1 = {
    'assetImage': AssetImage('assets/images/walk_customer_1.png'),
    'assetPath': 'assets/images/walk_customer_1.png',
  };

  static const customerWalkThroughImg_2 = {
    'assetImage': AssetImage('assets/images/walk_customer_2.png'),
    'assetPath': 'assets/images/walk_customer_2.png',
  };

  static const customerWalkThroughImg_3 = {
    'assetImage': AssetImage('assets/images/walk_customer_3.png'),
    'assetPath': 'assets/images/walk_customer_3.png',
  };

  static const welcome = {
    'assetImage': AssetImage('assets/images/welcome.png'),
    'assetPath': 'assets/images/welcome.png',
  };

  static const resetSuccessful = {
    'assetImage': AssetImage('assets/images/reset_successful.png'),
    'assetPath': 'assets/images/reset_successful.png',
  };

  static const noOrder = {
    'assetImage': AssetImage('assets/images/no_orders.png'),
    'assetPath': 'assets/images/no_orders.png',
  };

  static const graph = {
    'assetImage': AssetImage('assets/images/graph.png'),
    'assetPath': 'assets/images/graph.png',
  };

  static const profileBackground = {
    'assetImage': AssetImage('assets/images/profile_background.png'),
    'assetPath': 'assets/images/profile_background.png',
  };

  static const redLentils = {
    'assetImage': AssetImage('assets/images/red_lentils.png'),
    'assetPath': 'assets/images/red_lentils.png',
  };
}
