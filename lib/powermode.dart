//This dart file is for power mode

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_homescreen/regenmode.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_homescreen/main.dart';
import 'package:intl/intl.dart';

class powermode extends StatefulWidget{

  @override

  State<powermode> createState() =>_powermode();



}
class _powermode extends State<powermode>{

  String _currentTime = '';

  @override

  void _updateTime() {
    setState(() {
      // Get the current time and format it as HH:mm:ss
      _currentTime = DateFormat('HH:mm:ss').format(DateTime.now());
    });

    // // it will update the ui every 1 second
    Future.delayed(Duration(seconds: 1), _updateTime);
  }



  @override
  void initState() {
    super.initState();
    _updateTime();




  }
  Widget build(BuildContext context) {

    return Scaffold(



      body:Center(
          child: Container(
            height:600,
            width:1024,


            decoration:BoxDecoration(
              color:  Color(0xffffdbac),//Colors.black,//Color(0Xff323232),//Color(0Xff7FFFD4),
              borderRadius:BorderRadius.only(topLeft:Radius.elliptical(100,100),bottomLeft:Radius.elliptical(100,100),topRight:Radius.elliptical(100, 100),bottomRight:Radius.elliptical(100, 100)),
                border:Border.all(
                  color:Colors.white,//Color(0xffff6600),//Color(0xff38eeff),
                  width:3,



                ),
                boxShadow:[
                  BoxShadow(
                    blurRadius:11,
                    spreadRadius:11,
                    color:Colors.white,//Color(0xffff6600),//Color(0xff38eeff),
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
                    mainAxisAlignment:MainAxisAlignment.spaceAround,
                    children: [




                      Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: IconButton(onPressed:(){

                          Navigator.push(context,MaterialPageRoute(builder:(context)=>MyHomePage()));

                        },icon:Icon(Icons.keyboard_double_arrow_left,size:80,color:Colors.white,),),
                      )
                     ,

                      Padding(
                        padding: const EdgeInsets.only(left:0.0,top:0.0),
                        child: Center(
                          child: Container(
                            height:300,
                            width:800,
                            //here we are doing the box decoration
                            decoration:BoxDecoration(
                                color:Color(0xffeaeaea),//Color(0xffCCCCFF),//Color(0xff38eeff),
                                borderRadius:BorderRadius.only(topLeft:Radius.circular(800),bottomLeft:Radius.circular(800),topRight:Radius.elliptical(100, 100),bottomRight:Radius.elliptical(100, 100)),
                                border:Border.all(
                                  color:Color(0xffff6600),//Color(0xff38eeff),
                                  width:3,



                                ),
                                boxShadow:[
                                  BoxShadow(
                                    blurRadius:3,
                                    spreadRadius:3,
                                    color:Color(0xffff6600),//Color(0xff38eeff),
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
                                      minimum:0,maximum:120,isInversed:false,
                                      startAngle:50,//240,//90
                                      endAngle:-50,//240,//-90
                                      interval:10,
                                      showLabels:false,
                                      showTicks:false,
                                      // useRangeColorForAxis:false,
                                      //
                                      // majorTickStyle: MajorTickStyle(length: 18,thickness: 6,color: Colors.white,),
                                      // minorTickStyle: MinorTickStyle(length: 13,thickness:3,color: Colors.grey),

                                      axisLineStyle: AxisLineStyle(thickness: 30),

                                      pointers: <GaugePointer>[NeedlePointer(value: 120, enableAnimation: false,
                                        needleStartWidth: 0,

                                        needleEndWidth: 0, needleColor: Color(0xFFDADADA),
                                        knobStyle: KnobStyle(color: Colors.white, borderColor: Color(0xFFDADADA),

                                            knobRadius: 0.00,
                                            borderWidth: 0.00),
                                        tailStyle: TailStyle(color:Color(0xFFDADADA), width: 0,
                                            length: 0.0),
                                        animationType:AnimationType.ease,

                                      ),
                                        RangePointer(value:value, width:30, enableAnimation: false, color:get_guage_color() )                     //0xff0FFF50 for eco mode
                                      ],





                                      annotations:<GaugeAnnotation>
                                      [





                                        GaugeAnnotation(widget:Text("Power",style:TextStyle(fontSize:30,fontWeight:FontWeight.bold,color:Color(0xffFF7417)),),
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
                                        child: Text("DTE 100km",style:TextStyle(fontSize:24,fontWeight:FontWeight.bold,color:Colors.black),),
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            width:330,
                                            height:50
                                            ,



                                            child: LinearProgressIndicator(
                                              value: 0.42,

                                              valueColor: AlwaysStoppedAnimation(Color(0xffff6600)),
                                              backgroundColor:Colors.white,
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
                                            child: Text("50%",style:TextStyle(fontSize:25,fontWeight:FontWeight.bold,color:Colors.black),),
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

                                IconButton(onPressed:(){

                                  Navigator.push(context,MaterialPageRoute(builder:(context)=>regenmode()));

                                },icon:Icon(Icons.keyboard_double_arrow_right,size:80,color:Colors.white,),)



                              ],

                            )

                        ),
                      ),
                    ],
                  ),

                  Container(
                    width: 600,
                    height: 30,
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
                        padding: const EdgeInsets.only(top:10,bottom:0,left:60),
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

                              Text("Avg speed ${value} km/h",style:GoogleFonts.roboto(
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


