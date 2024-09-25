import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class KYC extends StatefulWidget {
  const KYC({super.key});

  @override
  State<KYC> createState() => _KYCState();
}

class _KYCState extends State<KYC> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  // final _formKey = GlobalKey<FormState>();

  String ct = '';
  String cn = '';
  String? country = '';
  String? state = '';
  String? city = '';

  final cardtype = TextEditingController();
  final ctfn = FocusNode();

  final cardno = TextEditingController();
  final cnfn = FocusNode();

  // final cntry = drop
  List<String> listOfcntry = ['USA', 'UK', 'NZ'];
  List<String> listOfstate = ['ABIA', 'ENU', 'ABJ'];
  List<String> listOfcity = ['LAG', 'LON', 'NYC'];

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
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          child: TextFormField(
                            controller: cardtype,
                            focusNode: ctfn,
                            autofocus: true,
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
                                  color: Color(0xFF4b39ef),
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
                              textStyle: Theme.of(context).textTheme.bodyMedium,
                              fontSize: 14,
                              letterSpacing: 0.0,
                            ),
                            // validator: _model.textController1Validator
                            //     .asValidator(context),
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
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          child: TextFormField(
                            controller: cardno,
                            focusNode: cnfn,
                            autofocus: true,
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
                              textStyle: Theme.of(context).textTheme.bodyMedium,
                              fontSize: 14,
                              letterSpacing: 0.0,
                            ),
                            // validator: _model.textController2Validator
                            //     .asValidator(context),
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
                    Container(
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
                              child: Text(
                                'Upload Image',
                                style: GoogleFonts.readexPro(
                                  textStyle:
                                      Theme.of(context).textTheme.bodyMedium,
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
                          Text(
                            'Upload Image',
                            style: GoogleFonts.readexPro(
                              textStyle: Theme.of(context).textTheme.bodyMedium,
                              fontSize: 14,
                              color: const Color(0xFFE10E0E),
                              letterSpacing: 0.0,
                            ),
                          ),
                        ],
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
                          'Country',
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
                        child: DropdownButtonFormField<String>(
                          items: [],
                          value: country,
                          onChanged: (value) {
                            setState(() {
                              country = value;
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
                            textStyle: Theme.of(context).textTheme.bodyMedium,
                            fontSize: 14,
                            letterSpacing: 0.0,
                          ),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0xffe0e3e7),
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 4.0, 16.0, 4.0),
                        ),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(-1.0, 0.0),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 20.0, 0.0, 4.0),
                        child: Text(
                          'State',
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
                        child: DropdownButtonFormField<String>(
                          items: [],
                          value: state,
                          onChanged: (value) {
                            setState(() {
                              state = value;
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
                            textStyle: Theme.of(context).textTheme.bodyMedium,
                            fontSize: 14,
                            letterSpacing: 0.0,
                          ),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0xffe0e3e7),
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 4.0, 16.0, 4.0),
                        ),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(-1.0, 0.0),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 20.0, 0.0, 4.0),
                        child: Text(
                          'City',
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
                        child: DropdownButtonFormField<String>(
                          items: [],
                          value: city,
                          onChanged: (value) {
                            setState(() {
                              city = value;
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
                            textStyle: Theme.of(context).textTheme.bodyMedium,
                            fontSize: 14,
                            letterSpacing: 0.0,
                          ),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0xffe0e3e7),
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 4.0, 16.0, 4.0),
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
                                side: const BorderSide(
                                  color: Colors.transparent,
                                  width: double.infinity,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                            elevation: const WidgetStatePropertyAll(3.0),
                            backgroundColor: WidgetStatePropertyAll(
                                cardtype.text != '' && cardno.text != ''
                                    ? const Color(0xFFE10E0E)
                                    : Colors.grey),
                          ),
                          onPressed: () async {},
                          child: Text(
                            'Submit',
                            style: GoogleFonts.readexPro(
                              textStyle: Theme.of(context).textTheme.titleSmall,
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
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
