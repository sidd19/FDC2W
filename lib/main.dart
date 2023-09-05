import 'package:flutter/material.dart';
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
      final pipePath =
          'textnotes/pipe_test'; // Replace with the actual path to your named pipe

      // Open the named pipe for reading

      final pipe = File(pipePath).openRead();

      pipe.transform(utf8.decoder).listen((data) {
        print(data);

        mydata = data;

        // pipe_data=data.toString();
      }, onDone: () => print('Done'));

      setState(() {
        filedata = mydata;
      });
    } catch (e) {
      print('Error loading gauge values: $e');
    }
  }

  @override
  void initState() {
    super.initState();

    //indicator();
    //update_value();
    update_value();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Text(filedata),

          // This trailing comma makes auto-formatting nicer for build methods.
        ));
  }
}
