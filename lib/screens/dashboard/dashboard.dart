import 'dart:async';
import 'package:eatup/routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:eatup/widgets/widg.dart';

class Started extends StatefulWidget {
  const Started({super.key});

  @override
  State<Started> createState() => _StartedState();
}

class _StartedState extends State<Started> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final pcont = PageController(initialPage: 0);

  List<String> carousel = [
    'https://images.unsplash.com/photo-1511690656952-34342bb7c2f2?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwzfHxmb29kfGVufDB8fHx8MTcyMzI4ODM5MXww&ixlib=rb-4.0.3&q=80&w=1080',
    'https://images.unsplash.com/photo-1485962398705-ef6a13c41e8f?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxMnx8Zm9vZHxlbnwwfHx8fDE3MjMyODgzOTF8MA&ixlib=rb-4.0.3&q=80&w=1080',
    'https://images.unsplash.com/photo-1473093226795-af9932fe5856?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwyM3x8Zm9vZHxlbnwwfHx8fDE3MjMyODgzOTF8MA&ixlib=rb-4.0.3&q=80&w=1080',
  ];

  late final StreamSubscription? listener;
  late final AppLifecycleListener _listener;

  void checkInternetC() async {
    listener =
        InternetConnection().onStatusChange.listen((InternetStatus status) {
      switch (status) {
        case InternetStatus.connected:
          print('Connected');
          // The internet is now connected
          break;
        case InternetStatus.disconnected:
          print('no internet');
          if (mounted) {
            showErrorToast(context: context, message: 'Network is Unavailable');
          }
          // The internet is now disconnected
          break;
      }
    });
    _listener = AppLifecycleListener(
      onResume: listener!.resume,
      onHide: listener!.pause,
      onPause: listener!.pause,
    );
  }

  @override
  void initState() {
    super.initState();
    checkInternetC();
    fetchData('shops');
    fetchData('section');
    fetchData('item');
  }

  @override
  void dispose() {
    listener!.cancel();
    _listener.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                flex: 3,
                child: SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 0.0, 0.0, 40),
                        child: PageView.builder(
                            controller: pcont,
                            scrollDirection: Axis.horizontal,
                            itemCount: carousel.length,
                            itemBuilder: (context, index) {
                              var cr = carousel[index];
                              return ClipRRect(
                                borderRadius: BorderRadius.circular(0),
                                child: CachedNetworkImage(
                                  imageUrl: cr,
                                  placeholder: (context, url) =>
                                      const CircularProgressIndicator(), // Shows while loading
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons
                                          .error), // Shows if loading fails
                                  width: 300.0,
                                  height: 200.0,
                                  fit: BoxFit.cover, // Adjust image scaling
                                ),
                              );
                            }),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(0.0, 1.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 0.0, 16.0),
                          child: SmoothPageIndicator(
                            controller: pcont,
                            count: 3,
                            effect: const ExpandingDotsEffect(
                                expansionFactor: 3,
                                spacing: 8,
                                radius: 16,
                                dotWidth: 16,
                                dotHeight: 3,
                                activeDotColor: Color(0xFFEF2707),
                                paintStyle: PaintingStyle.fill),
                            onDotClicked: (index) async {
                              await pcont.animateToPage(
                                index,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.ease,
                              );
                              setState(() {});
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                  flex: 1,
                  child: Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          0.0, 0.0, 0.0, 2.0),
                      child: SizedBox(
                        height: 70.0,
                        width: 300.0,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            Get.toNamed(home);
                          },
                          style: ButtonStyle(
                            padding: WidgetStateProperty.all<EdgeInsets>(
                              const EdgeInsets.fromLTRB(24, 0, 24, 0),
                            ),
                            shape:
                                WidgetStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                                side: const BorderSide(
                                  color: Colors.transparent,
                                  width: 3,
                                ),
                              ),
                            ),
                          ),
                          label: const Text(
                            'Get Started',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.0,
                              fontSize: 30,
                            ),
                          ),
                          icon: const Icon(
                            Icons.change_history,
                            color: Color(0xFFEF2707),
                            size: 35,
                          ),
                        ),
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
