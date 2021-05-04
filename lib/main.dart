import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nathra_ama/categoriesPages.dart';
import 'package:nathra_ama/display.dart';
import 'dart:convert';
import 'dart:async';
import 'dart:io';
import 'package:nathra_ama/allvedios.dart';
import 'package:nathra_ama/data.dart';
import 'package:splashscreen/splashscreen.dart';
import 'database.dart' as fbDatabase;
import 'package:nathra_ama/aftersplash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:path/path.dart'; //needed for basename
import 'package:nathra_ama/connectivity_check.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  /*String name= 'nathra3ama';
  final FirebaseOptions firebaseOptions = const FirebaseOptions(
      apiKey: "AIzaSyDWItbD8ioZR32dJT9dHUWnoj1gHZ9Pgl4",
      authDomain: "nathra3ama.firebaseapp.com",
      databaseURL: "https://nathra3ama-default-rtdb.firebaseio.com",
      projectId: "nathra3ama",
      storageBucket: "nathra3ama.appspot.com",
      messagingSenderId: "627444331244",
      appId: "1:627444331244:web:c8e66878306713ccc62bc9",
      measurementId: "G-HQSYXLCGZ0"
  );
  FirebaseApp app = await Firebase.initializeApp(name: name, options: firebaseOptions);*/

  //final FirebaseStorage storage = new FirebaseStorage(app: app,storageBucket: 'gs://fir-app-c70aa.appspot.com');
  //final FirebaseFirestore database = new FirebaseDatabase(app: app);app:app, database: database
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp();
  /*final FirebaseApp app;
  final FirebaseDatabase database;*/
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Hide the debug banner
      debugShowCheckedModeBanner: false,
      title: 'نظرة عامة',
      theme: ThemeData(
        primaryColor: Colors.lightBlue[900],
      ),
      builder: (context, child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: child,
        );
      },
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage();
  /*final FirebaseApp app;
  final FirebaseDatabase database;*/
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Data data = new Data();
  //_HomePageState();
  /*final FirebaseApp app;
  final FirebaseDatabase database;*/
  String _username;

  //List vedios;
  //List categoriesTitle = new List();

  /*Future<List> _loadVedios(String key) async {
    setState(() {
      _loading = true;
    });
    for(int i; i<2; i++) {
      vedios[i] = await fbDatabase.findVedios(key,i);
    }
    setState(() {
      _loading = false;
    });
    return vedios;
  }*/



  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      seconds: 14,
      navigateAfterSeconds: new connectionCheck(),
      title: new Text(
        'نظرة عامة على الكتاب المقدس',
        style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
      ),
      image: new Image.asset(
          'assets/nazra3amma.jpeg',
      ),
      photoSize: 150.0,
      backgroundColor: Colors.white,
      loaderColor: Colors.blue[900],
    );
  }
}
