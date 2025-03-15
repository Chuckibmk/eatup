import 'dart:typed_data';

import 'package:toastification/toastification.dart';
import 'package:flutter/material.dart';

import 'dart:convert';
import 'dart:io';

import 'package:eatup/db/db.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';

// Define a reusable toast function
void showSuccessToast({
  required BuildContext context,
  required String message,
}) {
  toastification.show(
    context: context, // optional if you use ToastificationWrapper
    type: ToastificationType.success,
    style: ToastificationStyle.flat,
    autoCloseDuration: const Duration(seconds: 5),
    title: const Text('Success'),
    // you can also use RichText widget for title and description parameters
    description: RichText(
        text: TextSpan(
      text: message,
      style: const TextStyle(color: Colors.black),
    )),
    alignment: Alignment.topRight,
    direction: TextDirection.ltr,
    animationDuration: const Duration(milliseconds: 300),
    animationBuilder: (context, animation, alignment, child) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
    icon: const Icon(Icons.check),
    showIcon: true, // show or hide the icon
    primaryColor: Colors.green,
    backgroundColor: Colors.white,
    foregroundColor: Colors.black,
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
    margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    borderRadius: BorderRadius.circular(12),

    showProgressBar: true,
    closeButtonShowType: CloseButtonShowType.always,
    closeOnClick: true,
    pauseOnHover: true,
    dragToClose: true,
    applyBlurEffect: false,
    callbacks: ToastificationCallbacks(
      onTap: (toastItem) => print('Toast ${toastItem.id} tapped'),
      onCloseButtonTap: (toastItem) =>
          print('Toast ${toastItem.id} close button tapped'),
      onAutoCompleteCompleted: (toastItem) =>
          print('Toast ${toastItem.id} auto complete completed'),
      onDismissed: (toastItem) => print('Toast ${toastItem.id} dismissed'),
    ),
  );
}

void showWarningToast({
  required BuildContext context,
  required String message,
}) {
  toastification.show(
    context: context, // optional if you use ToastificationWrapper
    type: ToastificationType.warning,
    style: ToastificationStyle.flat,
    autoCloseDuration: const Duration(seconds: 5),
    title: const Text('Warning'),
    // you can also use RichText widget for title and description parameters
    description: RichText(
        text: TextSpan(
      text: message,
      style: const TextStyle(color: Colors.black),
    )),
    alignment: Alignment.topRight,
    direction: TextDirection.ltr,
    animationDuration: const Duration(milliseconds: 300),
    animationBuilder: (context, animation, alignment, child) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
    icon: const Icon(Icons.warning),
    showIcon: true, // show or hide the icon
    primaryColor: Colors.orange,
    backgroundColor: Colors.white,
    foregroundColor: Colors.black,
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
    margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    borderRadius: BorderRadius.circular(12),

    showProgressBar: true,
    closeButtonShowType: CloseButtonShowType.always,
    closeOnClick: true,
    pauseOnHover: true,
    dragToClose: true,
    applyBlurEffect: false,
    callbacks: ToastificationCallbacks(
      onTap: (toastItem) => print('Toast ${toastItem.id} tapped'),
      onCloseButtonTap: (toastItem) =>
          print('Toast ${toastItem.id} close button tapped'),
      onAutoCompleteCompleted: (toastItem) =>
          print('Toast ${toastItem.id} auto complete completed'),
      onDismissed: (toastItem) => print('Toast ${toastItem.id} dismissed'),
    ),
  );
}

void showErrorToast({
  required BuildContext context,
  required String message,
}) {
  toastification.show(
    context: context, // optional if you use ToastificationWrapper
    type: ToastificationType.error,
    style: ToastificationStyle.flat,
    autoCloseDuration: const Duration(seconds: 5),
    title: const Text('Error'),
    // you can also use RichText widget for title and description parameters
    description: RichText(
        text: TextSpan(
      text: message,
      style: const TextStyle(color: Colors.black),
    )),
    alignment: Alignment.topRight,
    direction: TextDirection.ltr,
    animationDuration: const Duration(milliseconds: 300),
    animationBuilder: (context, animation, alignment, child) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
    icon: const Icon(Icons.error),
    showIcon: true, // show or hide the icon
    primaryColor: Colors.red,
    backgroundColor: Colors.white,
    foregroundColor: Colors.black,
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
    margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    borderRadius: BorderRadius.circular(12),

    showProgressBar: true,
    closeButtonShowType: CloseButtonShowType.always,
    closeOnClick: true,
    pauseOnHover: true,
    dragToClose: true,
    applyBlurEffect: false,
    callbacks: ToastificationCallbacks(
      onTap: (toastItem) => print('Toast ${toastItem.id} tapped'),
      onCloseButtonTap: (toastItem) =>
          print('Toast ${toastItem.id} close button tapped'),
      onAutoCompleteCompleted: (toastItem) =>
          print('Toast ${toastItem.id} auto complete completed'),
      onDismissed: (toastItem) => print('Toast ${toastItem.id} dismissed'),
    ),
  );
}

void showInfoToast({
  required BuildContext context,
  required String message,
}) {
  toastification.show(
    context: context, // optional if you use ToastificationWrapper
    type: ToastificationType.info,
    style: ToastificationStyle.flat,
    autoCloseDuration: const Duration(seconds: 5),
    title: const Text('Info'),
    // you can also use RichText widget for title and description parameters
    description: RichText(
        text: TextSpan(
      text: message,
      style: const TextStyle(color: Colors.black),
    )),
    alignment: Alignment.topRight,
    direction: TextDirection.ltr,
    animationDuration: const Duration(milliseconds: 300),
    animationBuilder: (context, animation, alignment, child) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
    icon: const Icon(Icons.info),
    showIcon: true, // show or hide the icon
    primaryColor: Colors.blue,
    backgroundColor: Colors.white,
    foregroundColor: Colors.black,
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
    margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    borderRadius: BorderRadius.circular(12),

    showProgressBar: true,
    closeButtonShowType: CloseButtonShowType.always,
    closeOnClick: true,
    pauseOnHover: true,
    dragToClose: true,
    applyBlurEffect: false,
    callbacks: ToastificationCallbacks(
      onTap: (toastItem) => print('Toast ${toastItem.id} tapped'),
      onCloseButtonTap: (toastItem) =>
          print('Toast ${toastItem.id} close button tapped'),
      onAutoCompleteCompleted: (toastItem) =>
          print('Toast ${toastItem.id} auto complete completed'),
      onDismissed: (toastItem) => print('Toast ${toastItem.id} dismissed'),
    ),
  );
}

class Section {
  final int id;
  final String name;
  final String subtitle;
  final Uint8List? image;
  final String uqid;

  Section({
    required this.id,
    required this.name,
    required this.subtitle,
    required this.image,
    required this.uqid,
  });

  factory Section.fromJson(Map<String, dynamic> json) {
    return Section(
      id: json['id'] is int
          ? json['id']
          : int.tryParse(json['id'].toString()) ?? 0, // Ensure int
      name: json['name'],
      subtitle: json['subtitle'],
      image: json['image'] != null && json['image'] is Uint8List
          ? json['image']
          : Uint8List(0), //handle null or incorrect format
      uqid: json['uqid'],
    );
  }
}

class Item {
  final int id;
  final String name;
  final String details;
  final String price;
  final Uint8List? image;
  final String category;
  final String shop;
  final String tabs;
  final String sku;
  final String stock;
  final String uqid;

  Item({
    required this.id,
    required this.name,
    required this.details,
    required this.image,
    required this.uqid,
    required this.price,
    required this.category,
    required this.shop,
    required this.tabs,
    required this.sku,
    required this.stock,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'] is int
          ? json['id']
          : int.tryParse(json['id'].toString()) ?? 0, // Ensure int
      name: json['name'],
      image: json['image'] != null && json['image'] is Uint8List
          ? json['image']
          : Uint8List(0), //handle null or incorrect format
      uqid: json['uqid'],
      details: json['details'],
      price: json['price'],
      category: json['category'],
      shop: json['shop'],
      tabs: json['tabs'],
      stock: json['stock'] != null ? json['stock'] : '0',
      sku: json['sku'],
    );
  }
}

class Shop {
  final int id;
  final String name;
  final String subtitle;
  final String desc;
  final String tabs;
  final Uint8List? image;
  final String section;
  final String uqid;

  Shop({
    required this.id,
    required this.name,
    required this.subtitle,
    required this.image,
    required this.uqid,
    required this.desc,
    required this.tabs,
    required this.section,
  });

  factory Shop.fromJson(Map<String, dynamic> json) {
    return Shop(
      id: json['id'] is int
          ? json['id']
          : int.tryParse(json['id'].toString()) ?? 0, // Ensure int
      name: json['name'],
      subtitle: json['subtitle'],
      image: json['image'] != null && json['image'] is Uint8List
          ? json['image']
          : Uint8List(0), //handle null or incorrect format
      uqid: json['uqid'],
      desc: json['description'],
      tabs: json['tabs'],
      section: json['section'],
    );
  }
}

Future<Uint8List?> downloadImage(String url, {int retries = 3}) async {
  for (int i = 0; i < retries; i++) {
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(Duration(seconds: 10));
      if (response.statusCode == 200) {
        return response.bodyBytes;
      }
    } catch (e) {
      print('Retry ${i + 1}: Error downloading image: $e');
    }
    await Future.delayed(Duration(seconds: 2)); // Wait before retrying
  }
  return null; // Return null if all retries fail
}

Future<Uint8List?> compressImage(Uint8List imageBytes) async {
  try {
    return await FlutterImageCompress.compressWithList(
      imageBytes,
      minWidth: 800, // Resize to max 800px width
      minHeight: 800, // Resize to max 800px height
      quality: 50, // Reduce quality to 50%
    );
  } catch (e) {
    print('Error compressing image: $e');
    return null; // Return null if compression fails
  }
}

void saveShopsToDB(Map<String, dynamic> apiResponse) async {
  if (apiResponse.containsKey('data')) {
    final db = DatabaseHelper();
    List<dynamic> shops = apiResponse['data'];
    List<Map<String, dynamic>> formattedShops = [];

    for (var shop in shops) {
      //construct the image url
      String imageUrl =
          'https://eatup.globalchainlimited.com/uploads/${shop['name']}/${shop['image']}';

      Uint8List? imageBytes;
      // Uint8List? imageBytes = await downloadImage(imageUrl); // Retry download

      // ✅ **Check if the image already exists in the database**
      Map<String, dynamic>? existingShop = await db.getGenById(
          shop['id'] is int ? shop['id'] : int.tryParse(shop['id'].toString()),
          'shops');

      if (existingShop != null && existingShop['image'] != null) {
        print('Image already exists for shop: ${shop['name']}');
        imageBytes = existingShop['image']; // Use existing image
      } else {
        // 🔄 **Download the image only if it doesn't exist**
        imageBytes = await downloadImage(imageUrl);
        if (imageBytes != null) {
          imageBytes =
              await compressImage(imageBytes); // Compress before storing
        }
      }

      formattedShops.add({
        'id': shop['id'] is int
            ? shop['id']
            : int.tryParse(shop['id'].toString()), // Ensure int
        'name': shop['name'],
        'subtitle': shop['subtitle'],
        'description': shop['description'],
        'tabs': shop['tabs'] != null
            ? jsonEncode(shop['tabs'])
            : '[]', // Handle null case
        'image': imageBytes, //store as Blob
        'section': shop['section'],
        'uqid': shop['uqid'],
        'date': DateTime.now().millisecondsSinceEpoch
      });
    }

    await db.insertGen(formattedShops, 'shops');
  }
}

void saveSectionToDB(Map<String, dynamic> apiResponse) async {
  if (apiResponse.containsKey('data')) {
    final db = DatabaseHelper();
    List<dynamic> section = apiResponse['data'];
    List<Map<String, dynamic>> formattedSection = [];

    for (var sect in section) {
      //construct the image url
      String imageUrl =
          'https://eatup.globalchainlimited.com/uploads/${sect['name']}/${sect['image']}';

      Uint8List? imageBytes;
      // Uint8List? imageBytes = await downloadImage(imageUrl); // Retry download

      // ✅ **Check if the image already exists in the database**
      Map<String, dynamic>? existingShop = await db.getGenById(
          sect['id'] is int ? sect['id'] : int.tryParse(sect['id'].toString()),
          'section');

      if (existingShop != null && existingShop['image'] != null) {
        print('Image already exists for shop: ${sect['name']}');
        imageBytes = existingShop['image']; // Use existing image
      } else {
        // 🔄 **Download the image only if it doesn't exist**
        imageBytes = await downloadImage(imageUrl);
        if (imageBytes != null) {
          imageBytes =
              await compressImage(imageBytes); // Compress before storing
        }
      }

      formattedSection.add({
        'id': sect['id'] is int
            ? sect['id']
            : int.tryParse(sect['id'].toString()), // Ensure int
        'name': sect['name'],
        'subtitle': sect['subtitle'],
        'image': imageBytes, //store as Blob
        'uqid': sect['uqid'],
        'date': DateTime.now().millisecondsSinceEpoch
      });
    }

    await db.insertGen(formattedSection, 'section');
  }
}

void saveItemToDB(Map<String, dynamic> apiResponse) async {
  if (apiResponse.containsKey('data')) {
    final db = DatabaseHelper();
    List<dynamic> section = apiResponse['data'];
    List<Map<String, dynamic>> formattedSection = [];

    for (var sect in section) {
      //construct the image url
      String imageUrl =
          'https://eatup.globalchainlimited.com/uploads/${sect['name']}/${sect['image']}';

      Uint8List? imageBytes;
      // Uint8List? imageBytes = await downloadImage(imageUrl); // Retry download

      // ✅ **Check if the image already exists in the database**
      Map<String, dynamic>? existingShop = await db.getGenById(
          sect['id'] is int ? sect['id'] : int.tryParse(sect['id'].toString()),
          'item');

      if (existingShop != null && existingShop['image'] != null) {
        print('Image already exists for shop: ${sect['name']}');
        imageBytes = existingShop['image']; // Use existing image
      } else {
        // 🔄 **Download the image only if it doesn't exist**
        imageBytes = await downloadImage(imageUrl);
        if (imageBytes != null) {
          imageBytes =
              await compressImage(imageBytes); // Compress before storing
        }
      }

      formattedSection.add({
        'id': sect['id'] is int
            ? sect['id']
            : int.tryParse(sect['id'].toString()), // Ensure int
        'name': sect['name'],
        'details': sect['details'],
        'price': sect['price'],
        'image': imageBytes, //store as Blob
        'category': sect['category'],
        'shop': sect['shop'],
        'tabs': sect['tabs'],
        'sku': sect['sku'],
        'stock': sect['stock'],
        'uqid': sect['uqid'],
        'date': DateTime.now().millisecondsSinceEpoch
      });
    }

    await db.insertGen(formattedSection, 'item');
  }
}

Future fetchData(String g) async {
  String jwtToken = dotenv.env['jwtToken'] ?? 'No API Key Found';
  String apiKey = dotenv.env['API_KEY'] ?? 'No API Key Found';
  String url = dotenv.env[g] ?? 'No API Key Found';

  try {
    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        "X-API-KEY": apiKey, // 🔑 Add API Key in headers
        'Authorization': 'Bearer $jwtToken',
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (g == 'shops') {
        saveShopsToDB(data);
        List<dynamic> shopsJson = data['data'];
        return shopsJson.map((json) => Shop.fromJson(json)).toList();
      }
      if (g == 'section') {
        saveSectionToDB(data);
        List<dynamic> shopsJson = data['data'];
        return shopsJson.map((json) => Section.fromJson(json)).toList();
      }
      if (g == 'item') {
        saveItemToDB(data);
        List<dynamic> shopsJson = data['data'];
        return shopsJson.map((json) => Item.fromJson(json)).toList();
      }
      // saveShopsToDB(data);
      // print("Data received: $data");
    } else {
      print("Error: ${response.statusCode} - ${response.body}");
      return [];
    }
  } on SocketException {
    print('Network Error: SocketException');
    return [];
  } on HttpException {
    print('Network Error: HttpException');
    return [];
  } catch (e) {
    print('Unknown Error: $e');
    return [];
  }
}

Future<List<Shop>> fetchShopsFromDB() async {
  final dbHelper = DatabaseHelper();
  List<Map<String, dynamic>> shops = await dbHelper.getGen('shops');

  return shops.map((json) => Shop.fromJson(json)).toList();
}

Future<List<Item>> fetchItemFromDB() async {
  final dbHelper = DatabaseHelper();
  List<Map<String, dynamic>> items = await dbHelper.getGen('item');

  return items.map((json) => Item.fromJson(json)).toList();
}

Future<List<Section>> fetchSectionFromDB() async {
  final dbHelper = DatabaseHelper();
  List<Map<String, dynamic>> items = await dbHelper.getGen('section');

  return items.map((json) => Section.fromJson(json)).toList();
}

Future<List<Shop>> fetchGenFromDB(String g) async {
  final dbHelper = DatabaseHelper();
  List<Map<String, dynamic>> shops = await dbHelper.getGen(g);

  return shops.map((json) => Shop.fromJson(json)).toList();
}
