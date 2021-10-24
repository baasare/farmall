import 'package:farmall/routes/router.dart' as router;
import 'package:farmall/routes/routes.dart';
import 'package:farmall/utils/app_config.dart';
import 'package:farmall/utils/theme.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  // bind all files to the app before the app starts. enables environment
  // variables to be bounded to app before the app starts
  WidgetsFlutterBinding.ensureInitialized();

  // load the environment variables
  // await FlutterConfig.loadEnvVariables();

  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // app name
      title: AppConfig.appName,

      // app theme
      theme: AppTheme.primaryTheme,

      // disable test banner
      debugShowCheckedModeBanner: false,

      //make flutter aware of app routes using router generator in router.dart file
      onGenerateRoute: router.generateRoute,

      initialRoute: rootViewRoute,
    );
  }
}
