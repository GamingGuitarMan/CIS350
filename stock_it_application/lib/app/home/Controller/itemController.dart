/*import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../itemModel.dart';

class ItemController extends GetxController {
  var isLoading = false;
  var itemList = <ItemModel>[];

  Future<void> getData() async {
    try {
      QuerySnapshot items = await FirebaseFirestore.instance
          .collection('items')
          .orderBy('shelfLife')
          .get();
      itemList.clear();
      for (var item in items.docs) {
        itemList.add(ItemModel(
            docId: item['docId'],
            name: item['name'],
            shelfLife: item['shelfLife']));
      }
      isLoading = false;
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
}
*/