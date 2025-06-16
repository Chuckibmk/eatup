import 'package:eatup/routes/route_names.dart';
import 'package:eatup/widgets/mycontroller.dart';
import 'package:eatup/widgets/widg.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class Product extends StatefulWidget {
  const Product({super.key});

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  var argData = Get.arguments;

  @override
  Widget build(BuildContext context) {
    final ItemScrollController itemScrollController = ItemScrollController();
    final Map<String, int> tabIndexMap =
        {}; // e.g. {'Beverages': 0, 'Snacks': 4}
    int displayIndex = 0;

    final CartController c = Get.find();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: SafeArea(
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
                            fit: BoxFit.cover,
                            image: MemoryImage(argData['image'])),
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
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        side: const BorderSide(
                                            width: 1.0, color: Colors.white),
                                      ),
                                    ),
                                    backgroundColor:
                                        WidgetStateProperty.all<Color>(
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
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        side: const BorderSide(
                                            width: 1.0,
                                            color: Colors.transparent),
                                      ),
                                    ),
                                    backgroundColor:
                                        WidgetStateProperty.all<Color>(
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
                                  argData['title'],
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
                          Container(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0,
                              0.0,
                              0.0,
                              25.0,
                            ),
                            height: 70,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: argData['tabs'].split(',').length,
                                itemBuilder: (contex, index) {
                                  var tabs = argData['tabs']
                                      .split(',')
                                      .map((e) => e.trim().replaceAll('"', ''))
                                      .toList();
                                  var tb = tabs[index];
                                  return Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 20.0, 0.0),
                                    child: ElevatedButton(
                                      onPressed: () {
                                        final index = tabIndexMap[tb];
                                        if (index != null) {
                                          itemScrollController.scrollTo(
                                              index: index,
                                              duration:
                                                  Duration(milliseconds: 300));
                                        }
                                      },
                                      style: ButtonStyle(
                                        elevation:
                                            WidgetStateProperty.all<double>(
                                                3.0),
                                        shape: WidgetStateProperty.all<
                                            RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            side: const BorderSide(
                                              width: 1.0,
                                              color: Colors.transparent,
                                            ),
                                          ),
                                        ),
                                        backgroundColor:
                                            WidgetStateProperty.all<Color>(
                                          const Color(0xFFE10E0E),
                                        ),
                                        fixedSize:
                                            WidgetStateProperty.all<Size>(
                                          const Size.fromHeight(40.0),
                                        ),
                                      ),
                                      child: Text(
                                        tb,
                                        // 'Breakfast',
                                        style: GoogleFonts.readexPro(
                                          textStyle: Theme.of(context)
                                              .textTheme
                                              .titleSmall,
                                          color: Colors.white,
                                          letterSpacing: 0.0,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                          ),
                          FutureBuilder<List<Item>>(
                              future: argData['items'],
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const Center(
                                      child: CircularProgressIndicator());
                                } else if (snapshot.hasError) {
                                  return Center(
                                      child: Text('Error: ${snapshot.error}'));
                                } else if (!snapshot.hasData ||
                                    snapshot.data!.isEmpty) {
                                  return const Center(
                                      child: Text('No Items available'));
                                }
                                final items = snapshot.data!;
                                final groupedItems = <String, List<Item>>{};

                                for (final item in items) {
                                  final tab = item
                                      .tabs; // Assuming `tabs` is a field in Item class
                                  if (!groupedItems.containsKey(tab)) {
                                    groupedItems[tab] = [];
                                  }
                                  groupedItems[tab]!.add(item);
                                }

                                // After grouping items
                                final displayList = <Map<String, dynamic>>[];

                                groupedItems.forEach((tab, itemList) {
                                  tabIndexMap[tab] =
                                      displayIndex++; // Store index of header
                                  displayList
                                      .add({'type': 'header', 'value': tab});
                                  for (var item in itemList) {
                                    displayList
                                        .add({'type': 'item', 'value': item});
                                    displayIndex++;
                                  }
                                });
                                return ScrollablePositionedList.separated(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: displayList.length,
                                  itemScrollController: itemScrollController,
                                  separatorBuilder: (_, __) =>
                                      const SizedBox(height: 10),
                                  itemBuilder: (context, index) {
                                    final entry = displayList[index];

                                    if (entry['type'] == 'header') {
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10),
                                        child: Text(
                                          entry['value'],
                                          style: GoogleFonts.readexPro(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            textStyle: Theme.of(context)
                                                .textTheme
                                                .bodyLarge,
                                          ),
                                        ),
                                      );
                                    }

                                    final Item it = entry['value'];
                                    return itemWidget(it);
                                  },
                                );
                              })
                        ],
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

  Widget itemWidget(dynamic it) {
    return Container(
      width: 100.0,
      height: 161.0,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 120,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: it.image != null && it.image!.isNotEmpty
                      ? Image.memory(
                          it.image!,
                          width: 80.0,
                          // height: 90.0,
                          fit: BoxFit.cover,
                          alignment: const Alignment(-1.0, 1.0),
                        )
                      : const SizedBox(
                          height: 200,
                          child: Center(
                              child: Icon(Icons.image_not_supported, size: 80)),
                        ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 2,
                  // height: 110.0,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(-1.0, 0.0),
                        child: Container(
                          decoration: const BoxDecoration(),
                          child: Text(
                            it.name,
                            style: GoogleFonts.readexPro(
                              textStyle: Theme.of(context).textTheme.bodyMedium,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          it.details,
                          style: GoogleFonts.readexPro(
                            textStyle: Theme.of(context).textTheme.bodySmall,
                            color: Colors.black87,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(-1.0, 0.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 5.0, 0.0, 0.0),
                          child: Container(
                            decoration: const BoxDecoration(),
                            child: Text(
                              it.price,
                              style: GoogleFonts.readexPro(
                                textStyle:
                                    Theme.of(context).textTheme.bodyMedium,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  style: ButtonStyle(
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        side: const BorderSide(
                            width: 1.0, color: Colors.transparent),
                      ),
                    ),
                    backgroundColor: WidgetStateProperty.all<Color>(
                      const Color(0xFFE10E0E),
                    ),
                    fixedSize:
                        WidgetStateProperty.all<Size>(const Size.square(35.0)),
                  ),
                  onPressed: () {
                    Get.toNamed(
                      item,
                      arguments: {
                        'id': it.id,
                        'title': it.name,
                        'detail': it.details,
                        'image': it.image,
                        'price': it.price,
                      },
                    );
                  },
                  icon: const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 20.0,
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            thickness: 1.0,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
