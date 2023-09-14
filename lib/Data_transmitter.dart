

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:io'; //for input /output file operations
import 'dart:async'; //for asyncronous or timer related functions
import 'package:intl/intl.dart';

class data_transmitter extends ChangeNotifier
{

  String currentTime = '';


   String updateTime() {

    // Get the current time and format it as HH:mm:ss
    //_date=DateFormat('E d MMMM').format(DateTime.now());
     Timer.periodic(Duration(seconds:1), (timer) { updateTime();});
   return  currentTime = DateFormat('HH:mm:ss').format(DateTime.now());
   notifyListeners();
  }


    // void load_gauge_values()
  // {
  //
  //
  //
  //
  //
  // }





}