import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stock_it_application/Controller/item_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  ItemController itemController = Get.put(ItemController());

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
                title: Text(
                  'Stock it!',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontStyle: FontStyle.italic,
                      letterSpacing: 2),
                )),
            body: Center(
              child: itemController.isLoading
                  ? CircularProgressIndicator()
                  : ListView.separated(
                      itemCount: itemController.itemList.length,
                      itemBuilder: (BuildContext context, index) {
                        return Card(
                          child: Row(children: [
                            Column(
                              children: [
                                Text(
                                  itemController.itemList[index].name,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  itemController.itemList[index].shelfLife,
                                  style: TextStyle(fontSize: 17),
                                  overflow: TextOverflow.visible,
                                  textAlign: TextAlign.start,
                                ),
                              ],
                            ),
                            Row(children: [
                              IconButton(
                                  onPressed: () {}, icon: Icon(Icons.edit)),
                              IconButton(
                                  onPressed: () {}, icon: Icon(Icons.delete))
                            ])
                          ]),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return Divider(thickness: 7, color: Colors.black);
                      },
                    ),
            ),
          );
        });
  }
}
