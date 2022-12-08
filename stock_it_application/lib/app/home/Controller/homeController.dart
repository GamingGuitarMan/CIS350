import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stock_it_application/app/home/Views/customFullScrenDialog.dart';
import '../Views/customSnackBar.dart';
import '../itemModel.dart';
import '../timeModel.dart';

class HomeController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController nameController, shelfLifeController;

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  late CollectionReference collectionReference;
  late CollectionReference timeReference;

  RxList<ItemModel> items = RxList<ItemModel>([]);

  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController();
    shelfLifeController = TextEditingController();
    collectionReference = firebaseFirestore.collection('items');
    items.bindStream(getAllItems());
    Timer threeHourTimer = Timer.periodic(Duration(hours: 3), (timer) {
      timeUpdate();
    });
  }

  String? validateName(String value) {
    if (value.isEmpty) {
      return "Name cannot be empty silly goose";
    }
    return null;
  }

  String? validateShelfLife(String value) {
    if (value.isEmpty) {
      return "shelf life cannot be empty";
    }
    return null;
  }

  void saveUpdateItem(
      String name, String shelfLife, String docId, int addEditFlag) {
    final isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    formKey.currentState!.save();
    if (addEditFlag == 1) {
      CustomFullScreenDialog.showDialog();
      collectionReference
          .add({'name': name, 'shelfLife': shelfLife}).whenComplete(() {
        CustomFullScreenDialog.cancelDialog();
        clearEditingControllers();
        Get.back();
        CustomSnackBar.showSnackBar(
            context: Get.context,
            title: "Item Added",
            message: "Item added successfully",
            backgroudColor: Color.fromARGB(255, 116, 163, 118));
      }).catchError((error) {
        CustomFullScreenDialog.cancelDialog();
        CustomSnackBar.showSnackBar(
            context: Get.context,
            title: "Error",
            message: "Something went wrong",
            backgroudColor: Colors.red);
      });
    } else if (addEditFlag == 2) {
      CustomFullScreenDialog.showDialog();
      collectionReference
          .doc(docId)
          .update({'name': name, 'shelfLife': shelfLife}).whenComplete(() {
        CustomFullScreenDialog.cancelDialog();
        clearEditingControllers();
        Get.back();
        CustomSnackBar.showSnackBar(
            context: Get.context,
            title: "Item updated",
            message: "Item updated successfully",
            backgroudColor: Color.fromARGB(255, 109, 162, 111));
      }).catchError((error) {
        CustomFullScreenDialog.cancelDialog();
        CustomSnackBar.showSnackBar(
            context: Get.context,
            title: "Error",
            message: "Something went wrong",
            backgroudColor: Colors.red);
      });
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    nameController.dispose();
    shelfLifeController.dispose();
  }

  void clearEditingControllers() {
    nameController.clear();
    shelfLifeController.clear();
  }

  Stream<List<ItemModel>> getAllItems() => collectionReference.snapshots().map(
      (query) => query.docs.map((item) => ItemModel.fromMap(item)).toList());

  void deleteData(String docId) {
    CustomFullScreenDialog.showDialog();
    collectionReference.doc(docId).delete().whenComplete(() {
      CustomFullScreenDialog.cancelDialog();
      Get.back();
      CustomSnackBar.showSnackBar(
          context: Get.context,
          title: "Item deleted",
          message: "Item deleted successfully",
          backgroudColor: Color.fromARGB(255, 124, 178, 126));
    }).catchError((error) {
      CustomFullScreenDialog.cancelDialog();
      CustomSnackBar.showSnackBar(
          context: Get.context,
          title: "Error",
          message: "Something went wrong",
          backgroudColor: Colors.red);
    });
  }

  void timeUpdate() async {
    final docRef = firebaseFirestore.collection('time').doc('1');
    docRef.get().then(
      (DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;
        final currentTime = Timestamp.fromMillisecondsSinceEpoch(
            DateTime.now().millisecondsSinceEpoch);

        var lastTimestamp;
        // getting timpstamp from "lastTime" key
        data.forEach((key, value) {
          lastTimestamp = value;
        });
        // getting day difference from the current time and last time in database
        var dayDiff = currentTime
            .toDate()
            .difference(lastTimestamp.toDate())
            .inDays
            .floor();
        if (dayDiff > 0) {
          decrementShelfLife(dayDiff);
        }
        // add new time to databse
        docRef.update({'lastTime': currentTime});
      },
      onError: (e) => print("Error getting time: $e"),
    );
  }

  shopTime(DateTime newTime) {
    firebaseFirestore.collection('time').doc('2').update({'shop': newTime});
  }

  void decrementShelfLife(int dayDiff) {
    for (var item in items) {
      int tempShelfLife = int.parse(item.shelfLife as String);
      tempShelfLife -= dayDiff;
      collectionReference
          .doc(item.docId)
          .update({'name': item.name, 'shelfLife': tempShelfLife.toString()});
    }
  }
}
