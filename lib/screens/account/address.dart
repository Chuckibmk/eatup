import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:eatup/routes/route_names.dart';
import 'package:eatup/widgets/widg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:uuid/uuid.dart';

class Address extends StatefulWidget {
  const Address({super.key});

  @override
  State<Address> createState() => _AddressState();
}

class _AddressState extends State<Address> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final firebaseAuth = FirebaseAuth.instance;
  final firebaseFirestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
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
                  side: const BorderSide(width: 1.0, color: Colors.transparent),
                ),
              ),
              backgroundColor: WidgetStateProperty.all<Color>(
                const Color(0xECF2B8B8),
              ),
              fixedSize: WidgetStateProperty.all<Size>(const Size.square(60.0)),
            ),
            onPressed: () async {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.chevron_left,
              color: Color(0xFFE10E0E),
              size: 25,
            ),
          ),
        ),
        title: Text(
          'My Addresses',
          style: GoogleFonts.readexPro(
            textStyle: Theme.of(context).textTheme.headlineMedium,
            color: const Color(0xFFE10E0E),
            fontSize: 22.0,
            letterSpacing: 0.0,
          ),
        ),
        actions: const [],
        centerTitle: false,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                // height: MediaQuery.sizeOf(context).height * 1.0,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      // height: MediaQuery.sizeOf(context).height * 1.0,
                      decoration: const BoxDecoration(color: Colors.white),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          decoration: const BoxDecoration(),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height: 71.0,
                                  decoration:
                                      const BoxDecoration(color: Colors.white),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.68,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                1.0,
                                        decoration: const BoxDecoration(),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Align(
                                              alignment:
                                                  const AlignmentDirectional(
                                                      -1.0, 0.0),
                                              child: Text(
                                                'Privacy Policy',
                                                style: GoogleFonts.readexPro(
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment:
                                                  const AlignmentDirectional(
                                                      -1.0, 0.0),
                                              child: Text(
                                                'Learn how we manage your data',
                                                style: GoogleFonts.readexPro(
                                                  letterSpacing: 0.0,
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Icon(
                                        Icons.arrow_forward_ios_sharp,
                                        color: Color(0xFFE10E0E),
                                        size: 24.0,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const Divider(
                                thickness: 1.0,
                                color: Color(0XFF57636c),
                              ),

                              // button
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 30.0, 0.0, 20.0),
                                child: SizedBox(
                                  width: 370.0,
                                  height: 60.0,
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                      shape: WidgetStatePropertyAll(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                      ),
                                      elevation:
                                          const WidgetStatePropertyAll(3.0),
                                      backgroundColor: WidgetStatePropertyAll(
                                          const Color(0xFFE10E0E)),
                                    ),
                                    onPressed: () async {
                                      Get.toNamed(adadd);
                                    },
                                    child: Text(
                                      'Add New Address',
                                      style: GoogleFonts.readexPro(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .titleSmall,
                                        color: Colors.white,
                                        letterSpacing: 0.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
