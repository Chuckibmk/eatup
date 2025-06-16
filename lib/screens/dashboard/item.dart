import 'package:eatup/routes/route_names.dart';
import 'package:eatup/widgets/mycontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:get/route_manager.dart';
import 'package:eatup/widgets/products.dart';

class Items extends StatelessWidget {
  Items({super.key});
  final arg = Get.arguments;
  final CartController c = Get.find();

  @override
  Widget build(BuildContext context) {
    print('ha: ${c.cartItems}');
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        top: true,
        child: Container(
          // width: double.infinity,
          width: 704.0,
          height: 826.0,
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Container(
            decoration: const BoxDecoration(),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 480.0,
                  height: 239.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                        fit: BoxFit.cover, image: MemoryImage(arg['image'])),
                  ),
                  child: Align(
                    alignment: const AlignmentDirectional(0.0, -1.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              15.0, 5.0, 0.0, 0.0),
                          child: IconButton(
                            style: ButtonStyle(
                              shape: WidgetStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  side: const BorderSide(
                                      width: 1.0, color: Colors.white),
                                ),
                              ),
                              backgroundColor: WidgetStateProperty.all<Color>(
                                Colors.white,
                              ),
                              fixedSize: WidgetStateProperty.all<Size>(
                                const Size.square(40.0),
                              ),
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
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0,
                            5.0,
                            15.0,
                            0.0,
                          ),
                          child: IconButton(
                            style: ButtonStyle(
                              shape: WidgetStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  side: const BorderSide(
                                      width: 1.0, color: Colors.transparent),
                                ),
                              ),
                              backgroundColor: WidgetStateProperty.all<Color>(
                                Colors.white,
                              ),
                              fixedSize: WidgetStateProperty.all<Size>(
                                const Size.square(40.0),
                              ),
                            ),
                            onPressed: () {
                              Get.toNamed(cart);
                            },
                            icon: Badge(
                              label: Text(c.itemCount.toString()),
                              child: const Icon(
                                Icons.shopping_cart,
                                color: Color(0xFFE10E0E),
                                size: 25.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(
                      20.0, 0.0, 20.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 20.0, 0.0, 20.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              arg['title'],
                              style: GoogleFonts.outfit(
                                textStyle:
                                    Theme.of(context).textTheme.titleLarge,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                                fontSize: 25,
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 10.0, 0.0, 10.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Text(
                                arg['detail'],
                                style: GoogleFonts.outfit(
                                  textStyle:
                                      Theme.of(context).textTheme.bodySmall,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 15,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 10.0, 0.0, 10.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'From \$${arg['price']}',
                              style: GoogleFonts.outfit(
                                textStyle:
                                    Theme.of(context).textTheme.bodyLarge,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                              ),
                            ),
                            Expanded(child: Container()),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: SizedBox(
                          width: double.infinity,
                          height: 60.0,
                          child: ElevatedButton(
                            onPressed: () => c.addToCart(
                                Product(
                                    id: arg['id'],
                                    name: arg['title'],
                                    price: double.parse(arg['price'])),
                                context),
                            style: ButtonStyle(
                              backgroundColor: const WidgetStatePropertyAll(
                                Color(0xFFE10E0E),
                              ),
                              elevation: const WidgetStatePropertyAll(3.0),
                              side: const WidgetStatePropertyAll(
                                BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                              ),
                              shape: WidgetStatePropertyAll(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            ),
                            child: Text(
                              'Add to Cart: ${arg['price']}',
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
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
