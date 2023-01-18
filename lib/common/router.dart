import 'package:flutter/material.dart';
import 'package:kawir/screens/home/homepage.dart';
import 'package:kawir/screens/signInUp/signin.dart';
import 'package:kawir/screens/signInUp/signup.dart';

import '../screens/splashscreen.dart';

class RouterHandler {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case '/signin':
        return MaterialPageRoute(builder: (_) => SignInPage());
      case '/signup':
        return MaterialPageRoute(builder: (_) => SignUpPage());
      // case '/home':
      // return MaterialPageRoute(builder: (_) => HomePage(user:,));

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
