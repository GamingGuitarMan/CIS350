import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stock_it_application/Controller/homeController.dart';
import 'package:stock_it_application/Controller/item_controller.dart';
import '../Controller/homeController.dart';

class HomeView extends GetView<HomeController> {
  ItemController itemController = Get.put(ItemController());

  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ItemController>(
        init: ItemController(),
        initState: (_) {},
        builder: (itemController) {
          itemController.getData();
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.blueGrey,
              title: const Text('Stock it!',
                  style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontStyle: FontStyle.italic,
                      letterSpacing: 2)),
              actions: [
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    _buildAddEditItemView(
                        text: 'Add', addEditFlag: 1, docId: '');
                  },
                )
              ],
            ),
            body: Center(
              child: itemController.isLoading
                  ? const CircularProgressIndicator()
                  : ListView.separated(
                      itemCount: itemController.itemList.length,
                      itemBuilder: (BuildContext context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            color: Color.fromARGB(131, 105, 240, 233),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        itemController.itemList[index].name,
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        itemController
                                            .itemList[index].shelfLife,
                                        style: const TextStyle(fontSize: 17),
                                        overflow: TextOverflow.visible,
                                        textAlign: TextAlign.start,
                                      ),
                                    ],
                                  ),
                                  Row(children: [
                                    IconButton(
                                        onPressed: () {},
                                        icon: const Icon(Icons.edit)),
                                    IconButton(
                                        onPressed: () {},
                                        icon: const Icon(Icons.delete))
                                  ])
                                ]),
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const Divider(thickness: 2, color: Colors.black);
                      },
                    ),
            ),
          );
        });
  }

  _buildAddEditItemView({String? text, int? addEditFlag, String? docId}) {
    Get.bottomSheet(Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(16),
          topLeft: Radius.circular(16),
        ),
        color: Colors.cyan,
      ),
      child: Padding(
          padding:
              const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16),
          child: Form(
              key: controller.formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: SingleChildScrollView(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${text} Item',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    controller: controller.nameController,
                    validator: (value) {
                      return controller.validateName(value!);
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      hintText: 'shelf life in days',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    controller: controller.shelfLifeController,
                    validator: (value) {
                      return controller.validateShelfLife(value!);
                    },
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints.tightFor(
                        width: Get.context!.width, height: 45),
                    child: ElevatedButton(
                      child: Text(
                        text!,
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                      onPressed: () {
                        controller.saveUpdateItem(
                            controller.nameController.text,
                            controller.shelfLifeController.text,
                            docId!,
                            addEditFlag!);
                      },
                    ),
                  )
                ],
              )))),
    ));
  }

  displayDeleteDialog(String docId) {
    Get.defaultDialog(
        title: "Delete Item",
        titleStyle: const TextStyle(fontSize: 20),
        middleText: 'Are you sure you want to delete item?',
        textCancel: "Cancel",
        textConfirm: "Confirm",
        confirmTextColor: Colors.black,
        onCancel: () {},
        onConfirm: () {
          controller.deleteData(docId);
        });
  }
}
