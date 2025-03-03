import 'package:toastification/toastification.dart';
import 'package:flutter/material.dart';

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
  final String id;
  final String name;
  final String subtitle;
  final String image;
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
      id: json['id'],
      name: json['name'],
      subtitle: json['subtitle'],
      image: json['image'],
      uqid: json['uqid'],
    );
  }
}

class Item {
  final String id;
  final String name;
  final String details;
  final String price;
  final String image;
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
      id: json['id'],
      name: json['name'],
      image: json['image'],
      uqid: json['uqid'],
      details: json['details'],
      price: json['price'],
      category: json['category'],
      shop: json['shop'],
      tabs: json['tabs'],
      stock: json['stock'],
      sku: json['sku'],
    );
  }
}

class Shop {
  // final String id;
  final String name;
  final String subtitle;
  final String desc;
  final String tabs;
  final String image;
  final String section;
  final String uqid;

  Shop({
    // required this.id,
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
      // id: json['id'],
      name: json['name'],
      subtitle: json['subtitle'],
      image: json['image'],
      uqid: json['uqid'],
      desc: json['description'],
      tabs: json['tabs'],
      section: json['section'],
    );
  }
}
