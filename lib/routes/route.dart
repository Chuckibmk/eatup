import 'package:eatup/screens/dashboard/dashboard.dart';
import 'package:eatup/screens/splash/splash.dart';
import 'package:get/route_manager.dart';
import 'route_names.dart';

List<GetPage> getPage = [
  GetPage(
      name: splash,
      page: () => const SplashScreen(),
      transition: Transition.cupertino),
  GetPage(
      name: dashboard,
      page: () => const Started(),
      transition: Transition.cupertino),
];
