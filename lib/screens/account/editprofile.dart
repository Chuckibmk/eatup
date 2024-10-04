import 'dart:io';

import 'package:country_state_city_pro/country_state_city_pro.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eatup/routes/route_names.dart';
import 'package:eatup/widgets/widg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/route_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';
import 'package:path/path.dart' as p;

class Editprofile extends StatefulWidget {
  const Editprofile({super.key});

  @override
  State<Editprofile> createState() => _EditprofileState();
}

class _EditprofileState extends State<Editprofile> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  final country = TextEditingController();
  final state = TextEditingController();
  final city = TextEditingController();

  String? fn;
  final fname = TextEditingController();
  final fncn = FocusNode();

  String? ln;
  final lname = TextEditingController();
  final lnfn = FocusNode();

  var gd = "-Select-";
  final gender = TextEditingController();
  final gdfn = FocusNode();

  List<String> items = ["-Select-", "Male", "Female"];

  String? no;
  final number = TextEditingController();
  final nofn = FocusNode();

  String? ad;
  final address = TextEditingController();
  final adfn = FocusNode();

  ImagePicker picker = ImagePicker();
  File? _image;

  String? imgname;

  void pickImage() async {
    var xfile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = File(xfile!.path);
      imgname = xfile.name;
    });
  }

  final firebaseAuth = FirebaseAuth.instance;
  final firebaseFirestore = FirebaseFirestore.instance;

  bool _progress = false;

  Future<void> updateProfile(String? fname, String? lname, String gd,
      String? ad, String ct, String st, String cit, File img) async {
    setState(() {
      _progress = true;
    });
    try {
      User? user = firebaseAuth.currentUser;
      if (user != null) {
        String fileEX = p.extension(img.path);
        String imgUrl =
            await uploadIMG(img, user.uid, const Uuid().v4(), fileEX);
        firebaseFirestore.collection('users').doc(user.uid).set({
          'fname': fname,
          'lname': lname,
          'gender': gd,
          'address': ad,
          'Country': ct,
          'State': st,
          'City': cit,
          'DP': imgUrl,
          'lastProfileUpdate': FieldValue.serverTimestamp()
        }, SetOptions(merge: true)).then((_) {
          print('Profile Updated.');
          if (mounted) {
            showSuccessToast(
                context: context, message: 'Profile Updated! ${user.email}');
          }
          Get.toNamed(home);
        }).catchError((error) {
          print('Profile Failed: $error');
          if (mounted) {
            showSuccessToast(context: context, message: 'Update Failed $error');
          }
        });
      } else {
        if (mounted) {
          showSuccessToast(
              context: context, message: 'Sign In to Update Profile');
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
          'Edit Profile',
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
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              121.0, 20.0, 121.0, 0.0),
                          child: Stack(
                            children: [
                              imgname != null && imgname!.isNotEmpty
                                  ? Align(
                                      alignment:
                                          const AlignmentDirectional(0.0, 0.0),
                                      child: Container(
                                        width: 150.0,
                                        height: 150.0,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: FileImage(_image!),
                                          ),
                                        ),
                                        // child: Image.asset(
                                        //   'assets/images/account_circle_24dp_E8EAED_FILL0_wght400_GRAD0_opsz24.png',
                                        //   fit: BoxFit.cover,
                                        // ),
                                      ),
                                    )
                                  : Align(
                                      alignment:
                                          const AlignmentDirectional(0.0, 0.0),
                                      child: Container(
                                        width: 150.0,
                                        height: 150.0,
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
                                      90.0, 90.0, 0.0, 0.0),
                                  child: IconButton(
                                    style: ButtonStyle(
                                      shape: WidgetStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          side: const BorderSide(
                                              width: 1.0,
                                              color: Colors.transparent),
                                        ),
                                      ),
                                      backgroundColor:
                                          WidgetStateProperty.all<Color>(
                                        const Color(0xFFE10E0E),
                                      ),
                                      fixedSize: WidgetStateProperty.all<Size>(
                                          const Size.square(40.0)),
                                    ),
                                    onPressed: () async {
                                      // Navigator.pop(context);
                                      pickImage();
                                    },
                                    icon: const Icon(
                                      Icons.upload,
                                      color: Colors.white,
                                      size: 24,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
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
                                Align(
                                  alignment:
                                      const AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 4.0),
                                    child: Text(
                                      'First Name',
                                      textAlign: TextAlign.start,
                                      style: GoogleFonts.readexPro(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                        fontSize: 14,
                                        letterSpacing: 0.0,
                                        // fontWeight: FontWeight.bold,
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
                                    child: SizedBox(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      child: TextFormField(
                                        controller: fname,
                                        focusNode: fncn,
                                        autofocus: false,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelStyle: GoogleFonts.readexPro(
                                            textStyle: Theme.of(context)
                                                .textTheme
                                                .labelMedium,
                                            fontSize: 14,
                                            letterSpacing: 0.0,
                                            // fontWeight: FontWeight.bold,
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
                                              color: Colors.orange,
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
                                          fontSize: 14,
                                          letterSpacing: 0.0,
                                          // fontWeight: FontWeight.bold,
                                        ),
                                        validator: (val) {
                                          if (val!.isEmpty) {
                                            return 'Fill in Firstname';
                                          }
                                          return null;
                                        },
                                        onSaved: (nval) {
                                          fn = nval?.isNotEmpty == true
                                              ? nval
                                              : null;
                                        },
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
                                            0.0, 0.0, 0.0, 4.0),
                                    child: Text(
                                      'Last Name',
                                      textAlign: TextAlign.start,
                                      style: GoogleFonts.readexPro(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                        fontSize: 14,
                                        letterSpacing: 0.0,
                                        // fontWeight: FontWeight.bold,
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
                                    child: SizedBox(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      child: TextFormField(
                                        controller: lname,
                                        focusNode: lnfn,
                                        autofocus: false,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelStyle: GoogleFonts.readexPro(
                                            textStyle: Theme.of(context)
                                                .textTheme
                                                .labelMedium,
                                            fontSize: 14,
                                            letterSpacing: 0.0,
                                            // fontWeight: FontWeight.bold,
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
                                              color: Colors.orange,
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
                                          fontSize: 14,
                                          letterSpacing: 0.0,
                                          // fontWeight: FontWeight.bold,
                                        ),
                                        validator: (val) {
                                          if (val!.isEmpty) {
                                            return 'Fill in Firstname';
                                          }
                                          return null;
                                        },
                                        onSaved: (nval) {
                                          ln = nval?.isNotEmpty == true
                                              ? nval
                                              : null;
                                        },
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
                                            0.0, 0.0, 0.0, 4.0),
                                    child: Text(
                                      'Gender',
                                      textAlign: TextAlign.start,
                                      style: GoogleFonts.readexPro(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                        fontSize: 14,
                                        letterSpacing: 0.0,
                                        // fontWeight: FontWeight.bold,
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
                                    child: SizedBox(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      child: DropdownButtonFormField<String>(
                                        items: items.map((String items) {
                                          return DropdownMenuItem(
                                            value: items,
                                            child: Text(items),
                                          );
                                        }).toList(),
                                        value: gd,
                                        onChanged: (value) {
                                          setState(() {
                                            gd = value!;
                                          });
                                        },
                                        hint: const Text('-Select-'),
                                        icon: const Icon(
                                          Icons.arrow_drop_down,
                                          color: Color(0xff57636c),
                                          size: 24.0,
                                        ),
                                        elevation: 2,
                                        style: GoogleFonts.readexPro(
                                          textStyle: Theme.of(context)
                                              .textTheme
                                              .bodyMedium,
                                          fontSize: 14,
                                          letterSpacing: 0.0,
                                        ),
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Color(0xffe0e3e7),
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(0.0, 4.0, 0.0, 4.0),
                                        validator: (val) {
                                          if (val == '-Select') {
                                            return 'Select appropriate gender';
                                          }
                                          return null;
                                        },
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
                                            0.0, 0.0, 0.0, 4.0),
                                    child: Text(
                                      'Phone Number',
                                      textAlign: TextAlign.start,
                                      style: GoogleFonts.readexPro(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                        fontSize: 14,
                                        letterSpacing: 0.0,
                                        // fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: const Alignment(-1.0, 0.0),
                                  child: Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 15.0),
                                    child: SizedBox(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      child: IntlPhoneField(
                                        controller: number,
                                        focusNode: nofn,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Color(0xffe0e3e7),
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                        initialCountryCode: 'US',
                                        onChanged: (phone) {
                                          print(phone.completeNumber);
                                        },
                                        validator: (val) {
                                          if (val?.completeNumber != null) {
                                            return 'Fill in Phone Number';
                                          }
                                          return null;
                                        },
                                        onSaved: (nval) {
                                          no = nval?.completeNumber;
                                        },
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
                                            0.0, 0.0, 0.0, 4.0),
                                    child: Text(
                                      'Address',
                                      textAlign: TextAlign.start,
                                      style: GoogleFonts.readexPro(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                        fontSize: 14,
                                        letterSpacing: 0.0,
                                        // fontWeight: FontWeight.bold,
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
                                    child: SizedBox(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      child: TextFormField(
                                        controller: address,
                                        focusNode: adfn,
                                        autofocus: false,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelStyle: GoogleFonts.readexPro(
                                            textStyle: Theme.of(context)
                                                .textTheme
                                                .labelMedium,
                                            fontSize: 14,
                                            letterSpacing: 0.0,
                                            // fontWeight: FontWeight.bold,
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
                                          fontSize: 14,
                                          letterSpacing: 0.0,
                                          // fontWeight: FontWeight.bold,
                                        ),
                                        validator: (val) {
                                          if (val!.isEmpty) {
                                            return 'Fill in Address';
                                          }
                                          return null;
                                        },
                                        onSaved: (nval) {
                                          ad = nval?.isNotEmpty == true
                                              ? nval
                                              : null;
                                        },
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
                                            0.0, 20.0, 0.0, 4.0),
                                    child: Text(
                                      'Location',
                                      textAlign: TextAlign.start,
                                      style: GoogleFonts.readexPro(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                        fontSize: 14,
                                        letterSpacing: 0.0,
                                        // fontWeight: FontWeight.bold,
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
                                    child: SizedBox(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      // height: 50.0,
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
                                            borderRadius:
                                                BorderRadius.circular(8.0),
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
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                        ),
                                        elevation:
                                            const WidgetStatePropertyAll(3.0),
                                        backgroundColor: WidgetStatePropertyAll(
                                            fname.text != '' &&
                                                    lname.text != '' &&
                                                    _image != null &&
                                                    gender.text != '' &&
                                                    country.text != '' &&
                                                    state.text != '' &&
                                                    city.text != ''
                                                ? const Color(0xFFE10E0E)
                                                : Colors.grey),
                                      ),
                                      onPressed: () async {
                                        if (_formKey.currentState!.validate()) {
                                          _formKey.currentState!.save();
                                          // print(fn);
                                          // print(ln);
                                          // print(gd);
                                          // print(ad);
                                          updateProfile(
                                              fn,
                                              ln,
                                              gd,
                                              ad,
                                              country.text,
                                              state.text,
                                              city.text,
                                              _image!);
                                          //   updateKYC(ct, cn, country.text, state.text,
                                          //       city.text, !, _image2!);
                                          //   // upload to firebase
                                        }
                                      },
                                      child: Text(
                                        'Submit',
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

                                // You will have to add an action on this rich text to go to your login page.
                                Align(
                                  alignment:
                                      const AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 12.0, 0.0, 12.0),
                                    child: RichText(
                                      textScaler:
                                          MediaQuery.of(context).textScaler,
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
                                                textStyle: Theme.of(context)
                                                    .textTheme
                                                    .labelSmall,
                                                fontSize: 14,
                                                letterSpacing: 0.0,
                                                color: const Color(0xFFe10e0e)
                                                // fontWeight: FontWeight.bold,
                                                ),
                                          )
                                        ],
                                        style: GoogleFonts.readexPro(
                                            textStyle: Theme.of(context)
                                                .textTheme
                                                .labelSmall,
                                            fontSize: 14,
                                            letterSpacing: 0.0,
                                            color: const Color(0xFFe10e0e)
                                            // fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                      textAlign: TextAlign.center,
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
            ],
          ),
        ),
      ),
    );
  }
}
