import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eatup/routes/route_names.dart';
import 'package:eatup/widgets/widg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:strings/strings.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final firebaseAuth = FirebaseAuth.instance;
  final firebaseFirestore = FirebaseFirestore.instance;

  User? user;

  String? displayN;
  String? email;
  String? img;

  @override
  void initState() {
    user = firebaseAuth.currentUser;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (user != null) {
      try {
        final usr = firebaseFirestore.collection("users").doc(user?.uid);
        usr.get().then(
          (DocumentSnapshot doc) {
            final data = doc.data() as Map<String, dynamic>;
            setState(() {
              displayN = data['fname'] + " " + data['lname'];
              email = user?.email;
              img = data['DP'];
            });

            // ...
          },
          onError: (e) => print("Error getting document: $e"),
        );
      } catch (e) {
        print("Error trying : $e");
      }
    }
    return Scaffold(
      key: scaffoldKey,
      // backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
          'Profile',
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
                decoration: const BoxDecoration(color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    width: 100.0,
                    // height: 10.0,
                    decoration: const BoxDecoration(color: Colors.white),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            img != null && img!.isNotEmpty
                                ? Align(
                                    alignment:
                                        const AlignmentDirectional(-1.0, 0.0),
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.2,
                                      height: MediaQuery.sizeOf(context).width *
                                          0.2,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(img!),
                                        ),
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  )
                                : Align(
                                    alignment:
                                        const AlignmentDirectional(-1.0, 0.0),
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.2,
                                      height: MediaQuery.sizeOf(context).width *
                                          0.2,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: Image.asset(
                                        'assets/images/account_circle_24dp_E8EAED_FILL0_wght400_GRAD0_opsz24.png',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                            Align(
                              alignment: const AlignmentDirectional(1.0, 0.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 50.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      displayN ?? 'Username',
                                      style: GoogleFonts.readexPro(
                                        fontSize: 14,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      email ?? 'Email',
                                      style: GoogleFonts.readexPro(
                                        fontSize: 14,
                                        letterSpacing: 0.0,
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          'ID: ${user!.uid}'.abbreviate(20),
                                          style: GoogleFonts.readexPro(
                                            fontSize: 14,
                                            letterSpacing: 0.0,
                                          ),
                                        ),
                                        Align(
                                          alignment: const AlignmentDirectional(
                                              -1.0, 1.0),
                                          child: IconButton(
                                            style: ButtonStyle(
                                              shape: WidgetStateProperty.all<
                                                  RoundedRectangleBorder>(
                                                const RoundedRectangleBorder(
                                                  side: BorderSide(
                                                      width: 1.0,
                                                      color:
                                                          Colors.transparent),
                                                ),
                                              ),
                                              fixedSize: WidgetStateProperty
                                                  .all<Size>(Size.square(
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.06)),
                                            ),
                                            onPressed: () async {
                                              Clipboard.setData(ClipboardData(
                                                  text: user!.uid));

                                              showSuccessToast(
                                                  context: context,
                                                  message:
                                                      'Copied Successfully');
                                            },
                                            icon: const Icon(
                                              Icons.content_copy,
                                              // color: Color(0xFFE10E0E),
                                              size: 13,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.toNamed(edit);
                              },
                              child: Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: Text(
                                  'Edit',
                                  style: GoogleFonts.readexPro(
                                    fontSize: 14,
                                    color: const Color(0xFFE10E0E),
                                    letterSpacing: 0.0,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Divider(
                          thickness: 1.0,
                          color: Color(0XFF57636c),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 20.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(9.0),
                                child: IconButton(
                                  style: ButtonStyle(
                                    shape: WidgetStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        side: const BorderSide(
                                            width: 1.0,
                                            color: Colors.transparent),
                                      ),
                                    ),
                                    backgroundColor:
                                        WidgetStateProperty.all<Color>(
                                      const Color(0xECE9D2D2),
                                    ),
                                    fixedSize: WidgetStateProperty.all<Size>(
                                        const Size.square(30.0)),
                                  ),
                                  onPressed: () async {
                                    // Navigator.pop(context);
                                    Get.toNamed(adadd);
                                  },
                                  icon: const FaIcon(
                                    FontAwesomeIcons.locationDot,
                                    color: Color(0xFFE10E0E),
                                    size: 15,
                                  ),
                                ),
                              ),
                              Container(
                                width: MediaQuery.sizeOf(context).width * 0.68,
                                decoration: const BoxDecoration(),
                                child: Text(
                                  'Addresses',
                                  style: GoogleFonts.readexPro(
                                    fontSize: 14,
                                    letterSpacing: 0.0,
                                  ),
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
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 20.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(9.0),
                                child: IconButton(
                                  style: ButtonStyle(
                                    shape: WidgetStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        side: const BorderSide(
                                            width: 1.0,
                                            color: Colors.transparent),
                                      ),
                                    ),
                                    backgroundColor:
                                        WidgetStateProperty.all<Color>(
                                      const Color(0xECE9D2D2),
                                    ),
                                    fixedSize: WidgetStateProperty.all<Size>(
                                        const Size.square(30.0)),
                                  ),
                                  onPressed: () async {
                                    // Navigator.pop(context);
                                  },
                                  icon: const Icon(
                                    Icons.shopping_cart,
                                    color: Color(0xFFE10E0E),
                                    size: 15,
                                  ),
                                ),
                              ),
                              Container(
                                width: MediaQuery.sizeOf(context).width * 0.68,
                                decoration: const BoxDecoration(),
                                child: Text(
                                  'Orders',
                                  style: GoogleFonts.readexPro(
                                    fontSize: 14,
                                    letterSpacing: 0.0,
                                  ),
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
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 20.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(9.0),
                                child: IconButton(
                                  style: ButtonStyle(
                                    shape: WidgetStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        side: const BorderSide(
                                            width: 1.0,
                                            color: Colors.transparent),
                                      ),
                                    ),
                                    backgroundColor:
                                        WidgetStateProperty.all<Color>(
                                      const Color(0xECE9D2D2),
                                    ),
                                    fixedSize: WidgetStateProperty.all<Size>(
                                        const Size.square(30.0)),
                                  ),
                                  onPressed: () async {
                                    // Navigator.pop(context);
                                  },
                                  icon: const FaIcon(
                                    FontAwesomeIcons.solidPaperPlane,
                                    color: Color(0xFFE10E0E),
                                    size: 15,
                                  ),
                                ),
                              ),
                              Container(
                                width: MediaQuery.sizeOf(context).width * 0.68,
                                decoration: const BoxDecoration(),
                                child: Text(
                                  'Referrals',
                                  style: GoogleFonts.readexPro(
                                    fontSize: 14,
                                    letterSpacing: 0.0,
                                  ),
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
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 20.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(9.0),
                                child: IconButton(
                                  style: ButtonStyle(
                                    shape: WidgetStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        side: const BorderSide(
                                            width: 1.0,
                                            color: Colors.transparent),
                                      ),
                                    ),
                                    backgroundColor:
                                        WidgetStateProperty.all<Color>(
                                      const Color(0xECE9D2D2),
                                    ),
                                    fixedSize: WidgetStateProperty.all<Size>(
                                        const Size.square(30.0)),
                                  ),
                                  onPressed: () async {
                                    // Navigator.pop(context);
                                  },
                                  icon: const Icon(
                                    Icons.sticky_note_2,
                                    color: Color(0xFFE10E0E),
                                    size: 15,
                                  ),
                                ),
                              ),
                              Container(
                                width: MediaQuery.sizeOf(context).width * 0.68,
                                decoration: const BoxDecoration(),
                                child: Text(
                                  'Coupons',
                                  style: GoogleFonts.readexPro(
                                    fontSize: 14,
                                    letterSpacing: 0.0,
                                  ),
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
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 20.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(9.0),
                                child: IconButton(
                                  style: ButtonStyle(
                                    shape: WidgetStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        side: const BorderSide(
                                            width: 1.0,
                                            color: Colors.transparent),
                                      ),
                                    ),
                                    backgroundColor:
                                        WidgetStateProperty.all<Color>(
                                      const Color(0xECE9D2D2),
                                    ),
                                    fixedSize: WidgetStateProperty.all<Size>(
                                        const Size.square(30.0)),
                                  ),
                                  onPressed: () async {
                                    // Navigator.pop(context);
                                  },
                                  icon: const Icon(
                                    Icons.person_add_alt_sharp,
                                    color: Color(0xFFE10E0E),
                                    size: 15,
                                  ),
                                ),
                              ),
                              Container(
                                width: MediaQuery.sizeOf(context).width * 0.68,
                                decoration: const BoxDecoration(),
                                child: Text(
                                  'Invites',
                                  style: GoogleFonts.readexPro(
                                    fontSize: 14,
                                    letterSpacing: 0.0,
                                  ),
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
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 20.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(9.0),
                                child: IconButton(
                                  style: ButtonStyle(
                                    shape: WidgetStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        side: const BorderSide(
                                            width: 1.0,
                                            color: Colors.transparent),
                                      ),
                                    ),
                                    backgroundColor:
                                        WidgetStateProperty.all<Color>(
                                      const Color(0xECE9D2D2),
                                    ),
                                    fixedSize: WidgetStateProperty.all<Size>(
                                        const Size.square(30.0)),
                                  ),
                                  onPressed: () async {
                                    // Navigator.pop(context);
                                  },
                                  icon: const Icon(
                                    Icons.vpn_key,
                                    color: Color(0xFFE10E0E),
                                    size: 15,
                                  ),
                                ),
                              ),
                              Container(
                                width: MediaQuery.sizeOf(context).width * 0.68,
                                decoration: const BoxDecoration(),
                                child: Text(
                                  'Change Password',
                                  style: GoogleFonts.readexPro(
                                    fontSize: 14,
                                    letterSpacing: 0.0,
                                  ),
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
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 20.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(9.0),
                                child: IconButton(
                                  style: ButtonStyle(
                                    shape: WidgetStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        side: const BorderSide(
                                            width: 1.0,
                                            color: Colors.transparent),
                                      ),
                                    ),
                                    backgroundColor:
                                        WidgetStateProperty.all<Color>(
                                      const Color(0xECE9D2D2),
                                    ),
                                    fixedSize: WidgetStateProperty.all<Size>(
                                        const Size.square(30.0)),
                                  ),
                                  onPressed: () async {
                                    // Navigator.pop(context);
                                    del();
                                  },
                                  icon: const Icon(
                                    Icons.delete_forever,
                                    color: Color(0xFFE10E0E),
                                    size: 15,
                                  ),
                                ),
                              ),
                              Container(
                                width: MediaQuery.sizeOf(context).width * 0.68,
                                decoration: const BoxDecoration(),
                                child: Text(
                                  'Delete Forever',
                                  style: GoogleFonts.readexPro(
                                    fontSize: 14,
                                    letterSpacing: 0.0,
                                  ),
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
                        Align(
                          alignment: const AlignmentDirectional(0.0, 1.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 110.0, 0.0, 0.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                'assets/images/eatup.png',
                                width: 300.0,
                                height: 63.0,
                                fit: BoxFit.none,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          'Version 1.0.1',
                          style: GoogleFonts.readexPro(
                            fontSize: 14.0,
                            letterSpacing: 0.0,
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
      ),
    );
  }

  Widget del() {
    return Dialog(
        child: // Generated code for this Column Widget...
            Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 20.0),
          child: Text(
            'Delete your Eatup Account?',
            style: GoogleFonts.readexPro(
              textStyle: Theme.of(context).textTheme.labelMedium,
              fontSize: 14.0,
              letterSpacing: 0.0,
            ),
          ),
        ),
        Container(
          width: 327.0,
          height: 90.0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(0.0),
            border: Border.all(
              color: Color(0xFFDF8612),
              width: 2.0,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(),
                child: FaIcon(
                  FontAwesomeIcons.triangleExclamation,
                  color: Color(0xFFDF8612),
                  size: 24.0,
                ),
              ),
              Container(
                decoration: BoxDecoration(),
                child: Text(
                  'You can\'t undo this action, your data will be removed permanently',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.readexPro(
                      textStyle: Theme.of(context).textTheme.bodyMedium,
                      fontSize: 14.0,
                      letterSpacing: 0.0,
                      color: Color(0xFFDF8612)),
                ),
              ),
            ],
          ),
        ),
        Container(
          width: 315.0,
          height: 100.0,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
            child: Text(
              'Your account bsar@gmail.com, any existing businesses, business employees and saved products will be deleted permanently',
              textAlign: TextAlign.center,
              style: GoogleFonts.readexPro(
                textStyle: Theme.of(context).textTheme.bodyMedium,
                fontSize: 14.0,
                letterSpacing: 0.0,
              ),
            ),
          ),
        ),
        Align(
          alignment: AlignmentDirectional(-1.0, 0.0),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
            child: Text(
              'First Name',
              textAlign: TextAlign.start,
              style: GoogleFonts.readexPro(
                textStyle: Theme.of(context).textTheme.bodyMedium,
                fontSize: 14.0,
                letterSpacing: 0.0,
              ),
            ),
          ),
        ),
        Align(
          alignment: AlignmentDirectional(-1.0, 0.0),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
            child: Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              child: TextFormField(
                // controller: _model.textController,
                // focusNode: _model.textFieldFocusNode,
                autofocus: false,
                obscureText: false,
                decoration: InputDecoration(
                  labelStyle: GoogleFonts.readexPro(
                    textStyle: Theme.of(context).textTheme.labelMedium,
                    fontSize: 14.0,
                    letterSpacing: 0.0,
                  ),
                  alignLabelWithHint: false,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.green,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.red,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.red,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                style: GoogleFonts.readexPro(
                  textStyle: Theme.of(context).textTheme.bodyMedium,
                  fontSize: 14.0,
                  letterSpacing: 0.0,
                ),
                // validator: _model.textControllerValidator.asValidator(context),
              ),
            ),
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 20.0),
                child: SizedBox(
                  width: 370.0,
                  height: 60.0,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                      elevation: const WidgetStatePropertyAll(3.0),
                      backgroundColor: WidgetStatePropertyAll(
                          // rname.text != '' &&
                          //         stradd.text != '' &&
                          //         details.text != '' &&
                          //         number.text != '' &&
                          //         zip.text != '' &&
                          //         gender.text != '-Select-' &&
                          //         country.text != '' &&
                          //         state.text != '' &&
                          //         city.text != ''
                          //     ? const Color(0xFFE10E0E)
                          //     :
                          Colors.grey),
                    ),
                    onPressed: () async {
                      // if (_formKey.currentState!.validate()) {
                      //   _formKey.currentState!.save();
                      //   AdAdres(
                      //     rn,
                      //     stret,
                      //     dt!,
                      //     no,
                      //     zp!,
                      //     gd,
                      //     country.text,
                      //     state.text,
                      //     city.text,
                      //   );
                      //   // upload to firebase
                      // }
                    },
                    child: Text(
                      'Submit',
                      style: GoogleFonts.readexPro(
                        textStyle: Theme.of(context).textTheme.titleSmall,
                        color: Colors.white,
                        letterSpacing: 0.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 20.0),
                child: SizedBox(
                  width: 370.0,
                  height: 60.0,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                      elevation: const WidgetStatePropertyAll(3.0),
                      backgroundColor: WidgetStatePropertyAll(
                          // rname.text != '' &&
                          //         stradd.text != '' &&
                          //         details.text != '' &&
                          //         number.text != '' &&
                          //         zip.text != '' &&
                          //         gender.text != '-Select-' &&
                          //         country.text != '' &&
                          //         state.text != '' &&
                          //         city.text != ''
                          //     ? const Color(0xFFE10E0E)
                          //     :
                          Colors.grey),
                    ),
                    onPressed: () async {
                      // if (_formKey.currentState!.validate()) {
                      //   _formKey.currentState!.save();
                      //   AdAdres(
                      //     rn,
                      //     stret,
                      //     dt!,
                      //     no,
                      //     zp!,
                      //     gd,
                      //     country.text,
                      //     state.text,
                      //     city.text,
                      //   );
                      //   //   // upload to firebase
                      // }
                    },
                    child: Text(
                      'Submit',
                      style: GoogleFonts.readexPro(
                        textStyle: Theme.of(context).textTheme.titleSmall,
                        color: Colors.white,
                        letterSpacing: 0.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    ));
  }
}
