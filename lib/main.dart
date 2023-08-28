
//this code is for spi communication




import 'package:flutter/material.dart';

import 'package:dart_periphery/dart_periphery.dart';

void main() {
 var config = GPIOconfig.defaultValues();
  config.direction = GPIOdirection.gpioDirOut;
  print('Native c-periphery Version :  ${getCperipheryVersion()}');
  print('GPIO test');
  var gpio = GPIO(18, GPIOdirection.gpioDirOut);
  var gpio2 = GPIO(16, GPIOdirection.gpioDirOut);

  var gpio3 = GPIO.advanced(5, config);

  print('GPIO info: ${gpio.getGPIOinfo()}');

  print('GPIO native file handle: ${gpio.getGPIOfd()}');
  print('GPIO chip name: ${gpio.getGPIOchipName()}');
  print('GPIO chip label: ${gpio.getGPIOchipLabel()}');
  print('GPIO chip name: ${gpio.getGPIOchipName()}');
  print('CPIO chip label: ${gpio.getGPIOchipLabel()}');

  for (var i = 0; i < 10; ++i) {
    gpio.write(true);
    gpio2.write(true);
    gpio3.write(true);
    Future.delayed(Duration(milliseconds: 200));
    gpio.write(false);
    gpio2.write(false);
    gpio3.write(false);
    Future.delayed(Duration(milliseconds: 200));
  }

  gpio.dispose();
  gpio2.dispose();
  gpio3.dispose();
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

  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(
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
