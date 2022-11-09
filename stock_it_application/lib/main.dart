import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stock it!',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: const MyHomePage(title: 'Stock it!'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void addItem() {
    setState(() {
      FirebaseFirestore.instance
          .collection('item')
          .add({'name': 'butter', 'shelf-life': 99});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title,
            style: GoogleFonts.architectsDaughter(
                fontSize: 50, fontWeight: FontWeight.w700)),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            const Text(
              'Item List',
              style: TextStyle(fontSize: 40),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addItem,
        tooltip: 'addItem',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
