import 'package:cloud_firestore/cloud_firestore.dart';
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

import 'package:firebase_core/firebase_core.dart';
import 'package:path/path.dart'; //needed for basename



class AfterSplash extends StatefulWidget{
  @override
  _AfterSplash  createState() => _AfterSplash ();
}

class _AfterSplash extends State<AfterSplash>{
  Future<void> _loadCategories(String x) async {
    //List categoryList = new List();
    setState(() {
      _loading = true;
    });
    //for(int i; i<2; i++) {
    //int x = i+1;
    //String num = x as String;
    await fbDatabase.findCategories(x);

    //}
    setState(() {
      _loading = false;
    });
    //return categoryList;
  }


  bool _loading = false;
  /* Future<String> _loadDataAsset() async {
    return await rootBundle.loadString('assets/data.json');
  }

  Future loadData() async {
    setState(() {
      _loading = true;
    });
    String jsonPage = await _loadDataAsset();
    final jsonResponse = json.decode(jsonPage);
    setState(() {
      data = new Data.fromJson(jsonResponse);
    });
    print(data.vedios[1].vedio_id);
    setState(() {
      _loading = false;
    });
  }
*/
  int count = 0;
  Future <void> getLength(int x) async{

    /*Query _messageRef;
  _messageRef = FirebaseFirestore.instance.collection('myCategories');
  await _messageRef.get().then((QuerySnapshot snapshot) {

      count = snapshot.size;

  });*/
    Query _messageRef;
    _messageRef = FirebaseFirestore.instance.collection('myCategories');
    await _messageRef.get().then((QuerySnapshot snapshot) {
      x = snapshot.size;

    });
  }
  @override
  void initState() {
    super.initState();
    //loadData();
    Query _messageRef;
    _messageRef = FirebaseFirestore.instance.collection('myCategories');
    _messageRef.get().then((QuerySnapshot snapshot) {
      count = snapshot.size;
      for (int index = 0; index < count; index++) {
        int x = index+1;
        String n = x.toString();
        _loadCategories(n);
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('نظرة عامة على الكتاب المقدس',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20.5), textAlign: TextAlign.right),
      ),
      drawer: new Drawer(
        elevation: 100.0,
        child: new Column(
          children: <Widget>[
            new Expanded(
              child: ListView(
                children: <Widget>[
                  Container(
                    height:200.0,
                    child: new UserAccountsDrawerHeader(

                      currentAccountPicture: new CircleAvatar(

                        backgroundImage: new NetworkImage(
                            'https://i1.sndcdn.com/avatars-000555541428-pqrdtz-t500x500.jpg'),
                      ),
                      accountName: new Text(
                        'نظرة عامة على ',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25.0,
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      accountEmail: new Text(
                        'الكتاب المقدس',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),

                      decoration: BoxDecoration(
                        color: Colors.lightBlue[900],
                      ),
                    ),
                  ),
                  ListTile(
                    title: Text('عرض الكل',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 19)),
                    onTap: () => {
                      Navigator.push(
                        context,
                        new MaterialPageRoute(
                          builder: (_) => new Allvedios(),
                        ),
                      ),
                    },
                  ),
                  for (int index = 0; index < fbDatabase.allCategories.length; index++)
                    ListTile(
                      title: Text('${fbDatabase.allCategories[index].category_title}',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 19)),
                      onTap: () => {
                        //if (fbDatabase.allCategories[index].category_title == 'العهد القديم')
                        Navigator.push(
                          context,
                          new MaterialPageRoute(
                            builder: (_) => new CatPage(cat_id: fbDatabase.allCategories[index].category_id, cat_title: fbDatabase.allCategories[index].category_title,),
                          ),
                        ),
                      },
                    ),
                  ListTile(
                    leading: Icon(Icons.exit_to_app),
                    title: Text('خروج',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 19)),
                    onTap: () => {
                      //Navigator.of(context).pop()
                      //exit(0)
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('هل أنت متأكد'),
                          content: Text('هل تريد الخروج من البرنامج؟'),
                          actions: <Widget>[
                            FlatButton(
                              onPressed: () => Navigator.of(context).pop(false),
                              child: Text('لا'),
                            ),
                            FlatButton(
                              onPressed: () =>
                              /*Navigator.of(context).pop(true)*/
                              SystemChannels.platform.invokeMethod('SystemNavigator.pop'),
                              child: Text('نعم'),
                            ),
                          ],
                        ),
                      )
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Display(),
    );
  }

}