import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          leading: Padding(
            padding: const EdgeInsets.all(9.0),
            child: IconButton(
              style: ButtonStyle(
                shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    side:
                        const BorderSide(width: 1.0, color: Colors.transparent),
                  ),
                ),
                backgroundColor: WidgetStateProperty.all<Color>(
                  const Color(0x6EE10E0E),
                ),
                fixedSize:
                    WidgetStateProperty.all<Size>(const Size.square(60.0)),
              ),
              onPressed: () async {
                // context.pop();
              },
              icon: const Icon(
                Icons.chevron_left,
                color: Color(0xFFE10E0E),
                size: 25,
              ),
            ),
          ),
          title: const Text(
            'Cart',
            style: TextStyle(
              fontFamily: 'Outfit',
              color: Color(0xFFE10E0E),
              fontSize: 22.0,
              letterSpacing: 0.0,
            ),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: double.infinity,
                // width: 396.0,
                height: 416.0,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(
                      18.0, 10.0, 18.0, 10.0),
                  child: Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    color: Colors.white,
                    elevation: 4.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const Align(
                          alignment: AlignmentDirectional(-1.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 20.0, 0.0, 0.0),
                            child: Text(
                              'Product Summary',
                              style: TextStyle(
                                fontFamily: 'Readex Pro',
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.0,
                                fontSize: 23,
                              ),
                            ),
                          ),
                        ),
                        const Divider(
                          thickness: 1.0,
                          indent: 10.0,
                          endIndent: 10.0,
                          color: Color(0xCCABA5A5),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 0.0, 0.0),
                              child: IconButton(
                                style: ButtonStyle(
                                  shape: WidgetStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      side: const BorderSide(
                                          width: 1.0,
                                          color: Colors.transparent),
                                    ),
                                  ),
                                  fixedSize: WidgetStateProperty.all<Size>(
                                      const Size.square(36.0)),
                                ),
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.edit,
                                  color: Color(0xFFE10E0E),
                                  size: 15.0,
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 0.0, 0.0),
                              child: Text(
                                'Fried Yam',
                                style: TextStyle(
                                  fontFamily: 'Readex Pro',
                                  letterSpacing: 0.0,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Align(
                                alignment: const AlignmentDirectional(1.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 10.0, 0.0),
                                  child: IconButton(
                                    style: ButtonStyle(
                                      shape: WidgetStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          side: const BorderSide(
                                              width: 1.0,
                                              color: Colors.transparent),
                                        ),
                                      ),
                                      fixedSize: WidgetStateProperty.all<Size>(
                                          const Size.square(30.0)),
                                    ),
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.delete_sharp,
                                      color: Color(0xFFE10E0E),
                                      size: 15.0,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  50.0, 0.0, 0.0, 0.0),
                              child: RichText(
                                textScaler: MediaQuery.of(context).textScaler,
                                text: const TextSpan(
                                  children: [
                                    TextSpan(
                                      text: '1x',
                                      style: TextStyle(
                                        fontFamily: 'Readex Pro',
                                        color: Color.fromARGB(255, 90, 90, 90),
                                        fontSize: 15.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'Fried Egg',
                                      style: TextStyle(),
                                    )
                                  ],
                                  style: TextStyle(
                                    fontFamily: 'Readex Pro',
                                    color: Color.fromARGB(255, 54, 54, 54),
                                    fontSize: 15.0,
                                    letterSpacing: 0.0,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  50.0, 0.0, 0.0, 0.0),
                              child: RichText(
                                textScaler: MediaQuery.of(context).textScaler,
                                text: const TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'NGN',
                                      style: TextStyle(
                                        fontFamily: 'Readex Pro',
                                        color: Color.fromARGB(255, 90, 90, 90),
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    TextSpan(
                                      text: '6000',
                                      style: TextStyle(),
                                    ),
                                  ],
                                  style: TextStyle(
                                    fontFamily: 'Readex Pro',
                                    color: Color.fromARGB(255, 90, 90, 90),
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Align(
                                alignment: AlignmentDirectional(1.0, 0.0),
                                child: Container(
                                  width: 100.0,
                                  height: 25.0,
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(8.0),
                                    shape: BoxShape.rectangle,
                                    border: Border.all(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  // child: ,
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
