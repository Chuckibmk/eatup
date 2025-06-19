import 'package:country_state_city_pro/country_state_city_pro.dart';
import 'package:eatup/widgets/mycontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:eatup/widgets/products.dart';
import 'package:eatup/routes/route_names.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class Checkout extends StatefulWidget {
  const Checkout({super.key});

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  List<List> ck = [
    ['Subtotal', 'NGN 2100'],
    ['Service Fee', 'NGN 210'],
    ['Insurance Fee', 'NGN 0'],
    ['Tax Fee', 'NGN 4'],
    ['Delivery Fee', 'NGN 50'],
    ['Discount', 'NGN 0'],
  ];
  final CartController c = Get.find();
  final coupon = TextEditingController();
  final cpcn = FocusNode();

  final rname = TextEditingController();
  final rncn = FocusNode();

  final phoneno = TextEditingController();
  final pncn = FocusNode();

  final email = TextEditingController();
  final emcn = FocusNode();

  final stradd = TextEditingController();
  final safn = FocusNode();

  final country = TextEditingController();
  final state = TextEditingController();
  final city = TextEditingController();

  bool couponvisible = false;
  bool deliveryvisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
        actions: [
          IconButton(
              style: ButtonStyle(
                fixedSize: WidgetStateProperty.all<Size>(const Size.square(60)),
              ),
              onPressed: () {
                Get.toNamed(cart);
              },
              icon: Badge(
                label: Obx(() => Text(c.itemCount.toString())),
                child: const Icon(
                  Icons.shopping_cart,
                  color: Color(0xFFE10E0E),
                  size: 25.0,
                ),
              )),
        ],
        centerTitle: false,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
          child: SafeArea(
        top: true,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: double.infinity,
              // width: 396.0,
              // height: 100,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(
                    15.0, 10.0, 15.0, 10.0),
                child: Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  color: Colors.white,
                  elevation: 4.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(mainAxisSize: MainAxisSize.max, children: [
                    Align(
                      alignment: const AlignmentDirectional(-1.0, 0.0),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            10.0, 10.0, 0.0, 0.0),
                        child: Text(
                          'Contact Details',
                          style: GoogleFonts.readexPro(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.0,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    const Divider(
                      thickness: 1.0,
                      indent: 10.0,
                      endIndent: 10.0,
                      color: Color(0xCCABA5A5),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: 32.0,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Text(
                        'Please complete your contact information and click "Pay Now" to complete your order',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.readexPro(
                          textStyle: Theme.of(context).textTheme.labelMedium,
                          letterSpacing: 0.0,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 20, bottom: 20),
                      width: MediaQuery.sizeOf(context).width * 0.85,
                      child: Column(
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(-1.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 4.0),
                              child: Text(
                                'Name',
                                textAlign: TextAlign.start,
                                style: GoogleFonts.readexPro(
                                  textStyle:
                                      Theme.of(context).textTheme.bodyMedium,
                                  fontSize: 14,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: TextFormField(
                              controller: rname,
                              focusNode: rncn,
                              autofocus: false,
                              obscureText: false,
                              decoration: InputDecoration(
                                hintText: 'Enter Name',
                                alignLabelWithHint: false,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.grey,
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
                                    color: Colors.orange,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.red,
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
                                // fontWeight: FontWeight.bold,
                              ),
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return 'Fill in Recipient Name';
                                }
                                return null;
                              },
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(-1.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 4.0),
                              child: Text(
                                'Email',
                                textAlign: TextAlign.start,
                                style: GoogleFonts.readexPro(
                                  textStyle:
                                      Theme.of(context).textTheme.bodyMedium,
                                  fontSize: 14,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: TextFormField(
                              controller: email,
                              focusNode: emcn,
                              autofocus: false,
                              obscureText: false,
                              decoration: InputDecoration(
                                hintText: 'Enter email address',
                                alignLabelWithHint: false,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.grey,
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
                                    color: Colors.orange,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.red,
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
                                // fontWeight: FontWeight.bold,
                              ),
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return 'Fill in Recipient Name';
                                }
                                return null;
                              },
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(-1.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 4.0),
                              child: Text(
                                'Phone Number',
                                textAlign: TextAlign.start,
                                style: GoogleFonts.readexPro(
                                  textStyle:
                                      Theme.of(context).textTheme.bodyMedium,
                                  fontSize: 14,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: const Alignment(0.0, 0.0),
                            child: IntlPhoneField(
                              controller: phoneno,
                              focusNode: pncn,
                              decoration: InputDecoration(
                                hintText: 'Enter phone number',
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0xffe0e3e7),
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                              initialCountryCode: 'US',
                              // onChanged: (phone) {
                              //   print(phone.completeNumber);
                              // },
                              validator: (val) {
                                if (val?.completeNumber != null) {
                                  return 'Fill in Phone Number';
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(-1.0, 0.0),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            10.0, 0.0, 0.0, 0.0),
                        child: Text(
                          'Delivery Details',
                          style: GoogleFonts.readexPro(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.0,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(-1.0, 0.0),
                      child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 0.0, 0.0),
                          child: ListTile(
                            leading: Icon(
                              Icons.error_outline,
                              color: Colors.red,
                            ),
                            title: Text(
                              'Kindly fill in address details if this order must be delivered to your current location',
                              textAlign: TextAlign.left,
                              style: GoogleFonts.readexPro(
                                textStyle:
                                    Theme.of(context).textTheme.bodySmall,
                                letterSpacing: 0.0,
                              ),
                            ),
                            trailing: IconButton(
                                onPressed: () => setState(() {
                                      deliveryvisible = !deliveryvisible;
                                    }),
                                icon: Icon(deliveryvisible
                                    ? Icons.keyboard_arrow_up_outlined
                                    : Icons.keyboard_arrow_down_outlined)),
                          )),
                    ),
                    Container(
                      width: MediaQuery.sizeOf(context).width * 0.85,
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Visibility(
                        visible: deliveryvisible,
                        child: Column(
                          children: [
                            Align(
                              alignment: const AlignmentDirectional(-1.0, 0.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 4.0),
                                child: Text(
                                  'Street Address',
                                  textAlign: TextAlign.start,
                                  style: GoogleFonts.readexPro(
                                    textStyle:
                                        Theme.of(context).textTheme.bodyMedium,
                                    fontSize: 14,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(-1.0, 0.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 4.0),
                                child: SizedBox(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  child: TextFormField(
                                    controller: stradd,
                                    focusNode: safn,
                                    autofocus: false,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      hintText: 'Enter Street Address',
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
                                      focusedErrorBorder: OutlineInputBorder(
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
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(-1.0, 0.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 20.0, 0.0, 4.0),
                                child: Text(
                                  'Location',
                                  textAlign: TextAlign.start,
                                  style: GoogleFonts.readexPro(
                                    textStyle:
                                        Theme.of(context).textTheme.bodyMedium,
                                    fontSize: 14,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(-1.0, 0.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 4.0),
                                child: SizedBox(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
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
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(-1.0, 0.0),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            10.0, 0.0, 0.0, 0.0),
                        child: Text(
                          'Add a coupon (optional)',
                          style: GoogleFonts.readexPro(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.0,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(-1.0, 0.0),
                      child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 0.0, 0.0),
                          child: ListTile(
                            leading: const Icon(
                              Icons.error_outline,
                              color: Colors.red,
                            ),
                            title: Text(
                              'If you have a coupon code, please apply it below',
                              textAlign: TextAlign.left,
                              style: GoogleFonts.readexPro(
                                textStyle:
                                    Theme.of(context).textTheme.bodySmall,
                                letterSpacing: 0.0,
                              ),
                            ),
                            trailing: IconButton(
                                onPressed: () => setState(() {
                                      couponvisible = !couponvisible;
                                    }),
                                icon: Icon(couponvisible
                                    ? Icons.keyboard_arrow_up_outlined
                                    : Icons.keyboard_arrow_down_outlined)),
                          )),
                    ),
                    Container(
                      width: MediaQuery.sizeOf(context).width * 0.85,
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Visibility(
                        visible: couponvisible,
                        child: Column(
                          children: [
                            Align(
                              alignment: const AlignmentDirectional(-1.0, 0.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 4.0),
                                child: Text(
                                  'Coupon',
                                  textAlign: TextAlign.start,
                                  style: GoogleFonts.readexPro(
                                    textStyle:
                                        Theme.of(context).textTheme.bodyMedium,
                                    fontSize: 14,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Align(
                                  alignment:
                                      const AlignmentDirectional(-1.0, 0.0),
                                  child: SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
                                    child: TextFormField(
                                      controller: coupon,
                                      focusNode: cpcn,
                                      autofocus: false,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        hintText: 'Enter Coupon',
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
                                        focusedErrorBorder: OutlineInputBorder(
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
                                          return 'Enter Coupon';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment:
                                      const AlignmentDirectional(1.0, 0.0),
                                  child: SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      style: ButtonStyle(
                                        backgroundColor:
                                            const WidgetStatePropertyAll(
                                                Color(0xFFE10E0E)),
                                        elevation:
                                            const WidgetStatePropertyAll(3.0),
                                        shape: WidgetStatePropertyAll(
                                          RoundedRectangleBorder(
                                            side: const BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                        ),
                                      ),
                                      child: Text(
                                        'Apply',
                                        style: GoogleFonts.readexPro(
                                          color: Colors.white,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ]),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(
                    15.0, 10.0, 15.0, 10.0),
                child: Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  color: Colors.white,
                  elevation: 4.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(-1.0, 0.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              10.0, 20.0, 0.0, 0.0),
                          child: Text(
                            'Product Summary',
                            style: GoogleFonts.readexPro(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.0,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                      const Divider(
                        thickness: 1.0,
                        indent: 10.0,
                        endIndent: 10.0,
                        color: Color(0xCCABA5A5),
                      ),
                      Obx(() => SizedBox(
                            height: (100 * c.itemCount.toDouble()),
                            child: Column(
                              children: c.cartItems.map((items) {
                                return Column(
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        IconButton(
                                          style: ButtonStyle(
                                            shape: WidgetStateProperty.all<
                                                RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                side: const BorderSide(
                                                    width: 1.0,
                                                    color: Colors.transparent),
                                              ),
                                            ),
                                            fixedSize:
                                                WidgetStateProperty.all<Size>(
                                                    const Size.square(36.0)),
                                          ),
                                          onPressed: () {
                                            Get.toNamed(
                                              item,
                                              arguments: {
                                                'id': items.product.id,
                                                'title': items.product.name,
                                                'detail': items.product.details,
                                                'image': items.product.image,
                                                'price': items.product.price,
                                              },
                                            );
                                          },
                                          icon: const Icon(
                                            Icons.edit,
                                            color: Color(0xFFE10E0E),
                                            size: 15.0,
                                          ),
                                        ),
                                        Text(
                                          items.product.name,
                                          style: GoogleFonts.readexPro(
                                            letterSpacing: 0.0,
                                            fontSize: 20,
                                          ),
                                        ),
                                        Expanded(
                                          child: Align(
                                            alignment:
                                                const AlignmentDirectional(
                                                    1.0, 0.0),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                      0.0, 0.0, 10.0, 0.0),
                                              child: IconButton(
                                                style: ButtonStyle(
                                                  shape: WidgetStateProperty.all<
                                                      RoundedRectangleBorder>(
                                                    RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.0),
                                                      side: const BorderSide(
                                                          width: 1.0,
                                                          color: Colors
                                                              .transparent),
                                                    ),
                                                  ),
                                                  fixedSize: WidgetStateProperty
                                                      .all<Size>(
                                                          const Size.square(
                                                              30.0)),
                                                ),
                                                onPressed: () {
                                                  c.deleteFromCart(
                                                      Product(
                                                          id: items.product.id,
                                                          name: items
                                                              .product.name,
                                                          price: items
                                                              .product.price),
                                                      context);
                                                },
                                                icon: const Icon(
                                                  Icons.delete_sharp,
                                                  color: Color(0xFFE10E0E),
                                                  size: 25.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(50.0, 0.0, 0.0, 0.0),
                                          child: RichText(
                                            textScaler: MediaQuery.of(context)
                                                .textScaler,
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: 'NGN ',
                                                  style: GoogleFonts.readexPro(
                                                    textStyle: Theme.of(context)
                                                        .textTheme
                                                        .bodyMedium,
                                                    color: const Color.fromARGB(
                                                        255, 90, 90, 90),
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text:
                                                      '${items.product.price * c.getProductQuantity(items.product.id)}',
                                                  style: const TextStyle(),
                                                ),
                                              ],
                                              style: GoogleFonts.readexPro(
                                                textStyle: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium,
                                                color: const Color.fromARGB(
                                                    255, 90, 90, 90),
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 17,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(child: Container()),
                                        Expanded(
                                          child: Align(
                                            alignment:
                                                const AlignmentDirectional(
                                                    0.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                IconButton(
                                                  constraints:
                                                      const BoxConstraints(
                                                          maxHeight: 25,
                                                          maxWidth: 25),
                                                  style: ButtonStyle(
                                                    shape: WidgetStateProperty.all<
                                                        RoundedRectangleBorder>(
                                                      RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20.0),
                                                        side: const BorderSide(
                                                            width: 1.0,
                                                            color: Colors
                                                                .transparent),
                                                      ),
                                                    ),
                                                    backgroundColor:
                                                        WidgetStateProperty.all<
                                                            Color>(
                                                      const Color(0xFFE10E0E),
                                                    ),
                                                  ),
                                                  onPressed: () =>
                                                      c.removeFromCart(
                                                          Product(
                                                              id: items
                                                                  .product.id,
                                                              name: items
                                                                  .product.name,
                                                              price: items
                                                                  .product
                                                                  .price),
                                                          context),
                                                  icon: const Icon(
                                                    Icons.remove,
                                                    color: Colors.white,
                                                    size: 10.0,
                                                  ),
                                                ),
                                                // SizedBox(width: 5),
                                                Obx(() {
                                                  return Text(
                                                      c
                                                          .getProductQuantity(
                                                              items.product.id)
                                                          .toString(),
                                                      style: const TextStyle(
                                                          fontSize: 15));
                                                }),

                                                IconButton(
                                                  constraints:
                                                      const BoxConstraints(
                                                          maxHeight: 25,
                                                          maxWidth: 25),
                                                  style: ButtonStyle(
                                                    shape: WidgetStateProperty.all<
                                                        RoundedRectangleBorder>(
                                                      RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20.0),
                                                        side: const BorderSide(
                                                            width: 1.0,
                                                            color: Colors
                                                                .transparent),
                                                      ),
                                                    ),
                                                    backgroundColor:
                                                        WidgetStateProperty.all<
                                                            Color>(
                                                      const Color(0xFFE10E0E),
                                                    ),
                                                  ),
                                                  onPressed: () => c.addToCart(
                                                      Product(
                                                          id: items.product.id,
                                                          name: items
                                                              .product.name,
                                                          price: items
                                                              .product.price),
                                                      context),
                                                  icon: const Icon(
                                                    Icons.add,
                                                    color: Colors.white,
                                                    size: 10.0,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                );
                              }).toList(),
                            ),
                          )),
                      const Divider(
                        thickness: 1.0,
                        indent: 10.0,
                        endIndent: 10.0,
                        color: Color(0xCCABA5A5),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(-1.0, 0.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              10.0, 20.0, 0.0, 0.0),
                          child: Text(
                            'Payment Summary',
                            style: GoogleFonts.readexPro(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.0,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                      const Divider(
                        thickness: 1.0,
                        indent: 10.0,
                        endIndent: 10.0,
                        color: Color(0xCCABA5A5),
                      ),
                      Column(
                        children: [
                          for (var a in ck)
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Align(
                                      alignment:
                                          const AlignmentDirectional(-1.0, 0.0),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(10.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          a[0],
                                          style: GoogleFonts.readexPro(
                                            letterSpacing: 0.0,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Align(
                                      alignment:
                                          const AlignmentDirectional(1.0, 0.0),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(0.0, 0.0, 10.0, 0.0),
                                        child: Text(
                                          a[1],
                                          style: GoogleFonts.readexPro(
                                              letterSpacing: 0.0,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: const Divider(
                          thickness: 1.0,
                          indent: 10.0,
                          endIndent: 10.0,
                          color: Color(0xCCABA5A5),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Align(
                                alignment:
                                    const AlignmentDirectional(-1.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    'Total',
                                    style: GoogleFonts.readexPro(
                                      letterSpacing: 0.0,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Align(
                                alignment: const AlignmentDirectional(1.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 10.0, 0.0),
                                  child: Text(
                                    'NGN 2364',
                                    style: GoogleFonts.readexPro(
                                        letterSpacing: 0.0,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(0.0, 0.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 67.0,
                child: ElevatedButton(
                  onPressed: () {
                    Get.offAllNamed(home);
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        const WidgetStatePropertyAll(Color(0xFFE10E0E)),
                    elevation: const WidgetStatePropertyAll(3.0),
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        side: const BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                  ),
                  child: Text(
                    'Continue',
                    style: GoogleFonts.readexPro(
                      color: Colors.white,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
