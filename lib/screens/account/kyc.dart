import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eatup/routes/route_names.dart';
import 'package:eatup/widgets/widg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:country_state_city_pro/country_state_city_pro.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';
import 'package:path/path.dart' as p;

class KYC extends StatefulWidget {
  const KYC({super.key});

  @override
  State<KYC> createState() => _KYCState();
}

class _KYCState extends State<KYC> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final _formKey = GlobalKey<FormState>();

  String? ct;
  String? cn;

  final cardtype = TextEditingController();
  final ctfn = FocusNode();

  final cardno = TextEditingController();
  final cnfn = FocusNode();

  ///Define Controller
  TextEditingController country = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController city = TextEditingController();

  ImagePicker picker = ImagePicker();
  File? _image;
  File? _image2;

  String? imgname;
  String? imgname2;

  void pickImage(int imgno) async {
    var xfile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (imgno == 1) {
        _image = File(xfile!.path);
        imgname = xfile.name;
      } else if (imgno == 2) {
        _image2 = File(xfile!.path);
        imgname2 = xfile.name;
      }
    });
  }

  final firebaseAuth = FirebaseAuth.instance;
  final firebaseFirestore = FirebaseFirestore.instance;

  bool _progress = false;

  Future<void> updateKYC(String? idT, String? idN, String ct, String st,
      String cit, File img, File img2) async {
    setState(() {
      _progress = true;
    });
    try {
      User? user = firebaseAuth.currentUser;
      if (user != null) {
        String fileEX = p.extension(img.path);
        String fileEX2 = p.extension(img2.path);
        String imgUrl =
            await uploadIMG(img, user.uid, const Uuid().v4(), fileEX);
        String imgUrl2 =
            await uploadIMG(img2, user.uid, const Uuid().v4(), fileEX2);
        firebaseFirestore
            .collection('users')
            .doc(user.uid)
            .collection('userInfo')
            .doc('kyc')
            .set({
          'idType': idT,
          'idNumber': idN,
          'Country': ct,
          'State': st,
          'City': cit,
          'ID_img': imgUrl,
          'UserImg': imgUrl2,
          'lastKycUpload': FieldValue.serverTimestamp()
        }, SetOptions(merge: true)).then((_) {
          print('KYC Updated.');
          if (mounted) {
            showSuccessToast(
                context: context, message: 'KYC Uploaded! ${user.email}');
          }
          Get.toNamed(home);
        }).catchError((error) {
          print('KYC Failed: $error');
          if (mounted) {
            showErrorToast(context: context, message: 'KYC Failed $error');
          }
        });
      } else {
        if (mounted) {
          showInfoToast(context: context, message: 'Sign In to Request KYC');
        }
      }
    } on FirebaseAuthException catch (e) {
      if (mounted) {
        showErrorToast(context: context, message: e.toString());
      }
    } finally {
      setState(() {
        _progress = false;
      });
    }
  }

  Future<String> uploadIMG(
      File image, String uID, String fileType, String pth) async {
    try {
      Reference storageReference =
          FirebaseStorage.instance.ref().child('users/$uID/$fileType$pth');

      UploadTask uploadTask = storageReference.putFile(image);
      TaskSnapshot taskSnapshot = await uploadTask;
      String downloadURL = await taskSnapshot.ref.getDownloadURL();
      return downloadURL;
    } catch (e) {
      throw Exception('Error uploading image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: const Color(0xfff1f4f8),
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
                  side: const BorderSide(width: 1.0, color: Colors.transparent),
                ),
              ),
              backgroundColor: WidgetStateProperty.all<Color>(
                const Color(0xECF2B8B8),
              ),
              fixedSize: WidgetStateProperty.all<Size>(const Size.square(60.0)),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.chevron_left,
              color: Color(0xFFE10E0E),
              size: 25.0,
            ),
          ),
        ),
        title: Text(
          'KYC',
          style: GoogleFonts.outfit(
            textStyle: Theme.of(context).textTheme.headlineMedium,
            color: const Color(0xFF57636c),
            fontWeight: FontWeight.w600,
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
          child: Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                decoration: const BoxDecoration(),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(-1.0, 0.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 4.0),
                          child: Text(
                            'Enter Identity Card Type',
                            textAlign: TextAlign.start,
                            style: GoogleFonts.readexPro(
                              textStyle: Theme.of(context).textTheme.bodyMedium,
                              fontSize: 14,
                              letterSpacing: 0.0,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(-1.0, 0.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 15.0),
                          child: SizedBox(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            child: TextFormField(
                              controller: cardtype,
                              focusNode: ctfn,
                              autofocus: false,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Enter card type',
                                labelStyle: GoogleFonts.readexPro(
                                  textStyle:
                                      Theme.of(context).textTheme.bodyMedium,
                                  fontSize: 14,
                                  letterSpacing: 0.0,
                                ),
                                alignLabelWithHint: false,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0xFFe0e3e7),
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.green,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0xFFff5963),
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0xFFff5963),
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                              style: GoogleFonts.readexPro(
                                textStyle:
                                    Theme.of(context).textTheme.bodyMedium,
                                fontSize: 14,
                                letterSpacing: 0.0,
                              ),
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return "Fill in Card Type";
                                }
                                return null;
                              },
                              onSaved: (nval) {
                                ct = nval!;
                              },
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(-1.0, 0.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 4.0),
                          child: Text(
                            'Enter ID Card Number',
                            textAlign: TextAlign.start,
                            style: GoogleFonts.readexPro(
                              textStyle: Theme.of(context).textTheme.bodyMedium,
                              fontSize: 14,
                              letterSpacing: 0.0,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(-1.0, 0.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 15.0),
                          child: SizedBox(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            child: TextFormField(
                              controller: cardno,
                              focusNode: cnfn,
                              autofocus: false,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Enter id card number',
                                labelStyle: GoogleFonts.readexPro(
                                  textStyle:
                                      Theme.of(context).textTheme.labelMedium,
                                  fontSize: 14,
                                  letterSpacing: 0.0,
                                ),
                                alignLabelWithHint: false,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0xffe0e3e7),
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0xFFe0e3e7),
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0xffff5963),
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0xffff5963),
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                              style: GoogleFonts.readexPro(
                                textStyle:
                                    Theme.of(context).textTheme.bodyMedium,
                                fontSize: 14,
                                letterSpacing: 0.0,
                              ),
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return "Fill in Card Number";
                                }
                                return null;
                              },
                              onSaved: (nval) {
                                cn = nval!;
                              },
                            ),
                          ),
                        ),
                      ),
                      const Divider(
                        thickness: 1.0,
                        color: Color(0xff57636c),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(-1.0, 0.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 4.0),
                          child: Text(
                            'Identity Card (20px by 200px)',
                            textAlign: TextAlign.start,
                            style: GoogleFonts.readexPro(
                              textStyle: Theme.of(context).textTheme.bodyMedium,
                              fontSize: 14,
                              letterSpacing: 0.0,
                            ),
                          ),
                        ),
                      ),
                      const Divider(
                        thickness: 3.0,
                        color: Color(0xff57636c),
                      ),
                      GestureDetector(
                        onTap: () {
                          pickImage(1);
                        },
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 31.0,
                          decoration: const BoxDecoration(color: Colors.white),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 1.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Icon(
                                    Icons.add,
                                    color: Color(0xFFE10E0E),
                                    size: 12.0,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 1.0),
                                  child: _image != null
                                      ? Text(
                                          imgname!,
                                          style: GoogleFonts.readexPro(
                                            textStyle: Theme.of(context)
                                                .textTheme
                                                .bodyMedium,
                                            fontSize: 14,
                                            color: Colors.black,
                                            letterSpacing: 0.0,
                                          ),
                                        )
                                      : Text(
                                          'Upload Image',
                                          style: GoogleFonts.readexPro(
                                            textStyle: Theme.of(context)
                                                .textTheme
                                                .bodyMedium,
                                            fontSize: 14,
                                            color: const Color(0xFFE10E0E),
                                            letterSpacing: 0.0,
                                          ),
                                        ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(-1.0, 0.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 15.0, 0.0, 4.0),
                          child: Text(
                            'Proof of Life (1440px by 576px)',
                            textAlign: TextAlign.start,
                            style: GoogleFonts.readexPro(
                              textStyle: Theme.of(context).textTheme.bodyMedium,
                              fontSize: 14,
                              letterSpacing: 0.0,
                            ),
                          ),
                        ),
                      ),
                      const Divider(
                        thickness: 3.0,
                        color: Color(0xff57636c),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 0.0, 0.0, 15.0),
                        child: GestureDetector(
                          onTap: () {
                            pickImage(2);
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Icon(
                                  Icons.add,
                                  color: Color(0xFFE10E0E),
                                  size: 12.0,
                                ),
                              ),
                              _image2 != null
                                  ? Text(
                                      imgname2!,
                                      style: GoogleFonts.readexPro(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                        fontSize: 14,
                                        color: Colors.black,
                                        letterSpacing: 0.0,
                                      ),
                                    )
                                  : Text(
                                      'Upload Image',
                                      style: GoogleFonts.readexPro(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                        fontSize: 14,
                                        color: const Color(0xFFE10E0E),
                                        letterSpacing: 0.0,
                                      ),
                                    ),
                            ],
                          ),
                        ),
                      ),
                      const Divider(
                        thickness: 1.0,
                        color: Color(0xff57636c),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(-1.0, 0.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 20.0, 0.0, 4.0),
                          child: Text(
                            'Select Location',
                            textAlign: TextAlign.start,
                            style: GoogleFonts.readexPro(
                              textStyle: Theme.of(context).textTheme.bodyMedium,
                              fontSize: 14,
                              letterSpacing: 0.0,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(-1.0, 0.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 15.0),
                          child: CountryStateCityPicker(
                            country: country,
                            state: state,
                            city: city,
                            dialogColor: Colors.white,
                            textFieldDecoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0xffe0e3e7),
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              // fillColor: Colors.blueGrey.shade100,
                              // filled: false,
                              suffixIcon: const Icon(
                                Icons.arrow_drop_down,
                                color: Color(0xff57636c),
                                size: 24.0,
                              ),
                            ),
                          ),
                        ),
                      ),
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
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                              ),
                              elevation: const WidgetStatePropertyAll(3.0),
                              backgroundColor: WidgetStatePropertyAll(
                                  cardtype.text != '' &&
                                          cardno.text != '' &&
                                          _image != null &&
                                          _image2 != null &&
                                          country.text != '' &&
                                          state.text != '' &&
                                          city.text != ''
                                      ? const Color(0xFFE10E0E)
                                      : Colors.grey),
                            ),
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                updateKYC(ct, cn, country.text, state.text,
                                    city.text, _image!, _image2!);
                                // upload to firebase
                              }
                            },
                            child: Text(
                              'Submit',
                              style: GoogleFonts.readexPro(
                                textStyle:
                                    Theme.of(context).textTheme.titleSmall,
                                color: Colors.white,
                                letterSpacing: 0.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 12.0, 0.0, 12.0),
                          child: RichText(
                            textScaler: MediaQuery.of(context).textScaler,
                            text: TextSpan(
                              children: [
                                const TextSpan(
                                  text:
                                      'By clicking on the submit button you accept our',
                                  style: TextStyle(),
                                ),
                                TextSpan(
                                  text: ' Terms of service.',
                                  style: GoogleFonts.readexPro(
                                    textStyle:
                                        Theme.of(context).textTheme.labelSmall,
                                    fontSize: 12,
                                    color: const Color(0xFFE10E0E),
                                    letterSpacing: 0.0,
                                  ),
                                )
                              ],
                              style: GoogleFonts.readexPro(
                                textStyle:
                                    Theme.of(context).textTheme.headlineMedium,
                                fontSize: 14,
                                letterSpacing: 0.0,
                              ),
                            ),
                            textAlign: TextAlign.center,
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
          ),
        ),
      ),
    );
  }
}
