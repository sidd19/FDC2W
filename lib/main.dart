

//importing all the required package

import 'dart:io';
import 'package:flutter_homescreen/regenmode.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
//import 'package:percent_indicator/percent_indicator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_homescreen/powermode.dart';
import 'package:flutter_homescreen/parkingmode.dart';
import 'package:flutter_homescreen/menubar.dart';
import 'package:flutter_homescreen/general_settings.dart';
import 'package:flutter_homescreen/sound.dart';
import 'package:flutter_homescreen/my_vehicle.dart';
import 'package:flutter_homescreen/trip_meter.dart';
import 'package:google_fonts/google_fonts.dart';

//package import done



//main function
void main() {
  runApp( MyApp());
}

////end of Main function

class MyApp extends StatelessWidget {
 // const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      title: 'Flutter Demo',
        debugShowCheckedModeBanner:false,


        //Setting the pages routes

        routes: {
          '/': (context) =>MyHomePage(),
          '/second': (context) => powermode(),
          '/third':(context)=>regenmode(),
          '/fourth': (context) =>parkingmode(),
          '/fifth':(context)=>menubar(),
        },
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),

        useMaterial3: true,
      ),

    );
  }
}

class MyHomePage extends StatefulWidget {
  //const MyHomePage({super.key, required this.title});

  //final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}





class _MyHomePageState extends State<MyHomePage> {

  @override

  //This function is used to pop up the menu bar




  List<double> _gaugeValues = [0.0, 0.0]; // Initialize the gauge values

  @override
  void initState() {
  super.initState();
  }

  void _updateGaugeValues(String input) {
  List<String> valueStrings = input.split(',');

  if (valueStrings.length != _gaugeValues.length) {
  print('Invalid input. Please enter exactly ${_gaugeValues.length} values.');
  return;
  }

  List<double> newGaugeValues = [];
  for (String valueString in valueStrings) {
  double? value = double.tryParse(valueString.trim());
  if (value == null) {
  print('Invalid input. Please enter numeric values.');
  return;
  }
  newGaugeValues.add(value);
  }

  setState(() {
  _gaugeValues = newGaugeValues;
  });
  }




  void _handleButtonPress() async {
    stdout.write('Enter comma-separated values for gauges: ');

    // Delay reading the input by a short duration to allow the UI to remain responsive



    String data="50,75";
    _updateGaugeValues(data);
    setState(() {

    });
  }























  void _showDynamicPopup(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height:100,
            width:1000,
            color:Colors.yellow,
            padding: EdgeInsets.only(bottom: 16.0),
            child: Row(
              mainAxisAlignment:MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                //Power Mode elevated button
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the popup
                    Navigator.pushNamed(context, '/second'); // Navigate to the second screen
                  },
                  child: Text('Power mode'),
                ),


                //Regen Mode elevated button


                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the popup
                    Navigator.pushNamed(context, '/third');
                  },
                  child: Text('Regen Mode'),
                ),



                //Parking Mode elevated button
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the popup
                    Navigator.pushNamed(context, '/fourth');
                  },
                  child: Text('Parking Mode'),
                ),



                //Menu Bar elevated button

                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the popup
                    Navigator.pushNamed(context, '/fifth');
                  },
                  child: Text('Menu Bar'),
                ),



              ],
            ),
          ),
        );
      },//builder
    );//show model bottom sheet
  } //show dynamic pop up


 //End of pop function



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor:Color(0xffFFBF00),

        title: Text("TVS Star City Demo"),
      ),
      body: Center(
          child: Container(
                 height:600,
                 width:1200,


                 decoration:BoxDecoration(

                    color:Color(0xffFFFE0),//Color(0xffF8F8F8)

                   borderRadius:BorderRadius.only(topLeft:Radius.elliptical(100,100),bottomLeft:Radius.elliptical(100,100),topRight:Radius.elliptical(100, 100),bottomRight:Radius.elliptical(100, 100)),



                     border:Border.all(
                       color:Colors.black26,//Color(0xff38eeff),
                       width:3,



                     ),
                     boxShadow:[
                       BoxShadow(
                         blurRadius:11,
                         spreadRadius:11,
                         color:Colors.white,//Color(0xff38eeff),
                       )
                     ]
                 ),
            child: Center(
              child: Column(
                children: [


                  SizedBox(
                    height:50,
                    width:200,
                    child:Row(
                      children: [
                       // ElevatedButton(
                       //    onPressed:(){
                       //      _showDynamicPopup(context);
                       //    }
                       //    ,
                       //  child:Text("menu"),style:ElevatedButton.styleFrom(backgroundColor:Colors.yellowAccent,shadowColor:Colors.white)),
                       //
                       //  ElevatedButton(
                       //      onPressed:(){
                       //        _handleButtonPress();
                       //      }
                       //      ,
                       //      child:Text("speed"),style:ElevatedButton.styleFrom(backgroundColor:Colors.yellowAccent,shadowColor:Colors.white)),
                      ],
                    )


                  ),
                  SizedBox(height:10),
                  SizedBox(
                    height: 100,
                    width: 800,
                    child:Row(
                      mainAxisAlignment:MainAxisAlignment.spaceAround,
                      children: [

                        Icon(Icons.call,size:40,color:Color(0xff323232)),
                        Icon(Icons.message,size:40,color:Color(0xff323232)),
                        Icon(Icons.bluetooth,size:40,color:Color(0xff323232)),
                        Icon(Icons.network_cell,size:40,color:Color(0xff323232)),
                        Icon(Icons.battery_4_bar_rounded,size:40,color:Color(0xff323232))


                      ],


                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left:140.0,top:0.0),
                        child: Center(
                          child: Container(
                            height:300,
                            width:900,
                            //here we are doing the box decoration
                            decoration:BoxDecoration(
                                color:Colors.white,//Color(0xffCCCCFF),//Color(0xff38eeff),
                                borderRadius:BorderRadius.only(topLeft:Radius.circular(800),bottomLeft:Radius.circular(800),topRight:Radius.elliptical(100, 100),bottomRight:Radius.elliptical(100, 100)),
                                border:Border.all(
                                  color:Colors.black26,//Color(0xff38eeff),
                                  width:3,



                                ),
                                boxShadow:[
                                  BoxShadow(
                                    blurRadius:3,
                                    spreadRadius:3,
                                    color:Colors.black26,//Color(0xff38eeff),
                                  )
                                ]
                            ),
                            //boxdecoration end




                            child: Row(
                              mainAxisAlignment:MainAxisAlignment.start,
                              children: [
                                SfRadialGauge(
                                  enableLoadingAnimation: true, animationDuration: 4500,
                                  //
                                  axes: <RadialAxis>[RadialAxis(
                                       minimum:0,maximum:120,isInversed:false,
                                       startAngle:50,//240,//90
                                       endAngle:-50,//240,//-90
                                       interval:10,
                                       showLabels:false,
                                       showTicks:false,

                                      axisLineStyle: AxisLineStyle(thickness: 30,color:Color(0xffEC5800)),

                                      pointers: <GaugePointer>[NeedlePointer(value: 100, enableAnimation: true,
                                          needleStartWidth: 0,

                                          needleEndWidth: 0, needleColor: Color(0xFFDADADA),
                                          knobStyle: KnobStyle(color: Colors.white, borderColor: Color(0xFFDADADA),

                                              knobRadius: 0.00,
                                              borderWidth: 0.00),
                                          tailStyle: TailStyle(color:Color(0xFFDADADA), width: 0,
                                              length: 0.0),
                                         animationType:AnimationType.ease,

                                      ),
                                        RangePointer(value: _gaugeValues[0], width: 30, enableAnimation: false, color: Color(0xffFCD12A))                     //0xff0FFF50 for eco mode
                                      ],





                              annotations:<GaugeAnnotation>
                                      [





                                GaugeAnnotation(widget:Text("ECO",style:TextStyle(fontSize:30,fontWeight:FontWeight.bold,color:Color(0xffFF7417)),),
                                       angle:-90,
                                       positionFactor:0.4,)

                                       ,

                                GaugeAnnotation(widget:Text("100",style:TextStyle(fontSize:60,fontWeight:FontWeight.bold,color:Color(0xffFF7417)),),
                                  angle:-90,
                                  positionFactor:0.1,),


                                GaugeAnnotation(widget:Text("kmph",style:TextStyle(fontSize:20,fontWeight:FontWeight.bold,color:Colors.black38),),
                                  angle:90,
                                  positionFactor:.4,),



                                      ]
                                  )],
                                ),




                                Padding(
                                  padding: const EdgeInsets.only(bottom:20.0),
                                  child: Column(
                                    mainAxisAlignment:MainAxisAlignment.start,
                                    crossAxisAlignment:CrossAxisAlignment.start,
                                    children: [


                                      Padding(
                                        padding: const EdgeInsets.only(bottom:80.0,left:0),
                                        child: Row(
                                          mainAxisAlignment:MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(left:0,top:10),
                                              child: Container(
                                                  height:30,
                                                  width:30,
                                                  decoration:const BoxDecoration(
                                                    image:DecorationImage(image: ExactAssetImage('assets/images/left.png'),
                                                      fit:BoxFit.fill,),

                                                  )

                                              ),
                                            ),



                                            Padding(
                                              padding: const EdgeInsets.only(left:50.0,top:10),
                                              child: Container(
                                                  height:30,
                                                  width:30,
                                                  decoration:const BoxDecoration(
                                                    image:DecorationImage(image: ExactAssetImage('assets/images/high-beam.png'),
                                                      fit:BoxFit.fill,),

                                                  )

                                              ),
                                            ),



                                            Padding(
                                              padding: const EdgeInsets.only(left:50.0,top:10),
                                              child: Container(
                                                  height:30,
                                                  width:30,
                                                  decoration:const BoxDecoration(
                                                    image:DecorationImage(image: ExactAssetImage('assets/images/hazard.png'),
                                                      fit:BoxFit.fill,),

                                                  )

                                              ),
                                            ),




                                            Padding(
                                              padding: const EdgeInsets.only(left:50,top:10),
                                              child: Container(
                                                  height:30,
                                                  width:30,
                                                  decoration:const BoxDecoration(
                                                    image:DecorationImage(image: ExactAssetImage('assets/images/malfunction.png'),
                                                      fit:BoxFit.fill,),

                                                  )

                                              ),
                                            ),





                                            Padding(
                                              padding: const EdgeInsets.only(left:50,top:10),
                                              child: Container(
                                                  height:30,
                                                  width:30,
                                                  decoration:const BoxDecoration(
                                                    image:DecorationImage(image: ExactAssetImage('assets/images/side_stand.png'),
                                                      fit:BoxFit.fill,),

                                                  )

                                              ),
                                            ),







                                            Padding(
                                              padding: const EdgeInsets.only(left:50,top:10),
                                              child: Container(
                                                height:30,
                                                width:30,
                                                decoration:const BoxDecoration(
                                                  image:DecorationImage(image: ExactAssetImage('assets/images/right.png'),
                                                    fit:BoxFit.fill,),

                                                )

                                            ),
                                            ),
                                            ],
                                        ),
                                      ),

                                      Padding(
                                        padding: const EdgeInsets.only(left:100.0,top:60),
                                        child: Text("DTE 100km",style:TextStyle(fontSize:24,fontWeight:FontWeight.bold,color:Colors.black87),),
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            width:330,
                                            height:50
                                            ,



                                    child: LinearProgressIndicator(
                                              value: 0.42,

                                              valueColor: AlwaysStoppedAnimation(Color(0xffFCD12A)),
                                             backgroundColor: Colors.grey,
                                            ),
                                           ),

                                          Padding(
                                            padding: const EdgeInsets.only(left:20),
                                            child: Container(
                                              height:50,
                                              width:70,
                                              decoration:const BoxDecoration(
                                                image:DecorationImage(image: ExactAssetImage('assets/images/battery.png'),
                                                fit:BoxFit.fill,),

                                              )

                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Text("50%",style:TextStyle(fontSize:25,fontWeight:FontWeight.bold,color:Colors.black87),),
                                          ),

                                        ],

                                      ),




                                        // child: RotatedBox(
                                        //
                                        //   quarterTurns:-1,
                                        //   child: LinearProgressIndicator(
                                        //     value: 0.42,
                                        //
                                        //     valueColor: AlwaysStoppedAnimation(Colors.orange),
                                        //     backgroundColor: Colors.blue,
                                        //   ),
                                        // ),


                                    ],
                                  ),
                                ),



                              ],
                            ),
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left:38.0),
                        child: SizedBox(
                            height:300,

                            child:Row(

                              mainAxisAlignment:MainAxisAlignment.spaceAround,
                              children: [

                                IconButton(onPressed: (){
                                  Navigator.push(context,MaterialPageRoute(builder:(context)=>powermode()));
                                }, icon:Icon(Icons.keyboard_double_arrow_right,size:100,color:Colors.grey,),
                                )


                              ],

                            )

                        ),
                      ),
                    ],
                  ),

                  Container(
                    width: 600,
                    height: 70,
                     // Set the background color for the container
                    child: Row(
                      mainAxisAlignment:MainAxisAlignment.end,
                      children: [




                      ],
                    ),
                  ),

                  SizedBox(
                  height:0,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top:10,bottom:0,left:44),
                      child: Container(
                        width:1100,//1175


                        decoration:BoxDecoration(

                            color: Colors.white,

                            borderRadius:BorderRadius.only(topLeft:Radius.circular(100),bottomLeft:Radius.circular(100),topRight:Radius.circular(100),bottomRight:Radius.circular(100)),



                            border:Border.all(
                              color:Colors.black26,//Color(0xff38eeff),
                              width:3,



                            ),
                            boxShadow:[
                              BoxShadow(
                                blurRadius:0,
                                spreadRadius:0,
                                color:Colors.white,//Color(0xff38eeff),
                              )
                            ]
                        ),

                        child:Row(
                          mainAxisAlignment:MainAxisAlignment.spaceAround,
                          children: [

                            Text("Avg speed 100 km/h",style:GoogleFonts.roboto(
                              fontSize:24,
                              fontWeight:FontWeight.bold,
                              color:Colors.black,
                            ),

                            ),




                            Text("ODO 309.3 km/h",style:GoogleFonts.roboto(
                              fontSize:24,
                              fontWeight:FontWeight.bold,
                              color:Colors.black,
                            ),),



                            Text("Trip 293.8km",style:GoogleFonts.roboto(
                              fontSize:24,
                              fontWeight:FontWeight.bold,
                              color:Colors.black,
                            ),),


                            Text("TPMS",style:GoogleFonts.roboto(
                              fontSize:24,
                              fontWeight:FontWeight.bold,
                              color:Colors.black,
                            ),),


                          ],
                        ),
                      ),
                    )
                  ],



                )],


              ),
            ),
          )
      ),
    );












  }
}
