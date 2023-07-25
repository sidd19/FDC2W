

//importing all the required package

import 'dart:io';
import 'dart:async';
import 'package:cluster_copy/regenmode.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
//import 'package:percent_indicator/percent_indicator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cluster_copy/powermode.dart';
import 'package:cluster_copy/parkingmode.dart';
import 'package:cluster_copy/menubar.dart';
import 'package:cluster_copy/general_settings.dart';
import 'package:cluster_copy/sound.dart';
import 'package:cluster_copy/my_vehicle.dart';
import 'package:cluster_copy/trip_meter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

double value=0;
//variables for signals
bool left=true;
bool right=true;
bool hazard=true;
bool malfunction=true;
bool highbeam=true;
bool side_stand=true;
Timer? timer;

List <double> values=[14,12,13,14,15,16,12,13,14,15,16,18,20,24,26,34,46,14,12,30,32];
int i=0;
int j=0;

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

  String _currentTime = '';

  @override

  //This function is used to pop up the menu bar




  // Initialize the gauge values

  void _updateTime() {
    setState(() {
      // Get the current time and format it as HH:mm:ss
      _currentTime = DateFormat('HH:mm:ss').format(DateTime.now());
    });

    // it will update the ui every 1 second
    Future.delayed(Duration(seconds: 1), _updateTime);
  }




double update_value ()
  {

    if(timer==null)
      {
        timer=Timer.periodic(Duration(milliseconds:500), (_) { setState(() {

          if(j<=20)
         { left=!left;
           right=!right;
           hazard=!hazard;
           malfunction=!malfunction;
           highbeam=!highbeam;
           side_stand=!side_stand;
           j=j+1;}
          if(j>20)
            {
           value=values[i];
           if(i<=values.length)
             {
               i++;
             }
           else if(i>values.length)
             {
               i=0;
             }

        }});
        }


        );

      }
    return value;

  }





  @override
  void initState() {
  super.initState();
  _updateTime();


  }




  // void _updateGaugeValues(String input) {
  // List<String> valueStrings = input.split(',');
  //
  // if (valueStrings.length != _gaugeValues.length) {
  // print('Invalid input. Please enter exactly ${_gaugeValues.length} values.');
  // return;
  // }
  //
  // List<double> newGaugeValues = [];
  // for (String valueString in valueStrings) {
  // double? value = double.tryParse(valueString.trim());
  // if (value == null) {
  // print('Invalid input. Please enter numeric values.');
  // return;
  // }
  // newGaugeValues.add(value);
  // }
  //
  // setState(() {
  // _gaugeValues = newGaugeValues;
  // });
  // }
  //
  //
  //
  //
  // void _handleButtonPress() async {
  //   stdout.write('Enter comma-separated values for gauges: ');
  //
  //   // Delay reading the input by a short duration to allow the UI to remain responsive
  //
  //
  //
  //   String data="50,75";
  //   _updateGaugeValues(data);
  //   setState(() {
  //
  //   });
  // }
  //






















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
      // appBar: AppBar(
      //
      //   backgroundColor:Color(0xffFFBF00),
      //
      //   title: Text("TVS Star City Demo"),
      // ),
      body: Center(
          child: Container(
                 height:600,
                 width:1024,


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


                  Container(
                    height:60,
                    width:600,
                    alignment:Alignment.center,

                    decoration:BoxDecoration(
                        color:Colors.white,
                      borderRadius:BorderRadius.only(bottomLeft:Radius.elliptical(400, 400),bottomRight:Radius.elliptical(400, 400)),

                        border:Border.all(
                          color:Colors.black26,//Color(0xff38eeff),
                          width:3,



                        ),
                        boxShadow:[
                          BoxShadow(
                            blurRadius:0,
                            spreadRadius:0,
                            color:Colors.black26,//Color(0xff38eeff),
                          )
                        ]

                    ),


                   child: Padding(
                     padding: const EdgeInsets.only(bottom:0.0),
                     child: Text(
                        _currentTime,
                        style: TextStyle(fontSize: 40,color:Colors.black),


                  ),
                   ),),
                  SizedBox(height:10),
                  SizedBox(
                    height: 120,
                    width: 800,
                    child:Row(
                      mainAxisAlignment:MainAxisAlignment.spaceAround,
                      children: [

                        Padding(
                          padding: const EdgeInsets.only(top:20),
                          child: Container(
                              height:40,
                              width:40,

                              child:left==true?Image.asset('assets/images/colorleftbg.png',fit:BoxFit.fill,):Image.asset('assets/images/left.png',fit:BoxFit.fill,),

                          ),
                        ),


                        Padding(
                          padding: const EdgeInsets.only(left:50.0,top:10),
                          child: Container(
                              height:40,
                              width:40,
                            child:highbeam==true?Image.asset('assets/images/colorhighbeambg.png',fit:BoxFit.fill,):Image.asset('assets/images/high-beam.png',fit:BoxFit.fill,),
                          ),
                        ),


                        Padding(
                          padding: const EdgeInsets.only(left:50.0,top:10),
                          child: Container(
                              height:40,
                              width:40,
                            child:hazard==true?Image.asset('assets/images/colorhazardbg.png',fit:BoxFit.fill,):Image.asset('assets/images/hazard.png',fit:BoxFit.fill,),

                          ),
                        ),


                        Padding(
                          padding: const EdgeInsets.only(left:50,top:10),
                          child: Container(
                              height:40,
                              width:40,
                            child:malfunction==true?Image.asset('assets/images/colormalfunctionbg.png',fit:BoxFit.fill,):Image.asset('assets/images/malfunction.png',fit:BoxFit.fill,),

                          ),
                        ),



                        Padding(
                          padding: const EdgeInsets.only(left:50,top:10),
                          child: Container(
                              height:40,
                              width:40,
                            child:side_stand==true?Image.asset('assets/images/colorside_standbg.png',fit:BoxFit.fill,):Image.asset('assets/images/side_stand.png',fit:BoxFit.fill,),

                          ),
                        ),



                        Padding(
                          padding: const EdgeInsets.only(left:50,top:10),
                          child: Container(
                              height:40,
                              width:40,
                            child:right==true?Image.asset('assets/images/colorrightbg.png',fit:BoxFit.fill,):Image.asset('assets/images/right.png',fit:BoxFit.fill,),
                          ),
                        ),

                      ],


                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left:110.0,top:0.0),
                        child: Center(
                          child: Container(
                            height:300,
                            width:800,
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
                                  enableLoadingAnimation: false, animationDuration: 4500,
                                  //
                                  axes: <RadialAxis>[RadialAxis(
                                       minimum:0,maximum:100,isInversed:false,
                                       startAngle:50,//240,//90
                                       endAngle:-50,//240,//-90
                                       interval:10,
                                       showLabels:false,
                                       showTicks:false,


                                      ranges:<GaugeRange>[

                                        GaugeRange(startValue:0, endValue:40,color:Colors.orange,startWidth:5,endWidth:5,),
                                        GaugeRange(startValue:40, endValue:70,color:Colors.orange,startWidth:5,endWidth:5,),
                                        GaugeRange(startValue:70, endValue:100,color:Colors.orange,startWidth:5,endWidth:5,),


                                      ],

                                      axisLineStyle: AxisLineStyle(thickness: 30,color:Colors.black12),  //Color(0xffEC5800)

                                      pointers: <GaugePointer>[NeedlePointer(value:value, enableAnimation: false,
                                          needleStartWidth: 0,

                                          needleEndWidth: 0, needleColor: Color(0xFFDADADA),
                                          knobStyle: KnobStyle(color: Colors.white, borderColor: Colors.white,//Color(0xFFDADADA

                                              knobRadius: 0.00,
                                              borderWidth: 0.00),
                                          tailStyle: TailStyle(color:Color(0xFFDADADA), width: 0,
                                              length: 0.0),
                                         animationType:AnimationType.ease,

                                      ),
                                        RangePointer(value:update_value(), width:30, enableAnimation:false, color:get_guage_color() )   //Color(0xffFCD12A)                  //0xff0FFF50 for eco mode
                                      ],





                              annotations:<GaugeAnnotation>
                                      [





                                GaugeAnnotation(widget:Text("ECO",style:TextStyle(fontSize:30,fontWeight:FontWeight.bold,color:Color(0xffFF7417)),),
                                       angle:-90,
                                       positionFactor:0.4,)

                                       ,

                                GaugeAnnotation(widget:Text("$value",style:TextStyle(fontSize:60,fontWeight:FontWeight.bold,color:Color(0xffFF7417)),),
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
                                          mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                          children: [



                                            Icon(Icons.call,size:40,color:Color(0xff323232)),
                                            Padding(
                                              padding: const EdgeInsets.only(left:55.0),
                                              child: Icon(Icons.message,size:40,color:Color(0xff323232)),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(left:55.0),
                                              child: Icon(Icons.bluetooth,size:40,color:Color(0xff323232)),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(left:55.0),
                                              child: Icon(Icons.network_cell,size:40,color:Color(0xff323232)),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(left:55.0),
                                              child: Icon(Icons.battery_4_bar_rounded,size:40,color:Color(0xff323232)),
                                            )




















                                          ],
                                        ),
                                      ),

                                      Padding(
                                        padding: const EdgeInsets.only(left:50.0,top:60),
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
                                            padding: const EdgeInsets.only(left:0),
                                            child: Container(
                                              height:50,
                                              width:50,
                                              decoration:const BoxDecoration(
                                                image:DecorationImage(image: ExactAssetImage('assets/images/battery3.png'),
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
                        padding: const EdgeInsets.only(left:0.0),
                        child: SizedBox(
                            height:300,


                            child:Row(

                              mainAxisAlignment:MainAxisAlignment.spaceAround,
                              children: [

                                IconButton(onPressed: (){
                                  Navigator.push(context,MaterialPageRoute(builder:(context)=>powermode()));
                                }, icon:Icon(Icons.keyboard_double_arrow_right,size:80,color:Colors.grey,),
                                )


                              ],

                            )

                        ),
                      ),
                    ],
                  ),

                  Container(
                    width: 600,
                    height: 30,
                     alignment:Alignment.center,
                     // Set the background color for the container
                    child: Row(
                      mainAxisAlignment:MainAxisAlignment.spaceAround,
                      children: [




                      ],
                    ),
                  ),

                  SizedBox(
                  height:0,
                ),
                Row(
                  mainAxisAlignment:MainAxisAlignment.center,
                  children: [

                    Padding(
                      padding: const EdgeInsets.only(top:10,bottom:0,left:20),
                      child: Container(
                        width:900,//1175


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

                            Text("Avg speed $value km/h",style:GoogleFonts.roboto(
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


//defining all functions here

Color get_guage_color(){





  if (value <=40) {

    return Colors.green;

  }

  else if (value <= 70) {

    return Colors.blue;

  }

  else if (value <= 100) {
    return Colors.red;

  }

  else
    return Colors.red;





}


