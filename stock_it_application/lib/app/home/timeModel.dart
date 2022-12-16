import 'package:cloud_firestore/cloud_firestore.dart';

class TimeModel {
  String? docId = '1';
  DateTime? lastTime;

  TimeModel({this.docId, this.lastTime});

  TimeModel.fromMap(DocumentSnapshot data) {
    docId = data.id;
    lastTime = data["lastTime"];
  }
}
