import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:country_state_city_pro/country_state_city_pro.dart';
import 'package:eatup/routes/route_names.dart';
import 'package:eatup/widgets/widg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class AdAdd extends StatefulWidget {
  const AdAdd({super.key});

  @override
  State<AdAdd> createState() => _AdAddState();
}

class _AdAddState extends State<AdAdd> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  final country = TextEditingController();
  final state = TextEditingController();
  final city = TextEditingController();

  String? rn;
  final rname = TextEditingController();
  final rncn = FocusNode();

  String? stret;
  final stradd = TextEditingController();
  final safn = FocusNode();

  String? dt;
  final details = TextEditingController();
  final dtfn = FocusNode();

  String? no;
  final number = TextEditingController();
  final nofn = FocusNode();

  String? zp;
  final zip = TextEditingController();
  final zpfn = FocusNode();

  var gd = "-Select-";
  final gender = TextEditingController();
  final gdfn = FocusNode();

  List<String> items = ["-Select-", "Estate", "Town", "City", "Village"];

  final firebaseAuth = FirebaseAuth.instance;
  final firebaseFirestore = FirebaseFirestore.instance;

  bool _progress = false;

  Future<void> AdAdres(
    String? rname,
    String? street,
    String details,
    String? no,
    String zip,
    String hood,
    String contry,
    String state,
    String city,
  ) async {
    setState(() {
      _progress = true;
    });
    try {
      User? user = firebaseAuth.currentUser;
      if (user != null) {
        firebaseFirestore
            .collection('users')
            .doc(user.uid)
            .collection('userInfo')
            .doc('address')
            .set({
          'RecipientName': rname,
          'street': street,
          'details': details,
          'PhoneNumber': no,
          'ZIP': zip,
          'area': hood,
          'Country': contry,
          'State': state,
          'City': city,
          'lastAddress': FieldValue.serverTimestamp()
        }, SetOptions(merge: true)).then((_) {
          print('Address Updated.');
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
          'Add Delivery Address',
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
                                Align(
                                  alignment:
                                      const AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 4.0),
                                    child: Text(
                                      'Recipient Name',
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
                                        controller: rname,
                                        focusNode: rncn,
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
                                            return 'Fill in Recipient Name';
                                          }
                                          return null;
                                        },
                                        onSaved: (nval) {
                                          rn = nval?.isNotEmpty == true
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
                                      'Street Address',
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
                                        controller: stradd,
                                        focusNode: safn,
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
                                            return 'Fill in Street Address';
                                          }
                                          return null;
                                        },
                                        onSaved: (nval) {
                                          stret = nval?.isNotEmpty == true
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
                                      'Details (Door, Apartment Number)',
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
                                        controller: details,
                                        focusNode: dtfn,
                                        autofocus: false,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          hintText: 'E.g Suite B3',
                                          hintStyle: GoogleFonts.readexPro(
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
                                            return 'Fill in Details';
                                          }
                                          return null;
                                        },
                                        onSaved: (nval) {
                                          dt = nval?.isNotEmpty == true
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
                                Align(
                                  alignment:
                                      const AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 4.0),
                                    child: Text(
                                      'Zip Code (Optional)',
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
                                        controller: zip,
                                        focusNode: zpfn,
                                        autofocus: false,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          hintText: 'Enter zip code',
                                          hintStyle: GoogleFonts.readexPro(
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
                                            return 'Fill in ZIP';
                                          }
                                          return null;
                                        },
                                        onSaved: (nval) {
                                          zp = nval?.isNotEmpty == true
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
                                      'Service Area',
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
                                            return 'Select Service Area';
                                          }
                                          return null;
                                        },
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
                                            rname.text != '' &&
                                                    stradd.text != '' &&
                                                    details.text != '' &&
                                                    number.text != '' &&
                                                    zip.text != '' &&
                                                    gender.text != '-Select-' &&
                                                    country.text != '' &&
                                                    state.text != '' &&
                                                    city.text != ''
                                                ? const Color(0xFFE10E0E)
                                                : Colors.grey),
                                      ),
                                      onPressed: () async {
                                        if (_formKey.currentState!.validate()) {
                                          _formKey.currentState!.save();
                                          AdAdres(
                                            rn,
                                            stret,
                                            dt!,
                                            no,
                                            zp!,
                                            gd,
                                            country.text,
                                            state.text,
                                            city.text,
                                          );
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
