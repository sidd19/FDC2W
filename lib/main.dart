
//this code is for spi communication




import 'package:flutter/material.dart';

import 'package:dart_periphery/dart_periphery.dart';
var spi = SPI(0, 0, SPImode.mode0, 1000000);
var bme280 = BME280.spi(spi);
var r = bme280.getValues();

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

  void initState()
  {
    super.initState();



      try {
        print('SPI info:' + spi.getSPIinfo());

        print('Temperature [°] ${r.temperature.toStringAsFixed(1)}');
        print('Humidity [%] ${r.humidity.toStringAsFixed(1)}');
        print('Pressure [hPa] ${r.pressure.toStringAsFixed(1)}');
      } finally {
        spi.dispose();
      }


  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(
        child:Column(
          children: [Text("data is $r",style:TextStyle(color:Colors.blue),//data
          )],
        )
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.


      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
///////////////////////

/*
import 'dart:async';

import 'package:rpi_spi/rpi_spi.dart';

import 'mcp3008.dart';

void main() async {
  final spi = RpiSpi();
  await readSensor(Mcp3008(spi, 0, 24));
  spi.dispose();
}

Future readSensor(Mcp3008 mcp3008) async {
  StringBuffer out;
  print('Read analog values from MCP3008 channels 0 - 7:');

  print('      | Channel');
  out = StringBuffer('      ');
  for (var channel = 0; channel < 8; ++channel) {
    out.write('| ${channel.toString().padLeft(4)} ');
  }
  print(out.toString());
  print('-' * 63);

  for (var count = 1; count <= 10; ++count) {
    await Future.delayed(const Duration(seconds: 1));
    out = StringBuffer(' ${count.toString().padLeft(4)} ');
    for (var channel = 0; channel < 8; ++channel) {
      var value = mcp3008.read(channel);
      out.write('| ${value.toString().padLeft(4)} ');
    }
    print(out.toString());
    await Future.delayed(Duration(milliseconds: 10));
  }
}
 */
