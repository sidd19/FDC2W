// // // import 'dart:io';
// // // import 'package:flutter/material.dart';
// // // //import 'gauge_widget.dart';
// // //
// // // void main() {
// // //   runApp(MyApp());
// // // }
// // //
// // // class MyApp extends StatelessWidget {
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return MaterialApp(
// // //       home: Scaffold(
// // //         appBar: AppBar(
// // //           title: Text('Gauge App'),
// // //         ),
// // //         body: GaugeApp(),
// // //       ),
// // //     );
// // //   }
// // // }
// // //
// // // class GaugeApp extends StatefulWidget {
// // //   @override
// // //   _GaugeAppState createState() => _GaugeAppState();
// // // }
// // //
// // // class _GaugeAppState extends State<GaugeApp> {
// // //   List<double> _gaugeValues = [0.0, 0.0]; // Initialize the gauge values
// // //
// // //   @override
// // //   void initState() {
// // //     super.initState();
// // //     _handleInput();
// // //   }
// // //
// // //   void _handleInput() {
// // //     while (true) {
// // //       stdout.write('Enter comma-separated values for gauges: ');
// // //       String input = stdin.readLineSync()!;
// // //       List<String> valueStrings = input.split(',');
// // //
// // //       if (valueStrings.length != _gaugeValues.length) {
// // //         print('Invalid input. Please enter exactly ${_gaugeValues.length} values.');
// // //         continue;
// // //       }
// // //
// // //       List<double> newGaugeValues = [];
// // //       for (String valueString in valueStrings) {
// // //         double? value = double.tryParse(valueString.trim());
// // //         if (value == null) {
// // //           print('Invalid input. Please enter numeric values.');
// // //           newGaugeValues = null;
// // //           break;
// // //         }
// // //         newGaugeValues.add(value);
// // //       }
// // //
// // //       if (newGaugeValues != null) {
// // //         setState(() {
// // //           _gaugeValues = newGaugeValues;
// // //         });
// // //       }
// // //     }
// // //   }
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Column(
// // //       mainAxisAlignment: MainAxisAlignment.center,
// // //       crossAxisAlignment: CrossAxisAlignment.center,
// // //       children: [
// // //         GaugeWidget(value: _gaugeValues[0]),
// // //         GaugeWidget(value: _gaugeValues[1]),
// // //       ],
// // //     );
// // //   }
// // // }
// // //
// // //
// // //
// // //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
//
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'gauge_widget.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Gauge App'),
//         ),
//         body: GaugeApp(),
//       ),
//     );
//   }
// }
//
// class GaugeApp extends StatefulWidget {
//   @override
//   _GaugeAppState createState() => _GaugeAppState();
// }
//
// class _GaugeAppState extends State<GaugeApp> {
//   List<double> _gaugeValues = [0.0, 0.0]; // Initialize the gauge values
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   void _updateGaugeValues(String input) {
//     List<String> valueStrings = input.split(',');
//
//     if (valueStrings.length != _gaugeValues.length) {
//       print('Invalid input. Please enter exactly ${_gaugeValues.length} values.');
//       return;
//     }
//
//     List<double> newGaugeValues = [];
//     for (String valueString in valueStrings) {
//       double? value = double.tryParse(valueString.trim());
//       if (value == null) {
//         print('Invalid input. Please enter numeric values.');
//         return;
//       }
//       newGaugeValues.add(value);
//     }
//
//     setState(() {
//       _gaugeValues = newGaugeValues;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         GaugeWidget(value: _gaugeValues[0]),
//         GaugeWidget(value: _gaugeValues[1]),
//         ElevatedButton(
//           onPressed: () {
//             stdout.write('Enter comma-separated values for gauges: ');
//             String input = stdin.readLineSync()!;
//             _updateGaugeValues(input);
//           },
//           child: Text('Update Gauges'),
//         ),
//       ],
//     );
//   }
// }












