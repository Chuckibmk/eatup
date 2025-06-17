import 'package:eatup/routes/route_names.dart';
import 'package:eatup/widgets/mycontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:eatup/widgets/products.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  // final arg = Get.arguments;
  final CartController c = Get.find();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
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
                    side:
                        const BorderSide(width: 1.0, color: Colors.transparent),
                  ),
                ),
                backgroundColor: WidgetStateProperty.all<Color>(
                  const Color(0xECF2B8B8),
                ),
                fixedSize:
                    WidgetStateProperty.all<Size>(const Size.square(60.0)),
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
            'Cart',
            style: GoogleFonts.readexPro(
              textStyle: Theme.of(context).textTheme.headlineMedium,
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
              mainAxisSize: MainAxisSize.min,
              children: [
                Obx(
                  () => c.cartItems.isNotEmpty
                      ? Column(
                          children: [
                            Obx(
                              () => Container(
                                width: double.infinity,
                                // width: 396.0,
                                height: 210 * c.itemCount.toDouble(),
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
                                          alignment: const AlignmentDirectional(
                                              -1.0, 0.0),
                                          child: Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(10.0, 20.0, 0.0, 0.0),
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
                                        Obx(() => Column(
                                              children:
                                                  c.cartItems.map((items) {
                                                return Column(
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        IconButton(
                                                          style: ButtonStyle(
                                                            shape: WidgetStateProperty
                                                                .all<
                                                                    RoundedRectangleBorder>(
                                                              RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10.0),
                                                                side: const BorderSide(
                                                                    width: 1.0,
                                                                    color: Colors
                                                                        .transparent),
                                                              ),
                                                            ),
                                                            fixedSize:
                                                                WidgetStateProperty.all<
                                                                        Size>(
                                                                    const Size
                                                                        .square(
                                                                        36.0)),
                                                          ),
                                                          onPressed: () {
                                                            // Get.toNamed(
                                                            //   item,
                                                            //   arguments: {
                                                            //     'id': items
                                                            //         .product.id,
                                                            //     'title': items
                                                            //         .product
                                                            //         .name,
                                                            //     // 'detail': items.product.details,
                                                            //     // 'image': it.image,
                                                            //     'price': items
                                                            //         .product
                                                            //         .price,
                                                            //   },
                                                            // );
                                                          },
                                                          icon: const Icon(
                                                            Icons.edit,
                                                            color: Color(
                                                                0xFFE10E0E),
                                                            size: 15.0,
                                                          ),
                                                        ),
                                                        Text(
                                                          items.product.name,
                                                          style: GoogleFonts
                                                              .readexPro(
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
                                                                      0.0,
                                                                      0.0,
                                                                      10.0,
                                                                      0.0),
                                                              child: IconButton(
                                                                style:
                                                                    ButtonStyle(
                                                                  shape: WidgetStateProperty
                                                                      .all<
                                                                          RoundedRectangleBorder>(
                                                                    RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              20.0),
                                                                      side: const BorderSide(
                                                                          width:
                                                                              1.0,
                                                                          color:
                                                                              Colors.transparent),
                                                                    ),
                                                                  ),
                                                                  fixedSize: WidgetStateProperty.all<
                                                                          Size>(
                                                                      const Size
                                                                          .square(
                                                                          30.0)),
                                                                ),
                                                                onPressed: () {
                                                                  c.deleteFromCart(
                                                                      Product(
                                                                          id: items
                                                                              .product
                                                                              .id,
                                                                          name: items
                                                                              .product
                                                                              .name,
                                                                          price: items
                                                                              .product
                                                                              .price),
                                                                      context);
                                                                },
                                                                icon:
                                                                    const Icon(
                                                                  Icons
                                                                      .delete_sharp,
                                                                  color: Color(
                                                                      0xFFE10E0E),
                                                                  size: 25.0,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                  50.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                          child: RichText(
                                                            textScaler:
                                                                MediaQuery.of(
                                                                        context)
                                                                    .textScaler,
                                                            text: TextSpan(
                                                              children: [
                                                                TextSpan(
                                                                  text: 'NGN ',
                                                                  style: GoogleFonts
                                                                      .readexPro(
                                                                    textStyle: Theme.of(
                                                                            context)
                                                                        .textTheme
                                                                        .bodyMedium,
                                                                    color: const Color
                                                                        .fromARGB(
                                                                        255,
                                                                        90,
                                                                        90,
                                                                        90),
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                                ),
                                                                TextSpan(
                                                                  text:
                                                                      '${items.product.price * c.getProductQuantity(items.product.id)}',
                                                                  style:
                                                                      const TextStyle(),
                                                                ),
                                                              ],
                                                              style: GoogleFonts
                                                                  .readexPro(
                                                                textStyle: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .bodyMedium,
                                                                color: const Color
                                                                    .fromARGB(
                                                                    255,
                                                                    90,
                                                                    90,
                                                                    90),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 17,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                            child: Container()),
                                                        Expanded(
                                                          child: Align(
                                                            alignment:
                                                                const AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                IconButton(
                                                                  constraints: const BoxConstraints(
                                                                      maxHeight:
                                                                          25,
                                                                      maxWidth:
                                                                          25),
                                                                  style:
                                                                      ButtonStyle(
                                                                    shape: WidgetStateProperty
                                                                        .all<
                                                                            RoundedRectangleBorder>(
                                                                      RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(20.0),
                                                                        side: const BorderSide(
                                                                            width:
                                                                                1.0,
                                                                            color:
                                                                                Colors.transparent),
                                                                      ),
                                                                    ),
                                                                    backgroundColor:
                                                                        WidgetStateProperty.all<
                                                                            Color>(
                                                                      const Color(
                                                                          0xFFE10E0E),
                                                                    ),
                                                                  ),
                                                                  onPressed: () => c.removeFromCart(
                                                                      Product(
                                                                          id: items
                                                                              .product
                                                                              .id,
                                                                          name: items
                                                                              .product
                                                                              .name,
                                                                          price: items
                                                                              .product
                                                                              .price),
                                                                      context),
                                                                  icon:
                                                                      const Icon(
                                                                    Icons
                                                                        .remove,
                                                                    color: Colors
                                                                        .white,
                                                                    size: 10.0,
                                                                  ),
                                                                ),
                                                                // SizedBox(width: 5),
                                                                Obx(() {
                                                                  return Text(
                                                                      c
                                                                          .getProductQuantity(items
                                                                              .product
                                                                              .id)
                                                                          .toString(),
                                                                      style: const TextStyle(
                                                                          fontSize:
                                                                              15));
                                                                }),

                                                                IconButton(
                                                                  constraints: const BoxConstraints(
                                                                      maxHeight:
                                                                          25,
                                                                      maxWidth:
                                                                          25),
                                                                  style:
                                                                      ButtonStyle(
                                                                    shape: WidgetStateProperty
                                                                        .all<
                                                                            RoundedRectangleBorder>(
                                                                      RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(20.0),
                                                                        side: const BorderSide(
                                                                            width:
                                                                                1.0,
                                                                            color:
                                                                                Colors.transparent),
                                                                      ),
                                                                    ),
                                                                    backgroundColor:
                                                                        WidgetStateProperty.all<
                                                                            Color>(
                                                                      const Color(
                                                                          0xFFE10E0E),
                                                                    ),
                                                                  ),
                                                                  onPressed: () => c.addToCart(
                                                                      Product(
                                                                          id: items
                                                                              .product
                                                                              .id,
                                                                          name: items
                                                                              .product
                                                                              .name,
                                                                          price: items
                                                                              .product
                                                                              .price),
                                                                      context),
                                                                  icon:
                                                                      const Icon(
                                                                    Icons.add,
                                                                    color: Colors
                                                                        .white,
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
                                            )),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: double.infinity,
                              height: 170.0,
                              // decoration: BoxDecoration(
                              //   color: Colors.grey,
                              // ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Align(
                                    alignment:
                                        const AlignmentDirectional(0.0, 0.0),
                                    child: SizedBox(
                                      width: 300.0,
                                      height: 50.0,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          Get.toNamed(login);
                                        },
                                        style: ButtonStyle(
                                          elevation:
                                              WidgetStateProperty.all<double>(
                                                  3.0),
                                          backgroundColor:
                                              WidgetStateProperty.all<Color>(
                                            const Color(0xFFE10E0E),
                                          ),
                                          padding: WidgetStateProperty.all<
                                              EdgeInsets>(
                                            const EdgeInsets.fromLTRB(
                                                30.0, 0, 30.0, 0),
                                          ),
                                          shape: WidgetStateProperty.all<
                                              RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              side: const BorderSide(
                                                color: Colors.transparent,
                                                width: 1,
                                              ),
                                            ),
                                          ),
                                        ),
                                        child: Text(
                                          'Login To Checkout',
                                          style: GoogleFonts.readexPro(
                                            textStyle: Theme.of(context)
                                                .textTheme
                                                .titleSmall,
                                            color: Colors.white,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                            fontSize: 20,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    child: Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              20.0, 0.0, 20.0, 0.0),
                                      child: SizedBox(
                                        width: 300.0,
                                        height: 50.0,
                                        child: ElevatedButton(
                                          onPressed: () {},
                                          style: ButtonStyle(
                                            elevation:
                                                WidgetStateProperty.all<double>(
                                                    3.0),
                                            padding: WidgetStateProperty.all<
                                                EdgeInsets>(
                                              const EdgeInsets.fromLTRB(
                                                  24, 0, 24, 0),
                                            ),
                                            backgroundColor:
                                                WidgetStateProperty.all<Color>(
                                                    Colors.white),
                                            shape: WidgetStateProperty.all<
                                                RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                side: const BorderSide(
                                                  color: Color(0xFFE10E0E),
                                                  width: 3,
                                                ),
                                              ),
                                            ),
                                          ),
                                          child: Text(
                                            'Check Out As Guest',
                                            style: GoogleFonts.readexPro(
                                              textStyle: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall,
                                              color: const Color(0xFFE10E0E),
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.normal,
                                              fontSize: 20,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      : Column(
                          // mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              padding: EdgeInsets.only(top: 150),
                              height: MediaQuery.of(context).size.height * 0.60,
                              // alignment: const AlignmentDirectional(0.0, 0.0),
                              child: Column(
                                children: [
                                  Center(
                                    child: SizedBox(
                                      height: 200,
                                      width: 200,
                                      child: Card(
                                        clipBehavior:
                                            Clip.antiAliasWithSaveLayer,
                                        color: const Color(0XFFe0e3e7),
                                        elevation: 0.0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(40.0),
                                        ),
                                        child: const Opacity(
                                          opacity: 0.5,
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: FaIcon(
                                              FontAwesomeIcons.basketShopping,
                                              color: Color(0xFF57636c),
                                              size: 100.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'Your cart is empty',
                                    style: GoogleFonts.readexPro(
                                        fontSize: 20.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                        color: const Color.fromARGB(
                                            255, 84, 84, 84)),
                                  ),
                                ],
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
                                    'Go to home',
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
// this syntax should be be if theres a child in cart items, as of last update theres non:
// Row(
                                        //   mainAxisSize: MainAxisSize.max,
                                        //   children: [
                                        //     Padding(
                                        //       padding: const EdgeInsetsDirectional.fromSTEB(
                                        //           50.0, 0.0, 0.0, 0.0),
                                        //       child: RichText(
                                        //         textScaler: MediaQuery.of(context).textScaler,
                                        //         text: TextSpan(
                                        //           children: [
                                        //             TextSpan(
                                        //               text: '1x ',
                                        //               style: GoogleFonts.readexPro(
                                        //                 textStyle: Theme.of(context)
                                        //                     .textTheme
                                        //                     .bodyMedium,
                                        //                 color: const Color.fromARGB(
                                        //                     255, 90, 90, 90),
                                        //                 fontSize: 15.0,
                                        //                 letterSpacing: 0.0,
                                        //                 fontWeight: FontWeight.bold,
                                        //               ),
                                        //             ),
                                        //             const TextSpan(
                                        //               text: 'Fried Egg',
                                        //               style: TextStyle(),
                                        //             )
                                        //           ],
                                        //           style: GoogleFonts.readexPro(
                                        //             textStyle: Theme.of(context)
                                        //                 .textTheme
                                        //                 .bodyMedium,
                                        //             color:
                                        //                 const Color.fromARGB(255, 54, 54, 54),
                                        //             fontSize: 15.0,
                                        //             letterSpacing: 0.0,
                                        //           ),
                                        //         ),
                                        //       ),
                                        //     ),
                                        //   ],
                                        // ),