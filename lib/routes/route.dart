import 'package:eatup/screens/splash/splash.dart';
import 'package:get/route_manager.dart';
import 'route_names.dart';

List<GetPage> getPage = [
  GetPage(
      name: splash,
      page: () => const SplashScreen(),
      transition: Transition.cupertino),
];
