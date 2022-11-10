import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:stock_it_application/Model/item_model.dart';

class ItemController extends GetxController {
  var isLoading = false;
  var itemList = <ItemModel>[];

  Future<void> getData() async {
    try {
      QuerySnapshot items = await FirebaseFirestore.instance
          .collection('item')
          .orderBy('shelf-life')
          .get();
      itemList.clear();
      for (var item in items.docs) {
        itemList.add(ItemModel(item['name'], item['shelf-Life']));
      }
      isLoading = false;
    } catch (e) {
      Get.snackbar('Error', '${e.toString()}');
    }
  }
}
