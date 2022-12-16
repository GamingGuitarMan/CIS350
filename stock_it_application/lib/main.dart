import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:stock_it_application/app/home/Binding/controller_binding.dart';
import 'package:stock_it_application/app/home/Binding/homeBinding.dart';
import 'package:stock_it_application/app/home/Views/homepage.dart';

import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages

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




// OPEN AI FUNCTION FOR NOTIFICATIONS AND FOR SCHEDULING
// TODO: EDIT AND IMPLEMENT WITH CURRENT APP
/**
 import 'package:flutter/material.dart';
import 'package:firebase/firebase.dart' as firebase;
import 'package:firebase/firestore.dart' as fs;
import 'package:firebase/messaging.dart' as fcm;

void main() {
  runApp(MyApp());

  // Initialize Firebase and Firestore
  firebase.initializeApp();
  fs.firestore().settings({
    'timestampsInSnapshots': true,
  });

  // Request permission to show notifications and handle incoming messages
  fcm.Messaging.onMessage((message) {
    showNotification(message);
  });
  fcm.Messaging.requestPermission();
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DateTime _selectedDate;
  TimeOfDay _selectedTime;
  String _selectedFrequency;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            RaisedButton(
              onPressed: () async {
                // Show the date picker and wait for the user to select a date
                final DateTime picked = await showDatePicker(
                  context: context,
                  initialDate: _selectedDate,
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2030),
                );

                // If a date was selected, update the state
                if (picked != null && picked != _selectedDate)
                  setState(() {
                    _selectedDate = picked;
                  });
              },
              child: Text('Select a date'),
            ),
            RaisedButton(
              onPressed: () async {
                // Show the time picker and wait for the user to select a time
                final TimeOfDay picked = await showTimePicker(
                  context: context,
                  initialTime: _selectedTime,
                );

                // If a time was selected, update the state
                if (picked != null && picked != _selectedTime)
                  setState(() {
                    _selectedTime = picked;
                  });
              },
              child: Text('Select a time'),
            ),
            DropdownButton<String>(
              value: _selectedFrequency,
              onChanged: (String newValue) {
                setState(() {
                  _selectedFrequency = newValue;
                });
              },
              items: <String>['Daily', 'Weekly', 'Monthly']
                .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
            ),
            RaisedButton(
              onPressed: () {
                // Create a new appointment with the selected date, time, and frequency
                final appointment = firebase.firestore().collection('appointments').
 */