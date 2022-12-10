import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stock_it_application/app/home/Views/customFullScrenDialog.dart';
import '../Views/customSnackBar.dart';
import '../itemModel.dart';
import '../timeModel.dart';

/*
 * HomeController class is the main control class
 * used to handle the logic of items, the changing of their attributes,
 * and the scheduling of shopping appointments for the users
 */
class HomeController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController nameController, shelfLifeController;

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  // creating references for collection references in database
  late CollectionReference collectionReference;
  late CollectionReference timeReference;

  // create a RxList of ItemModel objects
  RxList<ItemModel> items = RxList<ItemModel>([]);

  // function for initialization of the app
  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController();
    shelfLifeController = TextEditingController();
    // creates reference to 'items' collection in database
    collectionReference = firebaseFirestore.collection('items');
    // gets list of items
    items.bindStream(getAllItems());
    // calls timeUpdate() to update shelfLife of items
    timeUpdate();
    // if app left open, checks every 3 hours if a day has passed to call timeUpdate
    Timer threeHourTimer = Timer.periodic(Duration(hours: 3), (timer) {
      timeUpdate();
    });
  }

  /*
   * checks that the name of an item is not empty
   */
  String? validateName(String value) {
    if (value.isEmpty) {
      return "Name cannot be empty silly goose";
    }
    return null;
  }

  /*
   * Checks that the shelfLife is not empty
   */
  String? validateShelfLife(String value) {
    if (value.isEmpty) {
      return "shelf life cannot be empty";
    }
    return null;
  }

  /*
   * This function saves or updates an item
   * Takes Strings name, shelfLife, docId, and int addEditFlag as parameters
   * addEditFlag of 1 for add, 2 for edit 
   */
  void saveUpdateItem(
      String name, String shelfLife, String docId, int addEditFlag) {
    final isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    formKey.currentState!.save();

    // checks if addEditFlag is 1 for add
    if (addEditFlag == 1) {
      CustomFullScreenDialog.showDialog();
      // adding new item to database
      collectionReference
          .add({'name': name, 'shelfLife': shelfLife}).whenComplete(() {
        CustomFullScreenDialog.cancelDialog();
        clearEditingControllers();
        Get.back();
        // showing confimation if item added
        CustomSnackBar.showSnackBar(
            context: Get.context,
            title: "Item Added",
            message: "Item added successfully",
            backgroudColor: Color.fromARGB(255, 116, 163, 118));
        // showing error if item failed to add
      }).catchError((error) {
        CustomFullScreenDialog.cancelDialog();
        CustomSnackBar.showSnackBar(
            context: Get.context,
            title: "Error",
            message: "Something went wrong",
            backgroudColor: Colors.red);
      });
      // checks if addEditFlag is 2 for updating item
    } else if (addEditFlag == 2) {
      CustomFullScreenDialog.showDialog();
      // getting and updating the item with new name and/or shelfLife
      collectionReference
          .doc(docId)
          .update({'name': name, 'shelfLife': shelfLife}).whenComplete(() {
        CustomFullScreenDialog.cancelDialog();
        clearEditingControllers();
        Get.back();
        // showing confirmation that the item was updated
        CustomSnackBar.showSnackBar(
            context: Get.context,
            title: "Item updated",
            message: "Item updated successfully",
            backgroudColor: Color.fromARGB(255, 109, 162, 111));
        // showing error if item failed to update
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

  /*
   * This function gets items from the reference and returns a list of items 
   */
  Stream<List<ItemModel>> getAllItems() => collectionReference.snapshots().map(
      (query) => query.docs.map((item) => ItemModel.fromMap(item)).toList());

  /*
   *  This function deletes an item from the database
   *  Takes String docId as parameter 
   */
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

  /*
   * This function checks if a day has passed in order to decrement the shelf life of items
   */
  void timeUpdate() async {
    // getting the data in colleciton
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

  /*
   * This function updates the shopping time selected by user 
   */
  shopTime(DateTime newTime) {
    firebaseFirestore.collection('time').doc('2').update({'shop': newTime});
  }

  /*
   *  This function decrements the shelf life of all items 
   */
  void decrementShelfLife(int dayDiff) {
    // loops through all items in list
    for (var item in items) {
      int tempShelfLife = int.parse(item.shelfLife as String);
      // subtracts the number of days passed from shelfLife
      tempShelfLife -= dayDiff;
      // updates items with new shelf life
      collectionReference
          .doc(item.docId)
          .update({'name': item.name, 'shelfLife': tempShelfLife.toString()});
    }
  }
}
