import 'package:eatup/screens/account/register.dart';

import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../dashboard/home.dart';

import 'package:eatup/widgets/widg.dart';
import 'package:eatup/widgets/firebase_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';

  final emailcont = TextEditingController();
  final emailfocus = FocusNode();

  final pword = TextEditingController();
  final pwordfocus = FocusNode();

  late bool passwordVisibility = false;

  final firebaseAuth = FirebaseService().firebaseAuth;
  final firebaseFirestore = FirebaseService().firebaseFirestore;

  bool _progress = false;

  Future<void> signInUser(String email, String password) async {
    setState(() {
      _progress = true; // Show progress indicator
    });

    try {
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password)
          .timeout(const Duration(seconds: 10));
      // Update Firestore with last login timestamp
      if (userCredential.user != null) {
        firebaseFirestore
            .collection('users')
            .doc(userCredential.user!.uid)
            .update({'lastlogin': FieldValue.serverTimestamp()}).then((_) {
          print('Last login timestamp updated.');
        }).catchError((error) {
          print('Failed to update last login: $error');
        });
        if (mounted) {
          showSuccessToast(
              context: context,
              message: 'Login Successful! ${userCredential.user?.email}');
        }
        var route = MaterialPageRoute(builder: (context) => const HomePage());
        Navigator.push(context, route);
      } else {
        if (mounted) {
          showSuccessToast(context: context, message: 'Other Issues');
        }
      }
    } on FirebaseAuthException catch (e) {
      if (mounted) {
        showErrorToast(context: context, message: e.toString());
      }
    } finally {
      // Always hide progress indicator
      setState(() {
        _progress = false;
      });
    }
    ;
  }

// google sign in
  // Future<void> updateLastLogin(String uid) async {
  //   await firebaseFirestore
  //       .collection('users')
  //       .doc(uid)
  //       .update({'lastlogin': FieldValue.serverTimestamp()});
  // }

  // Future<UserCredential> signInWithGoogle() async {
  //   // trigger auth flow
  //   final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  //   //obtain the auth details from request
  //   final GoogleSignInAuthentication? googleAuth =
  //       await googleUser?.authentication;

  //   // create new credential
  //   final credential = GoogleAuthProvider.credential(
  //     accessToken: googleAuth?.accessToken,
  //     idToken: googleAuth?.idToken,
  //   );

  //   //once signed in, return usercredential
  //   return await FirebaseAuth.instance.signInWithCredential(credential);
  // }

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
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsets.all(24.0),
                              child: Form(
                                key: _formKey,
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
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
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
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 16.0),
                                      child: SizedBox(
                                        width: double.infinity,
                                        height: 44.0,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            var route = MaterialPageRoute(
                                                builder: (context) =>
                                                    const Register());
                                            Navigator.push(context, route);
                                          },
                                          style: ButtonStyle(
                                            backgroundColor:
                                                WidgetStateProperty.all<Color>(
                                              const Color(0xFFE10E0E),
                                            ),
                                            shape: WidgetStatePropertyAll(
                                              RoundedRectangleBorder(
                                                side: const BorderSide(
                                                    width: 2.0),
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
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 16.0),
                                      child: SizedBox(
                                        width: double.infinity,
                                        height: 44.0,
                                        child: ElevatedButton.icon(
                                          onPressed: () {
                                            // signInWithGoogle();
                                          },
                                          label: const Text(
                                            'Continue with Google',
                                          ),
                                          icon: const FaIcon(
                                            FontAwesomeIcons.google,
                                            color: Color(0xFFE10E0E),
                                            size: 20.0,
                                          ),
                                          style: ButtonStyle(
                                            backgroundColor:
                                                WidgetStateProperty.all<Color>(
                                              Colors.white,
                                            ),
                                            shape: WidgetStatePropertyAll(
                                              RoundedRectangleBorder(
                                                side: const BorderSide(
                                                    width: 2.0),
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 24.0),
                                      child: SizedBox(
                                        width: 370.0,
                                        child: Stack(
                                          alignment: const AlignmentDirectional(
                                              0.0, 0.0),
                                          children: [
                                            Align(
                                              alignment:
                                                  const AlignmentDirectional(
                                                      0.0, 0.0),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        0.0, 12.0, 0.0, 12.0),
                                                child: Container(
                                                  width: double.infinity,
                                                  height: 2.0,
                                                  decoration:
                                                      const BoxDecoration(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment:
                                                  const AlignmentDirectional(
                                                      0.0, 0.0),
                                              child: Container(
                                                width: 150.0,
                                                height: 32.0,
                                                decoration: const BoxDecoration(
                                                  color: Colors.white,
                                                ),
                                                alignment:
                                                    const AlignmentDirectional(
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
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 16.0),
                                      child: SizedBox(
                                        width: double.infinity,
                                        child: TextFormField(
                                          controller: emailcont,
                                          focusNode: emailfocus,
                                          autofocus: false,
                                          autofillHints: const [
                                            AutofillHints.email
                                          ],
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelText: 'Email',
                                            labelStyle: GoogleFonts.readexPro(
                                              fontSize: 14,
                                              letterSpacing: 0.0,
                                              textStyle: Theme.of(context)
                                                  .textTheme
                                                  .labelLarge,
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                              borderSide: const BorderSide(
                                                color: Colors.white,
                                                width: 2.0,
                                              ),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                              borderSide: const BorderSide(
                                                color: Colors.green,
                                                width: 2.0,
                                              ),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                              borderSide: const BorderSide(
                                                color: Colors.orange,
                                                width: 2.0,
                                              ),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                              borderSide: const BorderSide(
                                                color: Colors.red,
                                                width: 2.0,
                                              ),
                                            ),
                                            filled: true,
                                            fillColor: Colors.white,
                                          ),
                                          style: GoogleFonts.readexPro(
                                            textStyle: Theme.of(context)
                                                .textTheme
                                                .bodyLarge,
                                            letterSpacing: 0.0,
                                            fontSize: 12,
                                          ),
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return "Fill in Email";
                                            }
                                            return null;
                                          },
                                          onSaved: (newValue) {
                                            email = newValue!;
                                          },
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 16.0),
                                      child: SizedBox(
                                        width: double.infinity,
                                        child: TextFormField(
                                          controller: pword,
                                          focusNode: pwordfocus,
                                          autofocus: false,
                                          autofillHints: const [
                                            AutofillHints.password
                                          ],
                                          obscureText: passwordVisibility,
                                          decoration: InputDecoration(
                                            labelText: 'Password',
                                            labelStyle: GoogleFonts.readexPro(
                                              fontSize: 14,
                                              letterSpacing: 0.0,
                                              textStyle: Theme.of(context)
                                                  .textTheme
                                                  .labelLarge,
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                              borderSide: const BorderSide(
                                                color: Colors.white,
                                                width: 2.0,
                                              ),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                              borderSide: const BorderSide(
                                                color: Colors.green,
                                                width: 2.0,
                                              ),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                              borderSide: const BorderSide(
                                                color: Colors.orange,
                                                width: 2.0,
                                              ),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                              borderSide: const BorderSide(
                                                color: Colors.red,
                                                width: 2.0,
                                              ),
                                            ),
                                            filled: true,
                                            fillColor: Colors.white,
                                            suffixIcon: InkWell(
                                              onTap: () => setState(() =>
                                                  passwordVisibility =
                                                      !passwordVisibility),
                                              focusNode: FocusNode(
                                                  skipTraversal: true),
                                              child: Icon(
                                                passwordVisibility
                                                    ? Icons.visibility_outlined
                                                    : Icons
                                                        .visibility_off_outlined,
                                                color: Colors.grey,
                                                size: 24.0,
                                              ),
                                            ),
                                          ),
                                          style: GoogleFonts.readexPro(
                                            textStyle: Theme.of(context)
                                                .textTheme
                                                .bodyLarge,
                                            letterSpacing: 0.0,
                                            fontSize: 12,
                                          ),
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return "Fill in Password";
                                            }
                                            if (value.trim().length < 6) {
                                              return "Password cannot be smaller than six Characters";
                                            }
                                            return null;
                                          },
                                          onSaved: (newValue) {
                                            password = newValue!;
                                          },
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                          const AlignmentDirectional(1.0, 0.0),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(0.0, 0.0, 0.0, 30.0),
                                        child: RichText(
                                          textScaler:
                                              MediaQuery.of(context).textScaler,
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: 'Forgot your password',
                                                style: GoogleFonts.readexPro(
                                                  letterSpacing: 0.0,
                                                  textStyle: Theme.of(context)
                                                      .textTheme
                                                      .bodyMedium,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                  color:
                                                      const Color(0xFFE10E0E),
                                                ),
                                              ),
                                            ],
                                            style: GoogleFonts.readexPro(
                                              letterSpacing: 0.0,
                                              textStyle: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 16.0),
                                      child: SizedBox(
                                        width: double.infinity,
                                        height: 60.0,
                                        child: ElevatedButton(
                                          onPressed: () async {
                                            if (_formKey.currentState!
                                                .validate()) {
                                              _formKey.currentState!.save();
                                              signInUser(email, password);
                                            }
                                          },
                                          style: ButtonStyle(
                                            backgroundColor:
                                                WidgetStatePropertyAll(
                                              emailcont.text != '' &&
                                                      pword.text != ''
                                                  ? const Color(0xFFE10E0E)
                                                  : Colors.grey,
                                            ),
                                            elevation:
                                                const WidgetStatePropertyAll(
                                                    3.0),
                                            side: const WidgetStatePropertyAll(
                                              BorderSide(
                                                color: Colors.transparent,
                                                width: 1.0,
                                              ),
                                            ),
                                            shape: WidgetStatePropertyAll(
                                              RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                            ),
                                          ),
                                          child: Text(
                                            'Login',
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
                        ),
                        if (_progress)
                          const LinearProgressIndicator(
                            color: Color(0xFFE10E0E),
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
