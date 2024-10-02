import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Editprofile extends StatefulWidget {
  const Editprofile({super.key});

  @override
  State<Editprofile> createState() => _EditprofileState();
}

class _EditprofileState extends State<Editprofile> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
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
                height: MediaQuery.sizeOf(context).height * 1.0,
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
                              Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
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
                                    },
                                    icon: const Icon(
                                      Icons.upload,
                                      color: Color(0xFFE10E0E),
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
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Align(
                                alignment:
                                    const AlignmentDirectional(-1.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
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
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 15.0),
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    child: TextFormField(
                                      // controller: _model.textController1,
                                      // focusNode: _model.textFieldFocusNode1,
                                      autofocus: true,
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
                                          borderSide: BorderSide(
                                            color: Color(0XFFe0e3e7),
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.green,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.orange,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
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
                                      // validator: _model.textController1Validator
                                      //     .asValidator(context),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment:
                                    const AlignmentDirectional(-1.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
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
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 15.0),
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    child: TextFormField(
                                      // controller: _model.textController2,
                                      // focusNode: _model.textFieldFocusNode2,
                                      autofocus: true,
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
                                          borderSide: BorderSide(
                                            color: Colors.grey,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.green,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.orange,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
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
                                      // validator: _model.textController2Validator
                                      //     .asValidator(context),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment:
                                    const AlignmentDirectional(-1.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
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
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 15.0),
                                  child: SizedBox(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    height: 56.0,
                                    child: DropdownButtonFormField<String>(
                                      items: [],
                                      // value: country,
                                      onChanged: (value) {
                                        setState(() {
                                          // country = value;
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
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              16.0, 4.0, 16.0, 4.0),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment:
                                    const AlignmentDirectional(-1.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
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
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Align(
                                    alignment:
                                        const AlignmentDirectional(-1.0, 0.0),
                                    child: Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 15.0),
                                      child: SizedBox(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.25,
                                        height: 50.0,
                                        child: DropdownButtonFormField<String>(
                                          items: [],
                                          // value: country,
                                          onChanged: (value) {
                                            // setState(() {
                                            //   country = value;
                                            // });
                                          },
                                          hint: const Text('+1'),
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
                                              .fromSTEB(16.0, 4.0, 16.0, 4.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Align(
                                      alignment:
                                          const AlignmentDirectional(-1.0, 0.0),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(0.0, 0.0, 0.0, 15.0),
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.75,
                                          child: TextFormField(
                                            // controller: _model.textController3,
                                            // focusNode:
                                            //     _model.textFieldFocusNode3,
                                            autofocus: true,
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
                                                borderSide: BorderSide(
                                                  color: Colors.grey,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Colors.green,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Colors.red,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
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
                                            // validator: _model
                                            //     .textController3Validator
                                            //     .asValidator(context),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Align(
                                alignment:
                                    const AlignmentDirectional(-1.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
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
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 15.0),
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    child: TextFormField(
                                      // controller: _model.textController4,
                                      // focusNode: _model.textFieldFocusNode4,
                                      autofocus: true,
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
                                          borderSide: BorderSide(
                                            color: Colors.grey,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.green,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.red,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
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
                                      // validator: _model.textController4Validator
                                      //     .asValidator(context),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment:
                                    const AlignmentDirectional(-1.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 20.0, 0.0, 4.0),
                                  child: Text(
                                    'Country',
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
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 15.0),
                                  child: SizedBox(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    height: 50.0,
                                    child: DropdownButtonFormField<String>(
                                      items: [],
                                      // value: country,
                                      onChanged: (value) {
                                        // setState(() {
                                        //   country = value;
                                        // });
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
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              16.0, 4.0, 16.0, 4.0),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment:
                                    const AlignmentDirectional(-1.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 20.0, 0.0, 4.0),
                                  child: Text(
                                    'State',
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
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 15.0),
                                  child: SizedBox(
                                    width: MediaQuery.sizeOf(context).width * 1,
                                    height: 50.0,
                                    child: DropdownButtonFormField<String>(
                                      items: [],
                                      // value: country,
                                      onChanged: (value) {
                                        // setState(() {
                                        //   country = value;
                                        // });
                                      },
                                      hint: const Text('+1'),
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
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              16.0, 4.0, 16.0, 4.0),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment:
                                    const AlignmentDirectional(-1.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 20.0, 0.0, 4.0),
                                  child: Text(
                                    'City',
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
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 15.0),
                                  child: SizedBox(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    height: 50.0,
                                    child: DropdownButtonFormField<String>(
                                      items: [],
                                      // value: country,
                                      onChanged: (value) {
                                        // setState(() {
                                        //   country = value;
                                        // });
                                      },
                                      hint: const Text('+1'),
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
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              16.0, 4.0, 16.0, 4.0),
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
                                      backgroundColor:
                                          const WidgetStatePropertyAll(
                                              // cardtype.text != '' &&
                                              //         cardno.text != '' &&
                                              //         _image != null &&
                                              //         _image2 != null &&
                                              //         country.text != '' &&
                                              //         state.text != '' &&
                                              1 != 0
                                                  ? const Color(0xFFE10E0E)
                                                  : Colors.grey),
                                    ),
                                    onPressed: () async {
                                      // if (_formKey.currentState!.validate()) {
                                      //   _formKey.currentState!.save();
                                      //   updateKYC(ct, cn, country.text, state.text,
                                      //       city.text, _image!, _image2!);
                                      //   // upload to firebase
                                      // }
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
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
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
                                              color: Color(0xFFe10e0e)
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
                                          color: Color(0xFFe10e0e)
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
