import 'package:flutter/material.dart';

class Product extends StatefulWidget {
  const Product({super.key});

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
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
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          'https://images.unsplash.com/photo-1674456720401-1557c76bf72c?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxNHx8c3BhZ2hldHRpfGVufDB8fHx8MTcyMzYzNzk4M3ww&ixlib=rb-4.0.3&q=80&w=1080',
                        ),
                      ),
                    ),
                    child: Align(
                      alignment: const AlignmentDirectional(0.0, -1.0),
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
                                  backgroundColor:
                                      WidgetStateProperty.all<Color>(
                                    const Color(0x6EE10E0E),
                                  ),
                                  fixedSize: WidgetStateProperty.all<Size>(
                                    const Size.square(40.0),
                                  ),
                                ),
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.add,
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
                                          width: 1.0,
                                          color: Colors.transparent),
                                    ),
                                  ),
                                  backgroundColor:
                                      WidgetStateProperty.all<Color>(
                                    const Color(0x6EE10E0E),
                                  ),
                                  fixedSize: WidgetStateProperty.all<Size>(
                                    const Size.square(40.0),
                                  ),
                                ),
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.shopping_cart,
                                  color: Color(0xFFE10E0E),
                                  size: 25.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 20.0, 0.0, 35.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Stephanies\'s Cook',
                                style: TextStyle(
                                  fontFamily: 'Outfit',
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 25,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                      0.0,
                      0.0,
                      0.0,
                      35.0,
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 20.0, 0.0),
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                elevation: WidgetStateProperty.all<double>(3.0),
                                shape: WidgetStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    side: const BorderSide(
                                      width: 1.0,
                                      color: Colors.transparent,
                                    ),
                                  ),
                                ),
                                backgroundColor: WidgetStateProperty.all<Color>(
                                  const Color(0x6EE10E0E),
                                ),
                                fixedSize: WidgetStateProperty.all<Size>(
                                  const Size.fromHeight(40.0),
                                ),
                              ),
                              child: const Text(
                                'Breakfast',
                                style: TextStyle(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 20.0, 0.0),
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                elevation: WidgetStateProperty.all<double>(3.0),
                                shape: WidgetStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    side: const BorderSide(
                                      width: 1.0,
                                      color: Colors.transparent,
                                    ),
                                  ),
                                ),
                                backgroundColor: WidgetStateProperty.all<Color>(
                                  Colors.transparent,
                                ),
                                fixedSize: WidgetStateProperty.all<Size>(
                                  const Size.fromHeight(40.0),
                                ),
                              ),
                              child: const Text(
                                'Snacks',
                                style: TextStyle(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 20.0, 0.0),
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                elevation: WidgetStateProperty.all<double>(3.0),
                                shape: WidgetStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    side: const BorderSide(
                                      width: 1.0,
                                      color: Colors.transparent,
                                    ),
                                  ),
                                ),
                                backgroundColor: WidgetStateProperty.all<Color>(
                                  Colors.transparent,
                                ),
                                fixedSize: WidgetStateProperty.all<Size>(
                                  const Size.fromHeight(40.0),
                                ),
                              ),
                              child: const Text(
                                'Grills',
                                style: TextStyle(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 20.0, 0.0),
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                elevation: WidgetStateProperty.all<double>(3.0),
                                shape: WidgetStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    side: const BorderSide(
                                      width: 1.0,
                                      color: Colors.transparent,
                                    ),
                                  ),
                                ),
                                backgroundColor: WidgetStateProperty.all<Color>(
                                  Colors.transparent,
                                ),
                                fixedSize: WidgetStateProperty.all<Size>(
                                  const Size.fromHeight(40.0),
                                ),
                              ),
                              child: const Text(
                                'Cakes',
                                style: TextStyle(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ListView(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    children: [
                      Container(
                        width: 100.0,
                        height: 161.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 15.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'breakfast',
                                    style: TextStyle(
                                      fontFamily: 'Readex Pro',
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
