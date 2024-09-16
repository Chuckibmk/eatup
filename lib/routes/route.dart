import 'package:eatup/screens/account/login.dart';
import 'package:eatup/screens/account/register.dart';
import 'package:eatup/screens/dashboard/cart.dart';
import 'package:eatup/screens/dashboard/dashboard.dart';
import 'package:eatup/screens/dashboard/help.dart';
import 'package:eatup/screens/dashboard/home.dart';
import 'package:eatup/screens/dashboard/product.dart';
import 'package:eatup/screens/splash/splash.dart';
import 'package:get/route_manager.dart';
import 'route_names.dart';

List<GetPage> getPage = [
  GetPage(
    name: splash,
    page: () => const SplashScreen(),
    transition: Transition.cupertino,
  ),
  GetPage(
    name: dashboard,
    page: () => const Started(),
    transition: Transition.cupertino,
  ),
  GetPage(
      name: home,
      page: () => const HomePage(),
      transition: Transition.cupertino),
  GetPage(
    name: product,
    page: () => const Product(),
    transition: Transition.cupertino,
  ),
  GetPage(
    name: login,
    page: () => const Login(),
    transition: Transition.cupertino,
  ),
  GetPage(
    name: register,
    page: () => const Register(),
    transition: Transition.cupertino,
  ),
  GetPage(
    name: help,
    page: () => const Help(),
    transition: Transition.cupertino,
  ),
  GetPage(
    name: cart,
    page: () => const Cart(),
    transition: Transition.cupertino,
  ),
];
