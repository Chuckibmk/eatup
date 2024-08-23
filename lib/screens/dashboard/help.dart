import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class Help extends StatefulWidget {
  const Help({super.key});

  @override
  State<Help> createState() => _HelpState();
}

class _HelpState extends State<Help> {
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
            padding: const EdgeInsets.all(9),
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
              onPressed: () {},
              icon: const Icon(
                Icons.chevron_left,
                color: Color(0xFFE10E0E),
                size: 25.0,
              ),
            ),
          ),
          title: Text(
            'Help',
            style: GoogleFonts.readexPro(
              textStyle: Theme.of(context).textTheme.headlineMedium,
              color: const Color(0xFFE10E0E),
              fontSize: 22.0,
              letterSpacing: 0.0,
            ),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 1.0,
        ),
        body: SafeArea(
          top: true,
          child: Container(
            width: 421.0,
            height: 769.0,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          10.0, 20.0, 0.0, 20.0),
                      child: Text(
                        'Hello, how can EatUp help you today?',
                        style: GoogleFonts.readexPro(
                          textStyle: Theme.of(context).textTheme.bodyMedium,
                          letterSpacing: 0.0,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const Icon(
                        Icons.headset_mic,
                        color: Color(0xFFE10E0E),
                        size: 30.0,
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 0.0, 0.0),
                        child: Text(
                          'Customer Service',
                          style: GoogleFonts.readexPro(
                            textStyle: Theme.of(context).textTheme.bodyMedium,
                            letterSpacing: 0.0,
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const FaIcon(
                        FontAwesomeIcons.whatsapp,
                        color: Color(0xFFE10E0E),
                        size: 30.0,
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 0.0, 0.0),
                        child: Text(
                          'Whatsapp',
                          style: GoogleFonts.readexPro(
                            textStyle: Theme.of(context).textTheme.bodyMedium,
                            letterSpacing: 0.0,
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const Icon(
                        Icons.facebook,
                        color: Color(0xFFE10E0E),
                        size: 30.0,
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 0.0, 0.0),
                        child: Text(
                          'Facebook',
                          style: GoogleFonts.readexPro(
                            textStyle: Theme.of(context).textTheme.bodyMedium,
                            letterSpacing: 0.0,
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const FaIcon(
                        FontAwesomeIcons.twitter,
                        color: Color(0xFFE10E0E),
                        size: 30.0,
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 0.0, 0.0),
                        child: Text(
                          'Twitter',
                          style: GoogleFonts.readexPro(
                            textStyle: Theme.of(context).textTheme.bodyMedium,
                            letterSpacing: 0.0,
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const FaIcon(
                        FontAwesomeIcons.instagram,
                        color: Color(0xFFE10E0E),
                        size: 30.0,
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 0.0, 0.0),
                        child: Text(
                          'Instagram',
                          style: GoogleFonts.readexPro(
                            textStyle: Theme.of(context).textTheme.bodyMedium,
                            letterSpacing: 0.0,
                            fontSize: 17,
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
                        0.0, 110.0, 0.0, 0.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'assets/images/eatup.png',
                        width: 300.0,
                        height: 100.0,
                        fit: BoxFit.none,
                      ),
                    ),
                  ),
                ),
                Text(
                  'Version 1.0.1',
                  style: GoogleFonts.readexPro(
                    textStyle: Theme.of(context).textTheme.bodyMedium,
                    fontSize: 14.0,
                    letterSpacing: 0.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
