import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:stock_it_application/app/home/Binding/controller_binding.dart';
import 'package:stock_it_application/app/home/Binding/homeBinding.dart';
import 'package:stock_it_application/app/home/Views/homepage.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Stock it!",
      initialRoute: AppPages.INITAL,
      getPages: AppPages.routes,
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark().copyWith(
        primaryColor: Color(0xff141A31),
        primaryColorDark: Color(0xff081029),
        scaffoldBackgroundColor: Color(0xff141A31),
        textSelectionTheme: TextSelectionThemeData(cursorColor: Colors.amber),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              backgroundColor: MaterialStateProperty.all(Colors.blueGrey)),
        ),
        colorScheme:
            ColorScheme.fromSwatch().copyWith(secondary: Colors.yellow),
      ),
    ),
  );
}
