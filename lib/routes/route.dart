import 'package:eatup/screens/account/adAdress.dart';
import 'package:eatup/screens/account/address.dart';
import 'package:eatup/screens/account/changepassword.dart';
import 'package:eatup/screens/account/editprofile.dart';
import 'package:eatup/screens/account/kyc.dart';
import 'package:eatup/screens/account/login.dart';
import 'package:eatup/screens/account/forgotpassword.dart';
import 'package:eatup/screens/account/notifications.dart';
import 'package:eatup/screens/account/payments.dart';
import 'package:eatup/screens/account/profile.dart';
import 'package:eatup/screens/account/register.dart';
import 'package:eatup/screens/dashboard/cart.dart';
import 'package:eatup/screens/dashboard/dashboard.dart';
import 'package:eatup/screens/dashboard/help.dart';
import 'package:eatup/screens/dashboard/home.dart';
import 'package:eatup/screens/dashboard/item.dart';
import 'package:eatup/screens/dashboard/product.dart';
import 'package:eatup/screens/dashboard/settings.dart';
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
    name: resetp,
    page: () => const ResetP(),
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
  GetPage(
    name: kyc,
    page: () => const KYC(),
    transition: Transition.cupertino,
  ),
  GetPage(
    name: notify,
    page: () => const Notify(),
    transition: Transition.cupertino,
  ),
  GetPage(
    name: payments,
    page: () => const Payments(),
    transition: Transition.cupertino,
  ),
  GetPage(
    name: profile,
    page: () => const Profile(),
    transition: Transition.cupertino,
  ),
  GetPage(
    name: settings,
    page: () => const Settings(),
    transition: Transition.cupertino,
  ),
  GetPage(
    name: edit,
    page: () => const Editprofile(),
    transition: Transition.cupertino,
  ),
  GetPage(
    name: adadd,
    page: () => const AdAdd(),
    transition: Transition.cupertino,
  ),
  GetPage(
    name: changep,
    page: () => const ChangeP(),
    transition: Transition.cupertino,
  ),
  GetPage(
    name: address,
    page: () => const Address(),
    transition: Transition.cupertino,
  ),
  GetPage(
    name: item,
    page: () => Items(),
    transition: Transition.cupertino,
  ),
];
