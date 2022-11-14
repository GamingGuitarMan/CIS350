import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:stock_it_application/Binding/controller_binding.dart';
import 'package:stock_it_application/Binding/homeBinding.dart';
import 'package:stock_it_application/Views/homepage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Stock it!',
        theme: ThemeData(
          primarySwatch: Colors.lightGreen,
        ),
        home: HomeView(),
        initialBinding: HomeBinding());
  }
}
