import 'dart:async';

import 'package:flutter/material.dart';

import 'package:libserialport/libserialport.dart';

import 'dart:typed_data';
import 'package:flutter/material.dart';
String my_data='';

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

  List<String> availablePort = SerialPort.availablePorts;



  @override
  void initState()
  {

    super.initState();
    SerialPort port = SerialPort('/dev/ttyUSB0');
    port.open(mode: 3);
    port.config.baudRate = 115200;
    port.config.bits=8;
    port.config.parity=0;
    port.config.stopBits=1;
    print('Available Port: $availablePort');


    try {

      print('Serial port opened: $port');
      print('Baud rate is ${port.config.baudRate}');



//      port.write(_stringToUinst8List('*E12345 123 1 123456 1 1 1 1 1 1 111K#'));



      //Read from port



      SerialPortReader reader = SerialPortReader(port);

      Stream<String> upcomingData = reader.stream.map((data) {
        my_data=String.fromCharCodes(data);
        setState(() {
          // Get the current time and format it as HH:mm:ss
          my_data=String.fromCharCodes(data);
        });

        return String.fromCharCodes(data);

      });

      upcomingData.listen((data) {

        print('Read Data: $data');

      });

    } on SerialPortError catch (err, _) {

      print(SerialPort.lastError);

      port.close();

    }





  }









  @override
  Widget build(BuildContext context) {



    return Scaffold(

      body: Center(
        child:Container(
          alignment:Alignment.center,
          height:600,
          width:800,
          child:Text('data is $my_data',style:TextStyle(fontSize:20,fontWeight:FontWeight.bold)),
        )
    ));
  }
}
