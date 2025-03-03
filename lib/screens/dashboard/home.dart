import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eatup/db/db.dart';
import 'package:eatup/routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:eatup/widgets/widg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final cont = TextEditingController();
  final fcus = FocusNode();
  final pcont = PageController(initialPage: 0);

  final firebaseAuth = FirebaseAuth.instance;
  final firebaseFirestore = FirebaseFirestore.instance;

  User? user;

  String displayN = '';

  void saveShopsToDB(Map<String, dynamic> apiResponse) async {
    if (apiResponse.containsKey('data')) {
      List<dynamic> shops = apiResponse['data'];
      List<Map<String, dynamic>> formattedShops = shops.map((shop) {
        return {
          'id': shop['id'],
          'name': shop['name'],
          'subtitle': shop['subtitle'],
          'description': shop['description'],
          'tabs': jsonEncode(shop['tabs']),
          'image': shop['image'],
          'section': shop['section'],
          'uqid': shop['uqid'],
          'date': DateTime.now().millisecondsSinceEpoch
        };
      }).toList();

      final db = DatabaseHelper();
      await db.inserShops(formattedShops);
    }
  }

  late Future<List<Shop>> futureShops;

  Future<List<Shop>> fetchData() async {
    String jwtToken = dotenv.env['jwtToken'] ?? 'No API Key Found';
    String apiKey = dotenv.env['API_KEY'] ?? 'No API Key Found';
    String url = dotenv.env['urlShops'] ?? 'No API Key Found';

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          "X-API-KEY": apiKey, // 🔑 Add API Key in headers
          'Authorization': 'Bearer $jwtToken',
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        saveShopsToDB(data);
        print("Data received: $data");

        List<dynamic> shopsJson = data['data'];
        return shopsJson.map((json) => Shop.fromJson(json)).toList();
      } else {
        print("Error: ${response.statusCode} - ${response.body}");
        return [];
      }
    } on SocketException {
      print('Network Error: SocketException');
      return [];
    } on HttpException {
      print('Network Error: HttpException');
      return [];
    } catch (e) {
      print('Unknown Error: $e');
      return [];
    }
  }

  Future<List<Shop>> fetchShopsFromDB() async {
    final dbHelper = DatabaseHelper();
    List<Map<String, dynamic>> shops = await dbHelper.getShops();
    // return shops;
    return shops.map((json) => Shop.fromJson(json)).toList();
    // print('Saved Shops: $shops');
  }

  Future<void> logout() async {
    try {
      User? user = firebaseAuth.currentUser;
      if (user != null) {
        await firebaseAuth.signOut().timeout(const Duration(seconds: 10));
        if (mounted) {
          showSuccessToast(context: context, message: 'Logout Successful');
        }
        scaffoldKey.currentState?.closeDrawer();
      } else {
        if (mounted) {
          showWarningToast(context: context, message: 'No Account Signed In');
        }
        scaffoldKey.currentState?.closeDrawer();
      }
    } on TimeoutException {
      if (mounted) {
        showErrorToast(
            context: context, message: 'Network Issues, signout failed');
      }
    }
    setState(() {
      user = firebaseAuth.currentUser;
    });
  }

  void fetchDn() {
    try {
      final usr = firebaseFirestore.collection("users").doc(user?.uid);
      usr.get().then(
        (DocumentSnapshot doc) {
          final data = doc.data() as Map<String, dynamic>;
          setState(() {
            displayN = data['name'];
          });

          // ...
        },
        onError: (e) => print("Error getting document: $e"),
      );
    } catch (e) {
      print("Error trying : $e");
    }
  }

  @override
  void initState() {
    super.initState();
    user = firebaseAuth.currentUser;
    if (user != null) {
      fetchDn();
    }
    // Get the current user when the widget is initialized
    // futureShops = fetchData();
    futureShops = fetchShopsFromDB();
  }

  List<List<dynamic>> menu = [
    //link,icon,page name,is user restricted
    [profile, Icons.person, 'Profile', 'user'],
    [null, Icons.shopping_cart, 'Orders', 'user'],
    [payments, Icons.wallet, 'Payments', 'user'],
    [kyc, Icons.how_to_reg, 'KYC', 'user'],
    [null, Icons.restaurant, 'Restaurant', ''],
    [null, Icons.fastfood_sharp, 'Food Packages', ''],
    [null, Icons.store, 'Stores', ''],
    [help, Icons.question_mark, 'Help', ''],
    [settings, Icons.settings, 'Settings', ''],
    [notify, Icons.notification_add, 'Notifications', 'user'],
    [login, Icons.login_rounded, 'Login', 'log']
  ];

  List<List<dynamic>> filteredMenu = [];

  List<String> carousel = [
    'https://images.unsplash.com/photo-1414235077428-338989a2e8c0?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw1fHxyZXN0YXVyYW50fGVufDB8fHx8MTcyMzI5MTU1OXww&ixlib=rb-4.0.3&q=80&w=1080',
    'https://images.unsplash.com/photo-1447078806655-40579c2520d6?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw3fHxmb29kfGVufDB8fHx8MTcyMzI4ODM5MXww&ixlib=rb-4.0.3&q=80&w=1080',
    'https://images.unsplash.com/photo-1622192309746-ef474257518d?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw2fHxpbnZpdGV8ZW58MHx8fHwxNzIzMjkxNjYzfDA&ixlib=rb-4.0.3&q=80&w=1080',
  ];

  @override
  Widget build(BuildContext context) {
    if (user != null) {
      filteredMenu = menu.where((men) => men[3] != 'log').toList();
    } else {
      filteredMenu = menu.where((men) => men[3] != 'user').toList();
    }
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        drawer: Drawer(
          elevation: 16.0,
          child: Container(
            width: 100.0,
            height: 100.0,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          0.0, 5.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          if (user != null)
                            Align(
                              alignment: const Alignment(-1.0, -1.0),
                              child: Text(
                                displayN,
                                style: GoogleFonts.readexPro(
                                  color: Colors.black87,
                                  letterSpacing: 0.0,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  textStyle:
                                      Theme.of(context).textTheme.labelLarge,
                                ),
                              ),
                            )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          0.0, 40.0, 0.0, 0.0),
                      child: GestureDetector(
                        onTap: () {
                          scaffoldKey.currentState?.closeDrawer();
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Align(
                              alignment: const Alignment(-1.0, -1.0),
                              child: IconButton(
                                onPressed: () {
                                  scaffoldKey.currentState?.closeDrawer();
                                },
                                style: ButtonStyle(
                                  shape: WidgetStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                  ),
                                  backgroundColor:
                                      WidgetStateProperty.all<Color>(
                                    const Color(0xECF2B8B8),
                                  ),
                                ),
                                icon: const Icon(
                                  Icons.home_filled,
                                  color: Color(0xFFE10E0E),
                                  size: 20.0,
                                ),
                              ),
                            ),
                            Align(
                              alignment: const Alignment(0.0, 0.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    30.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  'Home',
                                  style: GoogleFonts.readexPro(
                                    color: Colors.black87,
                                    letterSpacing: 0.0,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    textStyle:
                                        Theme.of(context).textTheme.labelLarge,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),

                    // listview begin
                    ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: filteredMenu.length,
                        itemBuilder: (context, index) {
                          var mn = filteredMenu[index];
                          return Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 20.0, 0.0, 0.0),
                            child: GestureDetector(
                              onTap: () {
                                Get.toNamed(mn[0]);
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Align(
                                    alignment:
                                        const AlignmentDirectional(-1.0, -1.0),
                                    child: IconButton(
                                      onPressed: () {
                                        Get.toNamed(mn[0]);
                                      },
                                      style: ButtonStyle(
                                        shape: WidgetStateProperty.all<
                                            RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                        ),
                                        backgroundColor:
                                            WidgetStateProperty.all<Color>(
                                          const Color(0xECF2B8B8),
                                        ),
                                      ),
                                      icon: Icon(
                                        mn[1],
                                        color: Color(0xFFE10E0E),
                                        size: 20.0,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment:
                                        const AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              30.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        mn[2],
                                        style: GoogleFonts.readexPro(
                                          color: Colors.black87,
                                          letterSpacing: 0.0,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                          textStyle: Theme.of(context)
                                              .textTheme
                                              .labelLarge,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),

                    //logout
                    if (user != null)
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 20.0, 0.0, 0.0),
                        child: GestureDetector(
                          onTap: () {
                            logout();
                            setState(() {});
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Align(
                                alignment:
                                    const AlignmentDirectional(-1.0, -1.0),
                                child: IconButton(
                                  onPressed: () {
                                    logout();
                                  },
                                  style: ButtonStyle(
                                    shape: WidgetStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                    ),
                                    backgroundColor:
                                        WidgetStateProperty.all<Color>(
                                      const Color(0xECF2B8B8),
                                    ),
                                  ),
                                  icon: const Icon(
                                    Icons.logout,
                                    color: Color(0xFFE10E0E),
                                    size: 20.0,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      30.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    'Logout',
                                    style: GoogleFonts.readexPro(
                                      color: Colors.black87,
                                      letterSpacing: 0.0,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .labelLarge,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          leading: Builder(
            builder: (context) => IconButton(
              style: ButtonStyle(
                shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    side:
                        const BorderSide(width: 1.0, color: Colors.transparent),
                  ),
                ),
                fixedSize:
                    WidgetStateProperty.all<Size>(const Size.square(60.0)),
              ),
              onPressed: () {
                scaffoldKey.currentState?.openDrawer();
              },
              icon: const Icon(
                Icons.menu,
                color: Color(0xFFE10E0E),
                size: 30.0,
              ),
            ),
          ),
          title: // Generated code for this Column Widget...
              Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Enugu ',
                    style: GoogleFonts.readexPro(
                      fontSize: 14,
                      color: const Color(0xFF57636c),
                      letterSpacing: 0.0,
                    ),
                  ),
                  const Icon(
                    Icons.keyboard_arrow_down,
                    color: Color(0xFF57636c),
                    size: 24.0,
                  ),
                ],
              ),
              Text(
                'Select Your Current Location',
                style: GoogleFonts.readexPro(
                  fontSize: 14,
                  color: const Color(0xFFE10E0E),
                  letterSpacing: 0.0,
                ),
              ),
            ],
          ),
          actions: [
            IconButton(
              style: ButtonStyle(
                fixedSize: WidgetStateProperty.all<Size>(const Size.square(60)),
              ),
              onPressed: () {
                Get.toNamed(cart);
              },
              icon: const Icon(
                Icons.shopping_cart,
                color: Color(0xFFE10E0E),
                size: 30.0,
              ),
            ),
          ],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            top: true,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 401.0,
                  height: 75.0,
                  decoration: const BoxDecoration(color: Colors.white),
                  child: Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          8.0, 0.0, 8.0, 0.0),
                      child: SizedBox(
                        width: double.infinity,
                        child: TextFormField(
                          controller: cont,
                          focusNode: fcus,
                          autofocus: false,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'What are you craving?',
                            labelStyle: GoogleFonts.readexPro(
                                textStyle:
                                    Theme.of(context).textTheme.labelMedium,
                                letterSpacing: 0.0),
                            hintStyle: GoogleFonts.readexPro(
                                textStyle:
                                    Theme.of(context).textTheme.labelMedium,
                                letterSpacing: 0.0),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.grey, width: 2.0),
                              borderRadius: BorderRadius.circular(22.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color(0xFFE10E0E), width: 2.0),
                              borderRadius: BorderRadius.circular(22.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.red,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(22.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.orange,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(22.0),
                            ),
                            prefixIcon: const Icon(
                              Icons.search,
                            ),
                          ),
                          style: GoogleFonts.readexPro(
                            textStyle: Theme.of(context).textTheme.bodyMedium,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 233.0,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    height: 500.0,
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 40.0),
                          child: PageView.builder(
                              controller: pcont,
                              scrollDirection: Axis.horizontal,
                              itemCount: carousel.length,
                              itemBuilder: (context, index) {
                                var cr = carousel[index];
                                return Padding(
                                  padding: const EdgeInsets.all(18.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: CachedNetworkImage(
                                      imageUrl: cr,
                                      // 'https://images.unsplash.com/photo-1414235077428-338989a2e8c0?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw1fHxyZXN0YXVyYW50fGVufDB8fHx8MTcyMzI5MTU1OXww&ixlib=rb-4.0.3&q=80&w=1080',
                                      placeholder: (context, url) =>
                                          CircularProgressIndicator(), // Shows while loading
                                      errorWidget: (context, url, error) =>
                                          Icon(Icons
                                              .error), // Shows if loading fails
                                      width: 300.0,
                                      height: 200.0,
                                      fit: BoxFit.cover, // Adjust image scaling
                                    ),
                                  ),
                                );
                              }),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(0.0, 1.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 0.0, 16.0),
                            child: SmoothPageIndicator(
                              controller: pcont,
                              count: 3,
                              axisDirection: Axis.horizontal,
                              onDotClicked: (index) async {
                                await pcont.animateToPage(
                                  index,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.ease,
                                );
                                setState(() {});
                              },
                              effect: const ExpandingDotsEffect(
                                expansionFactor: 3.0,
                                spacing: 8.0,
                                radius: 16.0,
                                dotWidth: 16.0,
                                dotHeight: 8.0,
                                dotColor: Color(0x5CE10E0E),
                                activeDotColor: Color(0xFFE10E0E),
                                paintStyle: PaintingStyle.fill,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 212.0,
                      // width: double.infinity,
                      height: 32.0,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Align(
                        alignment: const Alignment(-1.0, 0.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 0.0, 0.0),
                          child: Text(
                            'Restuarants Near You',
                            style: GoogleFonts.lora(
                                textStyle:
                                    Theme.of(context).textTheme.bodyMedium,
                                fontSize: 20.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.normal),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 80.0,
                      // width: double.infinity / 2,
                      height: 32.0,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Align(
                        alignment: const AlignmentDirectional(1.0, 0.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 20.0, 0.0),
                          child: GestureDetector(
                            onTap: () {
                              // fetchData();
                              fetchShopsFromDB();
                            },
                            child: RichText(
                              textScaler: MediaQuery.of(context).textScaler,
                              text: TextSpan(
                                text: 'See All',
                                style: GoogleFonts.readexPro(
                                  textStyle:
                                      Theme.of(context).textTheme.bodyMedium,
                                  color: const Color(0xFFE10E0E),
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                // listview begin
                FutureBuilder<List<Shop>>(
                    future: futureShops,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return Center(child: Text('No shops available'));
                      } else {
                        final shops = snapshot.data!;
                        return ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: shops.length,
                            itemBuilder: (context, index) {
                              var sh = shops[index];
                              return GestureDetector(
                                onTap: () {
                                  Get.toNamed(product);
                                },
                                child: Container(
                                  width: double.infinity,
                                  height: 340.0,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 4.0,
                                        color: Color(0x43FFFFFF),
                                        offset: Offset(0.0, 2.0),
                                      )
                                    ],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(18.0),
                                    child: Card(
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      color: Colors.white,
                                      elevation: 4.0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: CachedNetworkImage(
                                              imageUrl:
                                                  'https://eatup.globalchainlimited.com/uploads/${sh.name}/${sh.image}',
                                              placeholder: (context, url) =>
                                                  const CircularProgressIndicator(), // Shows while loading
                                              errorWidget: (context, url,
                                                      error) =>
                                                  const Icon(Icons
                                                      .error), // Shows if loading fails
                                              width: 394.0,
                                              height: 197.0,
                                              fit: BoxFit
                                                  .cover, // Adjust image scaling
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(
                                                    -1.0, 0.0),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                12.0,
                                                0.0,
                                                0.0,
                                                0.0,
                                              ),
                                              child: Text(
                                                sh.name,
                                                style: GoogleFonts.lora(
                                                  textStyle: Theme.of(context)
                                                      .textTheme
                                                      .titleLarge,
                                                  fontSize: 30,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                const Alignment(-1.0, 0.0),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                      12.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                sh.subtitle,
                                                style: GoogleFonts.readexPro(
                                                  textStyle: Theme.of(context)
                                                      .textTheme
                                                      .bodyMedium,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            });
                      }
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
