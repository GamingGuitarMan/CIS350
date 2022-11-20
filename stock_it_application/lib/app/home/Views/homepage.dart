import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Controller/homeController.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(144, 96, 125, 139),
        title: const Text('Stock it!',
            style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 132, 179, 159),
                fontStyle: FontStyle.italic,
                letterSpacing: 2)),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              _buildAddEditItemView(text: 'Add', addEditFlag: 1, docId: '');
            },
          )
        ],
      ),
      body: Obx(
        () => ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: controller.items.length,
          itemBuilder: (context, index) => Card(
            color: Color.fromARGB(197, 126, 177, 147),
            child: ListTile(
              title: Text(controller.items[index].name!),
              subtitle: Text(controller.items[index].shelfLife!),
              trailing: IconButton(
                icon: const Icon(
                  Icons.delete_forever,
                  color: Color.fromARGB(255, 179, 173, 173),
                ),
                onPressed: () {
                  displayDeleteDialog(controller.items[index].docId!);
                },
              ),
              onTap: () {
                controller.nameController.text = controller.items[index].name!;
                controller.shelfLifeController.text =
                    controller.items[index].shelfLife!;
                _buildAddEditItemView(
                    text: 'UPDATE',
                    addEditFlag: 2,
                    docId: controller.items[index].docId!);
              },
            ),
          ),
        ),
      ),
    );
  }

  _buildAddEditItemView({String? text, int? addEditFlag, String? docId}) {
    Get.bottomSheet(Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(16),
          topLeft: Radius.circular(16),
        ),
        color: Color.fromARGB(255, 15, 78, 75),
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
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
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
                        style:
                            const TextStyle(color: Colors.black, fontSize: 16),
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
