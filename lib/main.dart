import 'package:eatup/routes/route.dart';
import 'package:eatup/routes/route_names.dart';
import 'package:eatup/widgets/mycontroller.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:flutter/material.dart';
// import 'package:get/route_manager.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
// import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // Activate Firebase App Check
  await FirebaseAppCheck.instance.activate(
    androidProvider: AndroidProvider.playIntegrity, // For Android
    // iosProvider: IOSProvider.deviceCheck, // For iOS
  );

  await dotenv.load(fileName: ".env"); // Load the .env file

  Get.put(CartController(), permanent: true);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'EatUp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: dashboard,
      getPages: getPage,
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

/// next tasks:
// - Implemented buttons for checking out as a guest and logging in.
/// save cart to db...
