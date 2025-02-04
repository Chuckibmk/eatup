import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:eatup/routes/route_names.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';

class Address extends StatefulWidget {
  const Address({super.key});

  @override
  State<Address> createState() => _AddressState();
}

class _AddressState extends State<Address> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final firebaseAuth = FirebaseAuth.instance;
  final firebaseFirestore = FirebaseFirestore.instance;
  User? user;

  List<Map<String, dynamic>> addresses = [];

  void fetchaddress() async {
    try {
      // Fetch the 'address' document (which should contain a list of uqid values)
      DocumentSnapshot<Map<String, dynamic>> addressDoc =
          await firebaseFirestore
              .collection('users')
              .doc(user?.uid)
              .collection('userInfo')
              .doc('address')
              .get();

      if (addressDoc.exists) {
        // Retrieve stored list of uqid subcollection names
        List<dynamic>? uqidList = addressDoc.data()?['uqidList'];

        if (uqidList != null) {
          List<Map<String, dynamic>> fetchedAddresses = [];
          for (String uqid in uqidList) {
            // Query all documents in each uqid subcollection
            QuerySnapshot<Map<String, dynamic>> querySnapshot =
                await FirebaseFirestore.instance
                    .collection('users')
                    .doc(user?.uid)
                    .collection('userInfo')
                    .doc('address')
                    .collection(uqid)
                    .get();
            for (var doc in querySnapshot.docs) {
              fetchedAddresses.add(doc.data());
            }
          }
          // Update state after data is fetched
          setState(() {
            addresses = fetchedAddresses;
          });
        }
      }
    } catch (e) {
      print("Error fetching addresses: $e");
    }
  }

  // void fetchaddress() async {
  //   try {
  //     if (user == null) {
  //       print("User not logged in");
  //       return;
  //     }

  //     print("Fetching addresses for user: ${user!.uid}");

  //     // Fetch the 'address' document
  //     DocumentSnapshot<Map<String, dynamic>> addressDoc =
  //         await firebaseFirestore
  //             .collection('users')
  //             .doc(user!.uid)
  //             .collection('userInfo')
  //             .doc('address')
  //             .get();

  //     if (!addressDoc.exists) {
  //       print("No address document found!");
  //       return;
  //     }

  //     // Retrieve stored list of uqid subcollection names
  //     List<dynamic>? uqidList = addressDoc.data()?['uqidList'];
  //     print("uqidList found: $uqidList");

  //     if (uqidList == null || uqidList.isEmpty) {
  //       print("No uqid subcollections found!");
  //       return;
  //     }

  //     List<Map<String, dynamic>> tempAddresses = [];

  //     for (String uqid in uqidList) {
  //       print("Fetching addresses from subcollection: $uqid");

  //       // Query all documents in each uqid subcollection
  //       QuerySnapshot<Map<String, dynamic>> querySnapshot =
  //           await firebaseFirestore
  //               .collection('users')
  //               .doc(user!.uid)
  //               .collection('userInfo')
  //               .doc('address')
  //               .collection(uqid)
  //               .get();

  //       for (var doc in querySnapshot.docs) {
  //         print("Fetched document: ${doc.data()}");
  //         tempAddresses.add(doc.data());
  //       }
  //     }

  //     // Update the state to reflect fetched data
  //     setState(() {
  //       addresses = tempAddresses;
  //     });

  //     print("Total addresses fetched: ${addresses.length}");
  //   } catch (e) {
  //     print("Error fetching addresses: $e");
  //   }
  // }

  @override
  void initState() {
    super.initState();
    user = firebaseAuth.currentUser;

    if (user != null) {
      fetchaddress();
    } else {
      // Listen for user sign-in state changes
      firebaseAuth.authStateChanges().listen((User? newUser) {
        if (newUser != null) {
          setState(() {
            user = newUser;
          });
          fetchaddress();
        }
      });
    }
  }

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
                              ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: addresses.length,
                                  itemBuilder: (context, index) {
                                    var ad = addresses[index];
                                    return Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Column(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              Get.toNamed(adadd, arguments: {
                                                "AdUID": ad['uniqueID']
                                              });
                                            },
                                            child: Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  1.0,
                                              height: 71.0,
                                              decoration: const BoxDecoration(
                                                color: Colors.white,
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.68,
                                                    height: MediaQuery.sizeOf(
                                                                context)
                                                            .height *
                                                        1.0,
                                                    decoration:
                                                        const BoxDecoration(),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              const AlignmentDirectional(
                                                                  -1.0, 0.0),
                                                          child: Text(
                                                            ad['RecipientName'],
                                                            // '',
                                                            style: GoogleFonts
                                                                .readexPro(
                                                              fontSize: 16,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment:
                                                              const AlignmentDirectional(
                                                                  -1.0, 0.0),
                                                          child: Text(
                                                            ad['street'],
                                                            // '',
                                                            style: GoogleFonts
                                                                .readexPro(
                                                              fontSize: 12,
                                                              letterSpacing:
                                                                  0.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  const Icon(
                                                    Icons
                                                        .arrow_forward_ios_sharp,
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
                                        ],
                                      ),
                                    );
                                  }),

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
                                      backgroundColor:
                                          const WidgetStatePropertyAll(
                                              Color(0xFFE10E0E)),
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
