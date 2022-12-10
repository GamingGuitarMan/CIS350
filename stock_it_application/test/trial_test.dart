import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:stock_it_application/app/home/Controller/homeController.dart';

void main() {
  group('saveUpdateItem test', () {
    final formKey = GlobalKey<FormState>();
    final collectionReference = FirebaseFirestore.instance.collection('items');

    test('adds new item to collection', () async {
      final name = 'Item Name';
      final shelfLife = 'Shelf Life';
      final addEditFlag = 1;
      final homeController = HomeController();
      homeController.saveUpdateItem(name, shelfLife, '', addEditFlag);

      final snapshot = await collectionReference.get();
      final items = snapshot.docs;

      expect(items.length, 1);
      expect(items[0].get('name'), name);
      expect(items[0].get('shelfLife'), shelfLife);
    });

    test('updates existing item in collection', () async {
      final name = 'Updated Item Name';
      final shelfLife = 'Updated Shelf Life';
      final addEditFlag = 2;

      // Add an initial item to the collection
      await collectionReference.add(
          {'name': 'Initial Item Name', 'shelfLife': 'Initial Shelf Life'});
      final snapshot = await collectionReference.get();
      final items = snapshot.docs;
      final docId = items[0].id;
      final homeController = HomeController();
      homeController.saveUpdateItem(name, shelfLife, docId, addEditFlag);

      // Fetch the updated item from the collection
      final updatedSnapshot = await collectionReference.get();
      final updatedItems = updatedSnapshot.docs;

      expect(updatedItems.length, 1);
      expect(updatedItems[0].get('name'), name);
      expect(updatedItems[0].get('shelfLife'), shelfLife);
    });
  });






group('timeUpdate test', () {
    final collectionReference = FirebaseFirestore.instance.collection('items');
    final timeReference = FirebaseFirestore.instance.collection('time').doc('1');

    // Set up Firebase before running each test
    setUp(() async {
      await Firebase.initializeApp();
      // Clear the items collection before each test
      await collectionReference.get().then((snapshot) async {
        for (final doc in snapshot.docs) {
          await doc.reference.delete();
        }
      });
      // Clear the time collection before each test
      await timeReference.get().then((snapshot) async {
        if (snapshot.exists) {
          await timeReference.delete();
        }
      });
    });

test('updates shelf life of items when time has passed', () async {
      // Add an initial item to the collection
      final initialDocRef = await collectionReference.add({
        'name': 'Initial Item Name',
        'shelfLife': 5,
      });

      // Add a time record to the collection
      await timeReference.set({
        'lastTime': Timestamp.fromMillisecondsSinceEpoch(
            DateTime.now().subtract(Duration(days: 2)).millisecondsSinceEpoch),
      });

      // Call the timeUpdate function
      final homeController = HomeController();
      homeController.timeUpdate();

      // Fetch the updated item from the collection
      final updatedSnapshot = await initialDocRef.get();
      final updatedItem = updatedSnapshot.data() ?? {};

      expect(updatedItem['shelfLife'], 3);

    });

    test('does not update shelf life of items when no time has passed', () async {
      // Add an initial item to the collection
      final initialDocRef = await collectionReference.add({
        'name': 'Initial Item Name',
        'shelfLife': 5,
      });

      // Add a time record to the collection
      await timeReference.set({
        'lastTime' : Timestamp.fromMillisecondsSinceEpoch(
            DateTime.now().subtract(Duration(hours: 2)).millisecondsSinceEpoch),
      });

      // Call the timeUpdate function
      final homeController = HomeController();
      homeController.timeUpdate();
      // Fetch the updated item from the collection
      final updatedSnapshot = await initialDocRef.get();
      final updatedItem = updatedSnapshot.data();

      expect(updatedItem!['shelfLife'], 5);
    });
  });
}




