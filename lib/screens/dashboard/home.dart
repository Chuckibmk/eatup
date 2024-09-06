import 'package:eatup/screens/account/login.dart';
import 'package:eatup/screens/dashboard/cart.dart';
import 'package:eatup/screens/dashboard/help.dart';
import 'package:eatup/screens/dashboard/product.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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
  @override
  Widget build(BuildContext context) {
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
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        0.0, 40.0, 0.0, 0.0),
                    child: GestureDetector(
                      onTap: () {
                        var route = MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        );
                        Navigator.push(context, route);
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Align(
                            alignment: Alignment(-1.0, -1.0),
                            child: IconButton(
                              onPressed: () {
                                var route = MaterialPageRoute(
                                  builder: (context) => const HomePage(),
                                );
                                Navigator.push(context, route);
                              },
                              style: ButtonStyle(
                                shape: WidgetStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                ),
                                backgroundColor: WidgetStateProperty.all<Color>(
                                  const Color(0xECF2B8B8),
                                ),
                              ),
                              icon: const Icon(
                                Icons.home_filled,
                                color: Color(0xFFE10E0E),
                                size: 25.0,
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
                                  fontSize: 20,
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
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        0.0, 20.0, 0.0, 0.0),
                    child: GestureDetector(
                      onTap: () {
                        // var route = MaterialPageRoute(
                        //   builder: (context) => HomePage(),
                        // );
                        // Navigator.push(context, route);
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(-1.0, -1.0),
                            child: IconButton(
                              onPressed: () {
                                // var route = MaterialPageRoute(
                                //   builder: (context) => const HomePage(),
                                // );
                                // Navigator.push(context, route);
                              },
                              style: ButtonStyle(
                                shape: WidgetStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                ),
                                backgroundColor: WidgetStateProperty.all<Color>(
                                  const Color(0xECF2B8B8),
                                ),
                              ),
                              icon: const Icon(
                                Icons.restaurant,
                                color: Color(0xFFE10E0E),
                                size: 25.0,
                              ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  30.0, 0.0, 0.0, 0.0),
                              child: Text(
                                'Restaurants',
                                style: GoogleFonts.readexPro(
                                  color: Colors.black87,
                                  letterSpacing: 0.0,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  textStyle:
                                      Theme.of(context).textTheme.labelLarge,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        0.0, 20.0, 0.0, 0.0),
                    child: GestureDetector(
                      onTap: () {
                        // var route = MaterialPageRoute(
                        //   builder: (context) => HomePage(),
                        // );
                        // Navigator.push(context, route);
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(-1.0, -1.0),
                            child: IconButton(
                              onPressed: () {
                                // var route = MaterialPageRoute(
                                //   builder: (context) => const HomePage(),
                                // );
                                // Navigator.push(context, route);
                              },
                              style: ButtonStyle(
                                shape: WidgetStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                ),
                                backgroundColor: WidgetStateProperty.all<Color>(
                                  const Color(0xECF2B8B8),
                                ),
                              ),
                              icon: Icon(
                                Icons.fastfood_sharp,
                                color: Color(0xFFE10E0E),
                                size: 25.0,
                              ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  30.0, 0.0, 0.0, 0.0),
                              child: Text(
                                'Food Packages',
                                style: GoogleFonts.readexPro(
                                  color: Colors.black87,
                                  letterSpacing: 0.0,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  textStyle:
                                      Theme.of(context).textTheme.labelLarge,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        0.0, 20.0, 0.0, 0.0),
                    child: GestureDetector(
                      onTap: () {
                        // var route = MaterialPageRoute(
                        //   builder: (context) => HomePage(),
                        // );
                        // Navigator.push(context, route);
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(-1.0, -1.0),
                            child: IconButton(
                              onPressed: () {
                                // var route = MaterialPageRoute(
                                //   builder: (context) => const HomePage(),
                                // );
                                // Navigator.push(context, route);
                              },
                              style: ButtonStyle(
                                shape: WidgetStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                ),
                                backgroundColor: WidgetStateProperty.all<Color>(
                                  const Color(0xECF2B8B8),
                                ),
                              ),
                              icon: const Icon(
                                Icons.store,
                                color: Color(0xFFE10E0E),
                                size: 25.0,
                              ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  30.0, 0.0, 0.0, 0.0),
                              child: Text(
                                'Stores',
                                style: GoogleFonts.readexPro(
                                  color: Colors.black87,
                                  letterSpacing: 0.0,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  textStyle:
                                      Theme.of(context).textTheme.labelLarge,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        0.0, 20.0, 0.0, 0.0),
                    child: GestureDetector(
                      onTap: () {
                        var route = MaterialPageRoute(
                          builder: (context) => const Help(),
                        );
                        Navigator.push(context, route);
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(-1.0, -1.0),
                            child: IconButton(
                              onPressed: () {
                                var route = MaterialPageRoute(
                                  builder: (context) => const Help(),
                                );
                                Navigator.push(context, route);
                              },
                              style: ButtonStyle(
                                shape: WidgetStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                ),
                                backgroundColor: WidgetStateProperty.all<Color>(
                                  const Color(0xECF2B8B8),
                                ),
                              ),
                              icon: const Icon(
                                Icons.question_mark,
                                color: Color(0xFFE10E0E),
                                size: 25.0,
                              ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  30.0, 0.0, 0.0, 0.0),
                              child: Text(
                                'Help',
                                style: GoogleFonts.readexPro(
                                  color: Colors.black87,
                                  letterSpacing: 0.0,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  textStyle:
                                      Theme.of(context).textTheme.labelLarge,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        0.0, 20.0, 0.0, 0.0),
                    child: GestureDetector(
                      onTap: () {
                        var route = MaterialPageRoute(
                          builder: (context) => const Login(),
                        );
                        Navigator.push(context, route);
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(-1.0, -1.0),
                            child: IconButton(
                              onPressed: () {
                                var route = MaterialPageRoute(
                                  builder: (context) => const Login(),
                                );
                                Navigator.push(context, route);
                              },
                              style: ButtonStyle(
                                shape: WidgetStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                ),
                                backgroundColor: WidgetStateProperty.all<Color>(
                                  const Color(0xECF2B8B8),
                                ),
                              ),
                              icon: const Icon(
                                Icons.login_rounded,
                                color: Color(0xFFE10E0E),
                                size: 25.0,
                              ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  30.0, 0.0, 0.0, 0.0),
                              child: Text(
                                'Login',
                                style: GoogleFonts.readexPro(
                                  color: Colors.black87,
                                  letterSpacing: 0.0,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  textStyle:
                                      Theme.of(context).textTheme.labelLarge,
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
          actions: [
            IconButton(
              style: ButtonStyle(
                fixedSize: WidgetStateProperty.all<Size>(const Size.square(60)),
              ),
              onPressed: () {
                var route =
                    MaterialPageRoute(builder: (context) => const Cart());
                Navigator.push(context, route);
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
                          child: PageView(
                            controller: pcont,
                            scrollDirection: Axis.horizontal,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.network(
                                    'https://images.unsplash.com/photo-1414235077428-338989a2e8c0?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw1fHxyZXN0YXVyYW50fGVufDB8fHx8MTcyMzI5MTU1OXww&ixlib=rb-4.0.3&q=80&w=1080',
                                    width: 300.0,
                                    height: 200.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.network(
                                    'https://images.unsplash.com/photo-1622192309746-ef474257518d?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw2fHxpbnZpdGV8ZW58MHx8fHwxNzIzMjkxNjYzfDA&ixlib=rb-4.0.3&q=80&w=1080',
                                    width: 300.0,
                                    height: 200.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.network(
                                    'https://images.unsplash.com/photo-1447078806655-40579c2520d6?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw3fHxmb29kfGVufDB8fHx8MTcyMzI4ODM5MXww&ixlib=rb-4.0.3&q=80&w=1080',
                                    width: 300.0,
                                    height: 200.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                          ),
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
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    var route = MaterialPageRoute(
                        builder: (context) => const Product());
                    Navigator.push(context, route);
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
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.network(
                                'https://picsum.photos/seed/137/600',
                                width: 394.0,
                                height: 197.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(-1.0, 0.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                  12.0,
                                  0.0,
                                  0.0,
                                  0.0,
                                ),
                                child: Text(
                                  'Mr Biggs',
                                  style: GoogleFonts.lora(
                                    textStyle:
                                        Theme.of(context).textTheme.titleLarge,
                                    fontSize: 30,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: const Alignment(-1.0, 0.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    12.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  'African | Rice | Soups | Pasta',
                                  style: GoogleFonts.readexPro(
                                    textStyle:
                                        Theme.of(context).textTheme.bodyMedium,
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
