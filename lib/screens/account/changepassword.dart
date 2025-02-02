import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:eatup/routes/route_names.dart';
import 'package:eatup/widgets/widg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';

class ChangeP extends StatefulWidget {
  const ChangeP({super.key});

  @override
  State<ChangeP> createState() => _ChangePState();
}

class _ChangePState extends State<ChangeP> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  String? cp;

  final curp = TextEditingController();
  final cpfn = FocusNode();

  String? np;

  final newp = TextEditingController();
  final npfn = FocusNode();

  final rnewp = TextEditingController();
  final rnpfn = FocusNode();

  final firebaseAuth = FirebaseAuth.instance;
  final firebaseFirestore = FirebaseFirestore.instance;

  bool _progress = false;

  Future<void> ChangeP(String Oldp, String Newp) async {
    setState(() {
      _progress = true;
    });
    try {
      User? user = firebaseAuth.currentUser;
      if (user != null && user.email != null) {
        AuthCredential credential =
            EmailAuthProvider.credential(email: user.email!, password: Oldp);

        // re-auth user
        await user.reauthenticateWithCredential(credential);

        //update password
        await user.updatePassword(Newp).then((_) {
          if (mounted) {
            showSuccessToast(
                context: context, message: 'Password Updated! ${user.email}');
          }
          Get.toNamed(home);
        }).catchError((error) {
          if (mounted) {
            showSuccessToast(context: context, message: 'Update Failed $error');
          }
        });
      } else {
        if (mounted) {
          showSuccessToast(
              context: context, message: 'Sign In to Update Password');
        }
      }
    } on FirebaseAuthException catch (e) {
      if (mounted) {
        showSuccessToast(context: context, message: e.toString());
      }
    } finally {
      setState(() {
        _progress = false;
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
          'Change Password',
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
                          child: Form(
                            key: _formKey,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  width: 315.0,
                                  height: 100.0,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                  ),
                                  child: Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 10.0, 0.0, 0.0),
                                    child: Text(
                                      'To help protect your account, you are required to provide a new password if your current password is compromised',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.readexPro(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                      ),
                                    ),
                                  ),
                                ),
                                // current password
                                Align(
                                  alignment:
                                      const AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 4.0),
                                    child: Text(
                                      'Current Password',
                                      textAlign: TextAlign.start,
                                      style: GoogleFonts.readexPro(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment:
                                      const AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 15.0),
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      child: TextFormField(
                                        controller: curp,
                                        focusNode: cpfn,
                                        autofocus: false,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelStyle: GoogleFonts.readexPro(
                                            textStyle: Theme.of(context)
                                                .textTheme
                                                .labelMedium,
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                          ),
                                          alignLabelWithHint: false,
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Colors.grey,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Colors.green,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Colors.red,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Colors.red,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                        style: GoogleFonts.readexPro(
                                          textStyle: Theme.of(context)
                                              .textTheme
                                              .bodyMedium,
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                        ),
                                        validator: (val) {
                                          if (val!.isEmpty) {
                                            return "Fill in Current password";
                                          }
                                          return null;
                                        },
                                        onSaved: (nval) {
                                          cp = nval!;
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                                // new password
                                Align(
                                  alignment:
                                      const AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 4.0),
                                    child: Text(
                                      'New password',
                                      textAlign: TextAlign.start,
                                      style: GoogleFonts.readexPro(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment:
                                      const AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 15.0),
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      child: TextFormField(
                                        controller: newp,
                                        focusNode: npfn,
                                        autofocus: false,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelStyle: GoogleFonts.readexPro(
                                            textStyle: Theme.of(context)
                                                .textTheme
                                                .labelMedium,
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                          ),
                                          alignLabelWithHint: false,
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Colors.grey,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Colors.green,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Colors.red,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Colors.red,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                        style: GoogleFonts.readexPro(
                                          textStyle: Theme.of(context)
                                              .textTheme
                                              .bodyMedium,
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                        ),
                                        validator: (val) {
                                          if (val!.isEmpty) {
                                            return "Fill in new password";
                                          }
                                          return null;
                                        },
                                        onSaved: (nval) {
                                          np = nval!;
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                                // repeat new password
                                Align(
                                  alignment:
                                      const AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 4.0),
                                    child: Text(
                                      'Repeat new assword',
                                      textAlign: TextAlign.start,
                                      style: GoogleFonts.readexPro(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment:
                                      const AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 15.0),
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      child: TextFormField(
                                        controller: rnewp,
                                        focusNode: rnpfn,
                                        autofocus: false,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelStyle: GoogleFonts.readexPro(
                                            textStyle: Theme.of(context)
                                                .textTheme
                                                .labelMedium,
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                          ),
                                          alignLabelWithHint: false,
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Colors.grey,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Colors.green,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Colors.red,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Colors.red,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                        style: GoogleFonts.readexPro(
                                          textStyle: Theme.of(context)
                                              .textTheme
                                              .bodyMedium,
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                        ),
                                        validator: (val) {
                                          if (val!.isEmpty) {
                                            return "Fill in Paasword";
                                          }
                                          if (val != newp.text) {
                                            return "Passwords don't match";
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  // mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        width: 50.0,
                                        child: Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(25.0, 20.0, 25.0, 20.0),
                                          child: SizedBox(
                                            width: 150.0,
                                            height: 40.0,
                                            child: ElevatedButton(
                                              style: ButtonStyle(
                                                shape: WidgetStatePropertyAll(
                                                  RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                  ),
                                                ),
                                                elevation:
                                                    const WidgetStatePropertyAll(
                                                        3.0),
                                                backgroundColor:
                                                    WidgetStatePropertyAll(curp
                                                                    .text !=
                                                                '' &&
                                                            newp.text != '' &&
                                                            rnewp.text != '' &&
                                                            newp.text ==
                                                                rnewp.text
                                                        ? const Color(
                                                            0xFFE10E0E)
                                                        : Colors.grey),
                                              ),
                                              onPressed: () async {
                                                if (_formKey.currentState!
                                                    .validate()) {
                                                  _formKey.currentState!.save();
                                                  ChangeP(cp!, np!);
                                                  //   //   // change password in firebase
                                                }
                                              },
                                              child: Text(
                                                'Update Password',
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
                                      ),
                                    ),
                                  ],
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
            ],
          ),
        ),
      ),
    );
  }
}
