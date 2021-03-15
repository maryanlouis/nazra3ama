import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nathra_ama/data.dart';

FirebaseException error;

//myvedios myVedios = new myvedios();
List<myvedios> allVedios = [];
List<resource_link> allLinks= [];
List<mycategories> allCategories= [];
Data alldata = new Data();
Future<void> findVedios(String num) async {
  //List vedios = new List();
  DocumentReference _messageRef;
  _messageRef = FirebaseFirestore.instance.collection('myVedios').doc('vedio${num}');
  //String value;
  //Query query = _messageRef.equalTo(value, key: key);
  await _messageRef.get().then((DocumentSnapshot snapshot) async {
    //snapshot.docs.forEach((document) async {

         //value = snapshot.value.toString();
         //var data = snapshot.value;
         //Map<dynamic, dynamic>.from(snapshot.value).forEach((key,values) {
         //vedios.add(snapshot.value);
         //var keys = snapshot.value.keys;

         //allVedios.clear();
         //for (var key in keys) {

         //}
    //int n = num as int;
         //for(int y=0; y<2; y++) {
           //int z = y + 1;
           //String a = z.toString();
           //DocumentReference _linkRef;
           //_linkRef = _messageRef.collection("resourceLink").doc('link${a}');
           //await _linkRef.get().then((DocumentSnapshot snapshot) {
             /*resource_link d = new resource_link(
               link: snapshot.data()["link"] as String,
               resource_title: snapshot.data()['resourceTitle'] as String,
             );
             allLinks.add(d);*/

           //});
         //}
         myvedios e = new myvedios(
             vedio_title: snapshot.data()['title'] as String,
             vedio_id: snapshot.data()['id'] as String,
             vedio_category: snapshot.data()['categoryId'] as int,
             serial: snapshot.data()['serial'] as int,
             vedio_description: snapshot.data()['description'] as String,
         );
         allVedios.add(e);
         allVedios.sort((a, b) => a.serial.compareTo(b.serial));
       //});
    });

  //return vedios;

}

Future<List> findVediosLinks(String num, String x) async {
  //List vediolinks = new List();

  //for(int i; i<2; i++){
    //int y =i+1;
    //String x = y.toString();
  DocumentReference _messageRef;
  _messageRef = FirebaseFirestore.instance.collection('myVedios').doc('vedio${num}').collection("resourceLink").doc("link${x}");
  //String value;
  //Query query = _messageRef.equalTo(value, key: key);
  await _messageRef.get().then((DocumentSnapshot snapshot) {
    //snapshot.docs.forEach((document) async {
      //var data = snapshot.value;
      //value = snapshot.value.toString();
      //Map<dynamic, dynamic>.from(snapshot.value).forEach((key,values) {
      //vediolinks.add(snapshot.value);
      ///});
      //var keys = snapshot.value.keys;

      //allLinks.clear();
      // for (var key in keys) {
      resource_link d = new resource_link(
        link: snapshot.data()["link"] as String,
        resource_title: snapshot.data()['resourceTitle'] as String,
        vedio_serial: snapshot.data()['vedioSerial'] as int
      );
      //int k = num as int;
       return allLinks.add(d);
      //}
      // });
    });
  //});
  //}
  //return vediolinks;
}

Future<void> findCategories(String num) async {
  //List categories = new List();
  DocumentReference _messageRef;
  _messageRef = FirebaseFirestore.instance.collection('myCategories').doc("category${num}") ;
 // String value;
  //Query query = _messageRef.equalTo(value, key: key);

  await _messageRef.get().then((DocumentSnapshot snapshot) {
    //snapshot.docs.forEach((document) async {
      //snapshot.docs.forEach((document) async {
      //var data = snapshot.value;
      //value = snapshot.value.toString();
      //Map<dynamic, dynamic>.from(snapshot.value).forEach((key,values) {
      //categories.add(snapshot.value);
      //});
      //allCategories.clear();
      //var keys = snapshot.value.keys;
      //for (var key in keys) {
      //_data.categories.clear();
      mycategories d = new mycategories(
        category_id: snapshot.data()["categoryId"] as int,
        category_title: snapshot.data()["categoryTitle"] as String,
      );
      allCategories.add(d);
      allCategories.sort((a,b) => a.category_id.compareTo(b.category_id));
      //}

    //});
    });
    //return categories;

    //});
  //});
}
//int length = 0;

/*Future<String> findRange(String user, String key) async {
  DatabaseReference _messageRef;
  _messageRef = FirebaseDatabase.instance.reference().child('messages/${user}');
  String value;
  Query query = _messageRef.endAt(value, key: key);
  await query.once().then((DataSnapshot snapshot) {
    value = snapshot.value.toString();
  });

  return value;
}*/
