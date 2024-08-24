import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final namecont = TextEditingController();
  final nameFocusNode = FocusNode();

  final emailAddressTextController = TextEditingController();
  final emailAddressFocusNode = FocusNode();

  final passwordTextController = TextEditingController();
  final passwordFocusNode = FocusNode();

  final passwordConfirmTextController = TextEditingController();
  final passwordConfirmFocusNode = FocusNode();

  final referralTextController = TextEditingController();
  final referralFocusNode = FocusNode();

  late bool passwordVisibility = false;
  late bool passwordConfirmVisibility = false;

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
                flex: 8,
                child: Container(
                  width: 100.0,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  alignment: AlignmentDirectional(0.0, -1.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: EdgeInsets.all(32.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Register',
                                  style: GoogleFonts.outfit(
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .headlineSmall,
                                      letterSpacing: 0.0,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w600),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 12.0, 0.0, 24.0),
                                  child: RichText(
                                    textScaler:
                                        MediaQuery.of(context).textScaler,
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'Already have an account?',
                                          style: GoogleFonts.readexPro(
                                            color: Colors.black,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                            textStyle: Theme.of(context)
                                                .textTheme
                                                .bodyMedium,
                                          ),
                                        ),
                                        TextSpan(
                                          text: 'Sign In',
                                          style: TextStyle(
                                            color: Color(0xFFE10E0E),
                                          ),
                                        ),
                                      ],
                                      style: GoogleFonts.readexPro(
                                        letterSpacing: 0.0,
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 16.0),
                                  child: Container(
                                    width: 370.0,
                                    child: TextFormField(
                                      controller: namecont,
                                      focusNode: nameFocusNode,
                                      autocorrect: true,
                                      autofillHints: const [AutofillHints.name],
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: 'Enter Full Name',
                                        labelStyle: GoogleFonts.readexPro(
                                          letterSpacing: 0.0,
                                          textStyle: Theme.of(context)
                                              .textTheme
                                              .labelMedium,
                                          fontSize: 14,
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.blueAccent,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.blue,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.redAccent,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.red,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        filled: true,
                                        fillColor: Colors.grey,
                                      ),
                                      style: GoogleFonts.readexPro(
                                        letterSpacing: 0.0,
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                        fontSize: 12,
                                      ),
                                      keyboardType: TextInputType.name,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 16.0),
                                  child: Container(
                                    width: 370.0,
                                    child: TextFormField(
                                      controller: emailAddressTextController,
                                      focusNode: emailAddressFocusNode,
                                      autofocus: true,
                                      autofillHints: const [
                                        AutofillHints.email
                                      ],
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: 'Enter email address',
                                        labelStyle: GoogleFonts.readexPro(
                                          textStyle: Theme.of(context)
                                              .textTheme
                                              .labelMedium,
                                          letterSpacing: 0.0,
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.blueAccent,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.blue,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.redAccent,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.red,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        filled: true,
                                        fillColor: Colors.grey,
                                      ),
                                      style: GoogleFonts.readexPro(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                        letterSpacing: 0.0,
                                      ),
                                      keyboardType: TextInputType.emailAddress,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 16.0),
                                  child: Container(
                                    width: 370.0,
                                    child: TextFormField(
                                      controller: passwordTextController,
                                      focusNode: passwordFocusNode,
                                      autofocus: true,
                                      autofillHints: const [
                                        AutofillHints.password
                                      ],
                                      obscureText: passwordVisibility,
                                      decoration: InputDecoration(
                                        labelText: 'Password',
                                        labelStyle: GoogleFonts.readexPro(
                                          textStyle: Theme.of(context)
                                              .textTheme
                                              .labelMedium,
                                          letterSpacing: 0.0,
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.blueAccent,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.blue,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.redAccent,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.red,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        filled: true,
                                        fillColor: Colors.grey,
                                        suffixIcon: InkWell(
                                          onTap: () => setState(
                                            () => passwordVisibility =
                                                !passwordVisibility,
                                          ),
                                          focusNode:
                                              FocusNode(skipTraversal: true),
                                          child: Icon(
                                            passwordVisibility
                                                ? Icons.visibility_outlined
                                                : Icons.visibility_off_outlined,
                                            color: Colors.grey,
                                            size: 24.0,
                                          ),
                                        ),
                                      ),
                                      style: GoogleFonts.readexPro(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                        letterSpacing: 0.0,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 16.0),
                                  child: Container(
                                    width: 370.0,
                                    child: TextFormField(
                                      controller: passwordConfirmTextController,
                                      focusNode: passwordConfirmFocusNode,
                                      autofocus: true,
                                      autofillHints: const [
                                        AutofillHints.password
                                      ],
                                      obscureText: !passwordConfirmVisibility,
                                      decoration: InputDecoration(
                                        labelText: 'Confirm Password',
                                        labelStyle: GoogleFonts.readexPro(
                                          textStyle: Theme.of(context)
                                              .textTheme
                                              .labelMedium,
                                          letterSpacing: 0.0,
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.blueAccent,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.blue,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.redAccent,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.red,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        filled: true,
                                        fillColor: Colors.grey,
                                        suffixIcon: InkWell(
                                          onTap: () => setState(
                                            () => passwordConfirmVisibility =
                                                !passwordConfirmVisibility,
                                          ),
                                          focusNode:
                                              FocusNode(skipTraversal: true),
                                          child: Icon(
                                            passwordConfirmVisibility
                                                ? Icons.visibility_outlined
                                                : Icons.visibility_off_outlined,
                                            color: Colors.black,
                                            size: 24.0,
                                          ),
                                        ),
                                      ),
                                      style: GoogleFonts.readexPro(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                        letterSpacing: 0.0,
                                      ),
                                      minLines: 1,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 16.0),
                                  child: Container(
                                    width: 370.0,
                                    child: TextFormField(
                                      controller: referralTextController,
                                      focusNode: referralFocusNode,
                                      autofocus: true,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText:
                                            'Enter Referral code (Optional)',
                                        labelStyle: GoogleFonts.readexPro(
                                          textStyle: Theme.of(context)
                                              .textTheme
                                              .labelMedium,
                                          letterSpacing: 0.0,
                                        ),
                                        hintStyle: GoogleFonts.readexPro(
                                          textStyle: Theme.of(context)
                                              .textTheme
                                              .labelMedium,
                                          letterSpacing: 0.0,
                                        ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.blueAccent,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.blue,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        errorBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.redAccent,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        focusedErrorBorder:
                                            UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.red,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        filled: true,
                                        fillColor: Colors.grey,
                                      ),
                                      style: GoogleFonts.readexPro(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                        letterSpacing: 0.0,
                                      ),
                                      minLines: 1,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 16.0),
                                  child: SizedBox(
                                    width: 370.0,
                                    height: 60.0,
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      style: ButtonStyle(
                                        shape: WidgetStatePropertyAll(
                                          RoundedRectangleBorder(
                                            side: BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                        ),
                                        elevation: WidgetStatePropertyAll(3.0),
                                        backgroundColor: WidgetStatePropertyAll(
                                            namecont.text == 'true' &&
                                                    emailAddressTextController
                                                            .text ==
                                                        'true' &&
                                                    passwordConfirmTextController
                                                            .text ==
                                                        'true' &&
                                                    passwordTextController
                                                            .text ==
                                                        'true'
                                                ? Color(0xFFE10E0E)
                                                : Colors.black),
                                      ),
                                      child: Text(
                                        'Register',
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
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 12.0, 0.0, 12.0),
                                    child: RichText(
                                      textScaler:
                                          MediaQuery.of(context).textScaler,
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text:
                                                'By Clicking on the register button you accept our',
                                            style: TextStyle(),
                                          ),
                                          TextSpan(
                                            text: 'Terms of Service',
                                            style: GoogleFonts.readexPro(
                                              textStyle: Theme.of(context)
                                                  .textTheme
                                                  .labelSmall,
                                              letterSpacing: 0.0,
                                              color: Color(0xFFE10E0E),
                                            ),
                                          ),
                                        ],
                                        style: GoogleFonts.readexPro(
                                          textStyle: Theme.of(context)
                                              .textTheme
                                              .labelSmall,
                                          letterSpacing: 0.0,
                                        ),
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                )
                              ],
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
