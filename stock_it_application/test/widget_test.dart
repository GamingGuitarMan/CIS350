// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.
/*
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:stock_it_application/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
*/

// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/route_manager.dart';
import 'dart:async';

import 'package:stock_it_application/app/home/Binding/controller_binding.dart';
import 'package:stock_it_application/app/home/Binding/homeBinding.dart';
import 'package:stock_it_application/app/home/Controller/homeController.dart';
import 'package:stock_it_application/app/home/Views/homepage.dart';
import 'package:stock_it_application/main.dart';
import 'package:stock_it_application/app/home/Views/customFullScrenDialog.dart';
import 'package:stock_it_application/app/home/Controller/homeController.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  
  test(HomeController(), () {
    Firebase.initializeApp();

    final saveUpdateTest = HomeController().saveUpdateItem;

    saveUpdateTest("Eggs", "4", "2", 2); // error test

    expect(saveUpdateTest, "Eggs , 4, 1, 2");
  });
}

// Test Save/Update
// Database: For Item that doesnt exist
// Validate name
// delete data
// time update
// Decrement date life
// Home controller
