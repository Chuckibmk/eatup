import 'package:eatup/widgets/mycontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:eatup/widgets/products.dart';
import 'package:eatup/routes/route_names.dart';

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
        actions: const [],
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
              height: 100,
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
                            10.0, 20.0, 0.0, 0.0),
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
                  ]),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              // width: 396.0,
              // height: 100 + (100 * c.itemCount.toDouble()),
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
          ],
        ),
      )),
    );
  }
}
