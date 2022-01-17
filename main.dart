
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:fluttertoast/fluttertoast.dart';


void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    StreamSubscription subscription;
    Future checkConnection() async{
      var connectivityResult = await(Connectivity().checkConnectivity());
      if (connectivityResult==ConnectivityResult.mobile){
        Fluttertoast.showToast(msg: "Connected with mobile");
      }
      else if (connectivityResult==ConnectivityResult.wifi){
        Fluttertoast.showToast(msg: "Connected with Wifi");
      }
      else{
        Fluttertoast.showToast(msg: "Not Connected");
      }
    }
    initState() {
      subscription = Connectivity().onConnectivityChanged.listen((event) {
        checkConnection();
      });
    }



    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlineButton(onPressed: checkConnection,child: Text('Check Your Internet'),),

          ],
        ),
      ),
    );
  }
}



