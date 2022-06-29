import 'package:flutter/material.dart';
import 'package:myaccount/pages/forgot.dart';
import 'package:myaccount/pages/home.dart';
import 'package:myaccount/pages/login.dart';
import 'package:myaccount/pages/profile.dart';
import 'package:myaccount/pages/register.dart';
import 'package:myaccount/pages/settings.dart';
import 'package:myaccount/pages/splash_screen.dart';

class Routes {
  /// Global routes
  static const String splashScreen = '/';
  static const String profile = '/profile';
  static const String login = '/login';
  static const String register = '/register';
  static const String forgot = '/forgot';
  static const String settings = '/settings';
  static const String logout = '/logout';
  static const String home = '/home';

  static Map<String, WidgetBuilder> all = {
    Routes.login: (context) => const Login(),
    Routes.home: (context) => const Home(),
    Routes.splashScreen: (context) => const SplashScreen(),
    Routes.profile: (context) => const Profile(),
    Routes.settings: (context) => const Settings(),
    Routes.register: (context) => const Register(),
    Routes.forgot: (context) => const Forgot()
  };

  static Map<String, WidgetBuilder> bottomMenu = {
    Routes.home: (context) => const Home(),
    Routes.profile: (context) => const Profile(),
    Routes.settings: (context) => const Settings()
  };
}
