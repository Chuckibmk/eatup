import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
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
      body: SafeArea(
        top: true,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              height: MediaQuery.sizeOf(context).height * 1.0,
              decoration: BoxDecoration(color: Colors.white),
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Container(
                  width: 100.0,
                  height: 100.0,
                  decoration: BoxDecoration(color: Colors.white),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(-1.0, 0.0),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 0.2,
                              height: MediaQuery.sizeOf(context).width * 0.2,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Image.asset(
                                'assets/images/account_circle_24dp_E8EAED_FILL0_wght400_GRAD0_opsz24.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(1.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 50.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Tobenna',
                                    style: GoogleFonts.readexPro(
                                      fontSize: 14,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'Bsar@gmail.com',
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
                                        'ID: urvb-iwbfi-9283....',
                                        style: GoogleFonts.readexPro(
                                          fontSize: 14,
                                          letterSpacing: 0.0,
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, 1.0),
                                        child: IconButton(
                                          style: ButtonStyle(
                                            shape: WidgetStateProperty.all<
                                                RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                side: const BorderSide(
                                                    width: 1.0,
                                                    color: Colors.transparent),
                                              ),
                                            ),
                                            backgroundColor:
                                                WidgetStateProperty.all<Color>(
                                              const Color(0xECF2B8B8),
                                            ),
                                            fixedSize: WidgetStateProperty
                                                .all<Size>(Size.square(
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.06)),
                                          ),
                                          onPressed: () async {
                                            // Navigator.pop(context);
                                          },
                                          icon: const Icon(
                                            Icons.content_copy,
                                            color: Color(0xFFE10E0E),
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
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Text(
                              'Edit',
                              style: GoogleFonts.readexPro(
                                fontSize: 14,
                                color: Color(0xFFE10E0E),
                                letterSpacing: 0.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        thickness: 1.0,
                        color: Color(0XFF57636c),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(9.0),
                              child: IconButton(
                                style: ButtonStyle(
                                  shape: WidgetStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0),
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
                                icon: FaIcon(
                                  FontAwesomeIcons.locationDot,
                                  color: Color(0xFFE10E0E),
                                  size: 15,
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.sizeOf(context).width * 0.68,
                              decoration: BoxDecoration(),
                              child: Text(
                                'Addresses',
                                style: GoogleFonts.readexPro(
                                  fontSize: 14,
                                  letterSpacing: 0.0,
                                ),
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios_sharp,
                              color: Color(0xFFE10E0E),
                              size: 24.0,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(9.0),
                              child: IconButton(
                                style: ButtonStyle(
                                  shape: WidgetStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0),
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
                                icon: Icon(
                                  Icons.shopping_cart,
                                  color: Color(0xFFE10E0E),
                                  size: 15,
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.sizeOf(context).width * 0.68,
                              decoration: BoxDecoration(),
                              child: Text(
                                'Orders',
                                style: GoogleFonts.readexPro(
                                  fontSize: 14,
                                  letterSpacing: 0.0,
                                ),
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios_sharp,
                              color: Color(0xFFE10E0E),
                              size: 24.0,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(9.0),
                              child: IconButton(
                                style: ButtonStyle(
                                  shape: WidgetStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0),
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
                                icon: FaIcon(
                                  FontAwesomeIcons.solidPaperPlane,
                                  color: Color(0xFFE10E0E),
                                  size: 15,
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.sizeOf(context).width * 0.68,
                              decoration: BoxDecoration(),
                              child: Text(
                                'Referrals',
                                style: GoogleFonts.readexPro(
                                  fontSize: 14,
                                  letterSpacing: 0.0,
                                ),
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios_sharp,
                              color: Color(0xFFE10E0E),
                              size: 24.0,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(9.0),
                              child: IconButton(
                                style: ButtonStyle(
                                  shape: WidgetStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0),
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
                                icon: Icon(
                                  Icons.sticky_note_2,
                                  color: Color(0xFFE10E0E),
                                  size: 15,
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.sizeOf(context).width * 0.68,
                              decoration: BoxDecoration(),
                              child: Text(
                                'Coupons',
                                style: GoogleFonts.readexPro(
                                  fontSize: 14,
                                  letterSpacing: 0.0,
                                ),
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios_sharp,
                              color: Color(0xFFE10E0E),
                              size: 24.0,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(9.0),
                              child: IconButton(
                                style: ButtonStyle(
                                  shape: WidgetStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0),
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
                                icon: Icon(
                                  Icons.person_add_alt_sharp,
                                  color: Color(0xFFE10E0E),
                                  size: 15,
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.sizeOf(context).width * 0.68,
                              decoration: BoxDecoration(),
                              child: Text(
                                'Invites',
                                style: GoogleFonts.readexPro(
                                  fontSize: 14,
                                  letterSpacing: 0.0,
                                ),
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios_sharp,
                              color: Color(0xFFE10E0E),
                              size: 24.0,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(9.0),
                              child: IconButton(
                                style: ButtonStyle(
                                  shape: WidgetStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0),
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
                                icon: Icon(
                                  Icons.vpn_key,
                                  color: Color(0xFFE10E0E),
                                  size: 15,
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.sizeOf(context).width * 0.68,
                              decoration: BoxDecoration(),
                              child: Text(
                                'Change Password',
                                style: GoogleFonts.readexPro(
                                  fontSize: 14,
                                  letterSpacing: 0.0,
                                ),
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios_sharp,
                              color: Color(0xFFE10E0E),
                              size: 24.0,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(9.0),
                              child: IconButton(
                                style: ButtonStyle(
                                  shape: WidgetStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0),
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
                                icon: Icon(
                                  Icons.delete_forever,
                                  color: Color(0xFFE10E0E),
                                  size: 15,
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.sizeOf(context).width * 0.68,
                              decoration: BoxDecoration(),
                              child: Text(
                                'Delete Forever',
                                style: GoogleFonts.readexPro(
                                  fontSize: 14,
                                  letterSpacing: 0.0,
                                ),
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios_sharp,
                              color: Color(0xFFE10E0E),
                              size: 24.0,
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, 1.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
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
    );
  }
}