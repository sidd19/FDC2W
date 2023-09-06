import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:io'; //for input /output file operations
import 'dart:async'; //for asyncronous or timer related functions
import 'dart:convert';
Timer? timer;
Timer? timer1;
String mydata = '';
String filedata = '';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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


  @override


  void update_value() {
    if (timer1 == null) {
      timer1 = Timer.periodic(Duration(milliseconds: 100), (_) {
        setState(() {
          loadGaugeValues();

        });
      });
    }
  }




  Future<void> loadGaugeValues() async {
    try {


        print(await http.read(Uri.http('127.0.0.1:8081', 'received_data.txt')));
          mydata=await http.read(Uri.http('127.0.0.1:8081', 'received_data.txt'));
          //print(mydata.substring(mydata.lastIndexOf("*E")-40,mydata.lastIndexOf("k#")));

        setState ((){

          filedata=mydata;

        });

    } catch (e) {
      print('Error loading gauge values: $e');
    }
  }

  @override
  void initState() {
    super.initState();

     update_value();
     //loadGaugeValues();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Center(

           child:Text('data received:$filedata '),

      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
