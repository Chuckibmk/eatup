import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final cont = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        drawer: Drawer(
          elevation: 16,
          child: Container(
            width: 100.0,
            height: 100.0,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        0.0, 40.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: const Alignment(-1.0, -1.0),
                          child: IconButton(
                              style: ButtonStyle(
                                shape: WidgetStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                              ),
                              onPressed: () {},
                              icon: const Icon(
                                Icons.home_filled,
                                color: Color(0xFFE10E0E),
                                size: 20.0,
                              )),
                        ),
                        Align(
                          alignment: Alignment(0.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                30.0, 0.0, 0.0, 0.0),
                            child: Text(
                              'Home',
                              style: TextStyle(
                                color: Colors.black,
                                letterSpacing: 0.0,
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(-1.0, -1.0),
                          child: IconButton(
                            // borderColor: Colors.transparent,
                            // borderRadius: 10.0,
                            // borderWidth: 1.0,
                            // buttonSize: 36.0,
                            // fillColor: Color(0x6EE10E0E),
                            icon: Icon(
                              Icons.restaurant,
                              color: Color(0xFFE10E0E),
                              size: 20.0,
                            ),
                            onPressed: () {
                              print('IconButton pressed ...');
                            },
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                30.0, 0.0, 0.0, 0.0),
                            child: Text(
                              'Restaurants',
                              style: TextStyle(
                                color: Colors.black,
                                letterSpacing: 0.0,
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(-1.0, -1.0),
                          child: IconButton(
                            // borderColor: Colors.transparent,
                            // borderRadius: 10.0,
                            // borderWidth: 1.0,
                            // buttonSize: 36.0,
                            // fillColor: Color(0x6EE10E0E),
                            icon: Icon(
                              Icons.fastfood_sharp,
                              color: Color(0xFFE10E0E),
                              size: 20.0,
                            ),
                            onPressed: () {
                              print('IconButton pressed ...');
                            },
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                30.0, 0.0, 0.0, 0.0),
                            child: Text(
                              'Food Packages',
                              style: TextStyle(
                                color: Colors.black,
                                letterSpacing: 0.0,
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(-1.0, -1.0),
                          child: IconButton(
                            // borderColor: Colors.transparent,
                            // borderRadius: 10.0,
                            // borderWidth: 1.0,
                            // buttonSize: 36.0,
                            // fillColor: Color(0x6EE10E0E),
                            icon: Icon(
                              Icons.store,
                              color: Color(0xFFE10E0E),
                              size: 20.0,
                            ),
                            onPressed: () {
                              print('IconButton pressed ...');
                            },
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                30.0, 0.0, 0.0, 0.0),
                            child: Text(
                              'Stores',
                              style: TextStyle(
                                color: Colors.black,
                                letterSpacing: 0.0,
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(-1.0, -1.0),
                          child: IconButton(
                            // borderColor: Colors.transparent,
                            // borderRadius: 10.0,
                            // borderWidth: 1.0,
                            // buttonSize: 36.0,
                            // fillColor: Color(0x6EE10E0E),
                            icon: Icon(
                              Icons.question_mark,
                              color: Color(0xFFE10E0E),
                              size: 20.0,
                            ),
                            onPressed: () {
                              print('IconButton pressed ...');
                            },
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                30.0, 0.0, 0.0, 0.0),
                            child: Text(
                              'Help',
                              style: TextStyle(
                                color: Colors.black,
                                letterSpacing: 0.0,
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(-1.0, -1.0),
                          child: IconButton(
                            // borderColor: Colors.transparent,
                            // borderRadius: 10.0,
                            // borderWidth: 1.0,
                            // buttonSize: 36.0,
                            // fillColor: Color(0x6EE10E0E),
                            icon: Icon(
                              Icons.login_rounded,
                              color: Color(0xFFE10E0E),
                              size: 20.0,
                            ),
                            onPressed: () {
                              print('IconButton pressed ...');
                            },
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                30.0, 0.0, 0.0, 0.0),
                            child: Text(
                              'Login',
                              style: TextStyle(
                                color: Colors.black,
                                letterSpacing: 0.0,
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
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
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          leading: Builder(
            builder: (context) => IconButton(
              style: ButtonStyle(
                fixedSize: WidgetStateProperty.all<Size>(Size.square(60)),
              ),
              onPressed: () {
                scaffoldKey.currentState?.openDrawer();
              },
              icon: Icon(
                Icons.menu,
                color: Color(0xFFE10E0E),
                size: 30.0,
              ),
            ),
          ),
          actions: [
            IconButton(
              style: ButtonStyle(
                fixedSize: WidgetStateProperty.all<Size>(Size.square(60)),
              ),
              onPressed: () {},
              icon: Icon(
                Icons.shopping_cart,
                color: Color(0xFFE10E0E),
                size: 30.0,
              ),
            ),
          ],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 401.0,
                height: 75.0,
                decoration: const BoxDecoration(color: Colors.white),
                child: Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                    child: Container(
                      width: double.infinity,
                      child: TextFormField(
                        controller: cont,
                        // focusNode: ,
                        autofocus: true,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'What are you craving?',
                          labelStyle: TextStyle(letterSpacing: 0.0),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
