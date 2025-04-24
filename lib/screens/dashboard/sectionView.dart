import 'package:eatup/widgets/widg.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../routes/route_names.dart';

class Sectionview extends StatefulWidget {
  final Section section;
  final Future<List<Shop>> futureShops;
  const Sectionview(
      {super.key, required this.section, required this.futureShops});

  @override
  State<Sectionview> createState() => _SectionviewState();
}

class _SectionviewState extends State<Sectionview> {
  @override
  Widget build(BuildContext context) {
    // return Placeholder();
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              // width: 222.0,
              // width: double.infinity,
              height: 32.0,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Align(
                alignment: const Alignment(-1.0, 0.0),
                child: Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                  child: Text(
                    '${widget.section.name} Near You',
                    style: GoogleFonts.lora(
                        textStyle: Theme.of(context).textTheme.bodyMedium,
                        fontSize: 20.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.normal),
                  ),
                ),
              ),
            ),
            Container(
              // width: 70.0,
              // width: double.infinity / 2,
              height: 32.0,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Align(
                alignment: const AlignmentDirectional(1.0, 0.0),
                child: Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
                  child: GestureDetector(
                    onTap: () {
                      // fetchData();
                      // fetchShopsFromDB();
                    },
                    child: RichText(
                      textScaler: MediaQuery.of(context).textScaler,
                      text: TextSpan(
                        text: 'See All',
                        style: GoogleFonts.readexPro(
                          textStyle: Theme.of(context).textTheme.bodyMedium,
                          color: const Color(0xFFE10E0E),
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        // page view
        // listview begin
        FutureBuilder<List<Shop>>(
          future: widget.futureShops,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No shops available'));
            }

            final shops = snapshot.data!;
            return ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: shops.length,
              separatorBuilder: (_, __) =>
                  const SizedBox(height: 10), // Space between items
              itemBuilder: (context, index) {
                var sh = shops[index];

                return GestureDetector(
                  onTap: () {
                    Get.toNamed(product);
                  },
                  child: Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    color: Colors.white,
                    elevation: 4.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // 🖼 Image
                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(20.0)),
                          child: sh.image != null && sh.image!.isNotEmpty
                              ? Image.memory(
                                  sh.image!,
                                  width: double.infinity,
                                  height: 200,
                                  fit: BoxFit
                                      .cover, // Ensure image scales properly
                                )
                              : const SizedBox(
                                  height: 200,
                                  child: Center(
                                      child: Icon(Icons.image_not_supported,
                                          size: 80)),
                                ),
                        ),

                        // 📄 Text Content
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // 🏪 Shop Name
                              Text(
                                sh.name,
                                style: GoogleFonts.lora(
                                  textStyle:
                                      Theme.of(context).textTheme.titleLarge,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 5),

                              // 📌 Subtitle
                              Text(
                                sh.subtitle,
                                style: GoogleFonts.readexPro(
                                  textStyle:
                                      Theme.of(context).textTheme.bodyMedium,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey[700],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        )
      ],
    );
  }
}
