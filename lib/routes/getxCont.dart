// shared_data_controller.dart
import 'package:get/get.dart';

class SharedDataController extends GetxController {
  var sectionL = 1.obs; // default to 1 or any fallback

  void updateSectionL(int newVal) {
    sectionL.value = newVal;
  }
}
