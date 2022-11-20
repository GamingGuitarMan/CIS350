import 'package:cloud_firestore/cloud_firestore.dart';

class ItemModel {
  String? docId;
  String? name;
  String? shelfLife;

  ItemModel({this.docId, this.name, this.shelfLife});

  ItemModel.fromMap(DocumentSnapshot data) {
    docId = data.id;
    name = data["name"];
    shelfLife = data["shelfLife"];
  }
}
