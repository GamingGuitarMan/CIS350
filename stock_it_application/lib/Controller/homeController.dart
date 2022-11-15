import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stock_it_application/Views/customFullScrenDialog.dart';
import '../Views/customSnackBar.dart';

class HomeController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController nameController, shelfLifeController;

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  late CollectionReference collectionReference;

  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController();
    shelfLifeController = TextEditingController();
    collectionReference = firebaseFirestore.collection("items");
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
}
