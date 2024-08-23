import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final email = TextEditingController();
  final emailfocus = FocusNode();

  final pword = TextEditingController();
  final pwordfocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: SafeArea(
          top: true,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                flex: 6,
                child: Container(
                  width: 100.0,
                  height: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  alignment: const AlignmentDirectional(0.0, -1.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: double.infinity,
                          constraints: const BoxConstraints(
                            maxWidth: 430.0,
                          ),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: EdgeInsets.all(24.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Welcome to EatUp',
                                    style: GoogleFonts.outfit(
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .headlineLarge,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 12.0, 0.0, 24.0),
                                    child: Text(
                                      'Login below or create a new Eatup Account',
                                      style: GoogleFonts.readexPro(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .titleSmall,
                                        letterSpacing: 0.0,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 16.0),
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      style: ButtonStyle(
                                        fixedSize:
                                            WidgetStateProperty.all<Size>(
                                          Size(double.infinity, 44.0),
                                        ),
                                        backgroundColor:
                                            WidgetStateProperty.all<Color>(
                                          Color(0xFFE10E0E),
                                        ),
                                        shape: WidgetStatePropertyAll(
                                          RoundedRectangleBorder(
                                            side: BorderSide(width: 2.0),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                        ),
                                      ),
                                      child: Text(
                                        'Register on Eatup',
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
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 16.0),
                                    child: ElevatedButton.icon(
                                      onPressed: () {},
                                      label: Text(
                                        'Continue with Google',
                                      ),
                                      icon: FaIcon(
                                        FontAwesomeIcons.google,
                                        color: Color(0xFFE10E0E),
                                        size: 20.0,
                                      ),
                                      style: ButtonStyle(
                                        fixedSize:
                                            WidgetStateProperty.all<Size>(
                                          Size(double.infinity, 44.0),
                                        ),
                                        backgroundColor:
                                            WidgetStateProperty.all<Color>(
                                          Colors.white,
                                        ),
                                        shape: WidgetStatePropertyAll(
                                          RoundedRectangleBorder(
                                            side: BorderSide(width: 2.0),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 24.0),
                                    child: Container(
                                      width: 370.0,
                                      child: Stack(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 12.0, 0.0, 12.0),
                                              child: Container(
                                                width: double.infinity,
                                                height: 2.0,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Container(
                                              width: 150.0,
                                              height: 32.0,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                              ),
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Text(
                                                'Or continue with',
                                                style: GoogleFonts.readexPro(
                                                  textStyle: Theme.of(context)
                                                      .textTheme
                                                      .labelMedium,
                                                  letterSpacing: 0.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 16.0),
                                    child: Container(
                                      width: double.infinity,
                                      child: TextFormField(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
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
