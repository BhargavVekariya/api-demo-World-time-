import 'package:flutter/material.dart';
import 'package:worldtimeapp/pages/choose_location.dart';
import 'package:worldtimeapp/pages/home.dart';
import 'package:worldtimeapp/pages/loading.dart';

void main() {
  runApp( MaterialApp(
    initialRoute: '/',
    routes: {
      '/':(context)=>loading(),
    '/home':(context)=>home(),
    '/location':(context)=>Chooselocation(),

    },
    
  ));
}

