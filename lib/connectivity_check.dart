import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:nathra_ama/aftersplash.dart';
class connectionCheck  extends StatefulWidget{
  @override
  _connectionCheck  createState() => _connectionCheck ();

}


class _connectionCheck extends State<connectionCheck >  {
bool isconnected = false;
  Future<bool> isInternet() async {
    ConnectivityResult connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile) {
      // I am connected to a mobile network, make sure there is actually a net connection.
      if (await DataConnectionChecker().hasConnection) {
        // Mobile data detected & internet connection confirmed.
        //return true;
        setState(() {
          isconnected = true;
        });
      } else {
        // Mobile data detected but no internet connection found.
        //return false;
        setState(() {
          isconnected = false;
        });
      }
    } else if (connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a WIFI network, make sure there is actually a net connection.
      if (await DataConnectionChecker().hasConnection) {
        // Wifi detected & internet connection confirmed.
        //return true;
        setState(() {
          isconnected = true;
        });
      } else {
        // Wifi detected but no internet connection found.
        //return false;
        setState(() {
          isconnected = false;
        });
      }
    } else {
      // Neither mobile data or WIFI detected, not internet connection found.
      //return false;
      setState(() {
        isconnected = false;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isInternet();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isconnected == false? new Container(
            color: Colors.black12,
            child: Center(
              child:new Text(
                  'يرجى الأتصال بالأنترنت والمحاولة مرة أخرى',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.black
                      ),
                textAlign: TextAlign.center,
              ),
            )
          ):AfterSplash()
    );
  }

}