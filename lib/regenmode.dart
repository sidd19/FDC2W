//This dart file is for power mode

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cluster_v3/menubar.dart';
import 'package:google_fonts/google_fonts.dart';

class regenmode extends StatefulWidget{

  @override

  State<regenmode> createState() =>_regenmode();



}
class _regenmode extends State<regenmode>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar:AppBar(

        backgroundColor:Color(0XffDFE9F5),

        title: Text("REGEN Mode"),


      ),

      body:Center(
          child: Container(
            height:600,
            width:1200,


            decoration:BoxDecoration(
              color:Color(0xffDFE9F5),//Colors.black,//Color(0Xff323232),//Color(0Xff7FFFD4),
              borderRadius:BorderRadius.only(topLeft:Radius.elliptical(100,100),bottomLeft:Radius.elliptical(100,100),topRight:Radius.elliptical(100, 100),bottomRight:Radius.elliptical(100, 100)),
              border:Border.all(
                color:Colors.white,//Color(0xff38eeff),
                width:3,



              ),
              boxShadow:[
              BoxShadow(
              blurRadius:11,
              spreadRadius:11,
              color:Colors.white,//Color(0xff38eeff),
            )]
            ),
            child: Center(
              child: Column(
                children: [


                  SizedBox(
                    height:50,
                    width:1200,


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
                                  color:Color(0xff90B1DB),//Color(0xff38eeff),
                                  width:3,



                                ),
                                boxShadow:[
                                  BoxShadow(
                                    blurRadius:3,
                                    spreadRadius:3,
                                    color:Color(0xff90B1DB),//Color(0xff38eeff),
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
                                      // useRangeColorForAxis:false,
                                      //
                                      // majorTickStyle: MajorTickStyle(length: 18,thickness: 6,color: Colors.white,),
                                      // minorTickStyle: MinorTickStyle(length: 13,thickness:3,color: Colors.grey),

                                      axisLineStyle: AxisLineStyle(thickness: 30),

                                      pointers: <GaugePointer>[NeedlePointer(value: 120, enableAnimation: true,
                                        needleStartWidth: 0,

                                        needleEndWidth: 0, needleColor: Color(0xFFDADADA),
                                        knobStyle: KnobStyle(color: Colors.white, borderColor: Color(0xFFDADADA),

                                            knobRadius: 0.00,
                                            borderWidth: 0.00),
                                        tailStyle: TailStyle(color:Color(0xFFDADADA), width: 0,
                                            length: 0.0),
                                        animationType:AnimationType.ease,

                                      ),
                                        RangePointer(value: 120, width: 30, enableAnimation: false, color: Color(0xff00ff00	))                     //0xff0FFF50 for eco mode
                                      ],





                                      annotations:<GaugeAnnotation>
                                      [





                                        GaugeAnnotation(widget:Text("REGEN",style:TextStyle(fontSize:30,fontWeight:FontWeight.bold,color:Color(0xffFF7417)),),
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

                                              valueColor: AlwaysStoppedAnimation( Color(0xff00ff00)),
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
                        padding: const EdgeInsets.only(left:38.0),
                        child: SizedBox(
                            height:300,

                            child:Row(

                              mainAxisAlignment:MainAxisAlignment.spaceAround,
                              children: [

                               IconButton(onPressed: (){
                                 Navigator.push(context, MaterialPageRoute(builder:(context)=>menubar()));
                               }, icon: Icon(Icons.keyboard_double_arrow_right,size:100,color:Colors.white,),)



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



                        // Expanded(flex:1,
                        //   child: LinearProgressIndicator(
                        //     minHeight:30,
                        //     value: 0.5, // Set the desired progress value
                        //     backgroundColor: Colors.transparent, // Set the indicator's background color
                        //
                        //     valueColor: AlwaysStoppedAnimation<Color>(Colors.blue), // Set the indicator's foreground color
                        //   ),
                        // ),

                        // Expanded(flex:1,child: Text("DTE 40KM",style:TextStyle(fontSize:18,fontWeight:FontWeight.bold),)),
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


