import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:stock_it_application/Controller/homeController.dart';
import 'package:stock_it_application/Controller/itemController.dart';

class ControllerBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<ItemController>(ItemController());
  }
}
