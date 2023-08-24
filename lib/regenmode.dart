

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_homescreen/menubar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_homescreen/powermode.dart';
import 'main.dart';
import 'package:intl/intl.dart';
import 'package:flutter_homescreen/variables_func.dart';

class regenmode extends StatefulWidget{

  @override

  State<regenmode> createState() =>_regenmode();



}
class _regenmode extends State<regenmode>{

  String _currentTime = '';
  String _date='';

  @override

  String _updateTime() {
    setState(() {
      // Get the current time and format it as HH:mm:ss
      //_date=DateFormat('E d MMMM').format(DateTime.now());
      _currentTime = DateFormat('HH:mm:ss').format(DateTime.now());
    });

    // it will update the ui every 1 second
    Future.delayed(Duration(seconds: 1), _updateTime);
    return _currentTime;
  }


  String _updateDate() {
    setState(() {
      // Get the current time and format it as HH:mm:ss
      _date=DateFormat('E d MMMM').format(DateTime.now());
      _currentTime = DateFormat('HH:mm:ss').format(DateTime.now());
    });

    // it will update the ui every 1 second
    Future.delayed(Duration(hours: 24), _updateTime);
    return _date;
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
                borderRadius:BorderRadius.only(topLeft:Radius.elliptical(0,0),bottomLeft:Radius.elliptical(0,0),topRight:Radius.elliptical(0, 0),bottomRight:Radius.elliptical(0, 0)),
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

                  Row(
                    mainAxisAlignment:MainAxisAlignment.spaceAround,
                    children: [
                      left==true?Image.asset('assets/images/left_green.png',fit:BoxFit.fill,):Image.asset('assets/images/left.png',fit:BoxFit.cover,),




                      Container(
                        height:70,
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
                          child: Column(

                            children: [
                              Text(_updateDate(),style:TextStyle(fontSize:20,fontWeight:FontWeight.bold,color:Colors.black),),
                              Text(
                                _updateTime(),
                                style: TextStyle(fontSize: 20,color:Colors.black,fontWeight:FontWeight.bold),


                              ),
                            ],
                          ),
                        ),),

                      right==true?Image.asset('assets/images/right_green.png',fit:BoxFit.fill,):Image.asset('assets/images/right.png',fit:BoxFit.cover,),
                    ],
                  ),
                  SizedBox(height:0),
                  SizedBox(
                    height: 50,
                    width: 800,
                    child:Row(
                      mainAxisAlignment:MainAxisAlignment.spaceAround,
                      children: [

                        Padding(
                          padding: const EdgeInsets.only(top:20),
                          child: Container(
                            height:40,
                            width:40,
                            child:parking_mode==true?Image.asset('assets/images/parkingcolor.png',fit:BoxFit.fill,):Image.asset('assets/images/parking.png',fit:BoxFit.fill,),
                          ),
                        ),


                        Padding(
                          padding: const EdgeInsets.only(left:50.0,top:10),
                          child: Container(
                            height:40,
                            width:40,
                            child:highbeam==true?Image.asset('assets/images/high-beam_blue.png',fit:BoxFit.fill,):Image.asset('assets/images/high-beam.png',fit:BoxFit.fill,),
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
                            child:malfunction==true?Image.asset('assets/images/low-beam_green.png',fit:BoxFit.fill,):Image.asset('assets/images/low-beam.png',fit:BoxFit.fill,),
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
                            child:parking_brake==true?Image.asset('assets/images/parkingBrakecolor.png',fit:BoxFit.fill,):Image.asset('assets/images/parkingBrake.png',fit:BoxFit.fill,),

                          ),
                        ),



                      ],


                    ),
                  ),
                  Row(

                    children: [




                      Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: InkWell(onTap:(){ Navigator.push(context,MaterialPageRoute(builder:(context)=>powermode()));},
                          child: SizedBox(
                            height:300,
                            child: IconButton(onPressed:(){

                              Navigator.push(context,MaterialPageRoute(builder:(context)=>powermode()));

                            },icon:Icon(Icons.keyboard_double_arrow_left,size:80,color:Colors.white,),),
                          ),
                        ),
                      )
                      ,

                      Padding(
                        padding: const EdgeInsets.only(left:10.0,top:20.0),
                        child: Center(
                          child: Container(
                            height:350,
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

                                      ranges:<GaugeRange>[

                                        GaugeRange(startValue:0, endValue:40,color:Colors.orange,startWidth:5,endWidth:5,),
                                        GaugeRange(startValue:40, endValue:70,color:Colors.orange,startWidth:5,endWidth:5,),
                                        GaugeRange(startValue:70, endValue:100,color:Colors.orange,startWidth:5,endWidth:5,),
                                        GaugeRange(startValue:100, endValue:120,color:Colors.orange,startWidth:5,endWidth:5,),


                                      ],

                                      axisLineStyle: AxisLineStyle(thickness: 40),

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
                                        RangePointer(value:value, width:35, color:get_guage_color() ,pointerOffset:5,) ,
                                        MarkerPointer(value:value,markerOffset:3,markerWidth:5,markerHeight:35,color:Colors.white,borderWidth:0,)//Color(0xffFCD12A)get_guage_color()
                                      ],





                                      annotations:<GaugeAnnotation>
                                      [





                                        GaugeAnnotation(widget:Text("Regen",style:TextStyle(fontSize:30,fontWeight:FontWeight.bold,color:Color(0xffFF7417)),),
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
                                  padding: const EdgeInsets.only(top:0,bottom:0),//change
                                  child: Column(
                                    mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:CrossAxisAlignment.start,
                                    children: [

                                      Row(
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
                                            child: Icon(Icons.battery_charging_full_sharp,size:40,color:battery_color()),
                                          ),


                                        ],
                                      ),



                                      Container(height:204,width:420, color:Color(0xffeaeaea),

                                        child:Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(top:20.0),
                                              child: Container(
                                                width: 100,
                                                height: 100,
                                                color:Color(0xffeaeaea),
                                                child: Icon(
                                                  Icons.music_note,
                                                  size: 100,
                                                  color: Colors.blue,
                                                ),
                                              ),
                                            ),

                                            Text(
                                              songTitle,
                                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              Movie,
                                              style: TextStyle(fontSize: 16, color: Colors.grey),
                                            ),



                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [
                                                IconButton(
                                                  icon: Icon(Icons.skip_previous),
                                                  onPressed: () {
                                                    // Implement skip to previous logic
                                                  },
                                                ),

                                                IconButton(
                                                  icon: Icon(Icons.pause),
                                                  onPressed: () {
                                                    // Implement pause logic
                                                  },
                                                ),
                                                IconButton(
                                                  icon: Icon(Icons.skip_next),
                                                  onPressed: () {
                                                    // Implement skip to next logic
                                                  },
                                                ),
                                              ],
                                            ),


                                          ],

                                        ),),




                                      Row(
                                        children: [
                                          Container(
                                              width:330,
                                              height:100,
                                              child: Column(children: [ Padding(
                                                padding: const EdgeInsets.only(right:160,),
                                                child: Text("DTE 100km",style:TextStyle(fontSize:24,fontWeight:FontWeight.bold,color:Colors.black87),),
                                              ),
                                                Container(
                                                  height:50,
                                                  child: LinearProgressIndicator(
                                                    value: 0.42,

                                                    valueColor: AlwaysStoppedAnimation(Color(0xffFCD12A)),
                                                    backgroundColor: Colors.grey,
                                                  ),
                                                ),

                                              ],)




                                          ),

                                          Padding(
                                            padding: const EdgeInsets.only(left:0,top:20),
                                            child: Container(
                                                height:50,
                                                width:50,
                                                decoration:const BoxDecoration(
                                                  image:DecorationImage(image: ExactAssetImage('assets/images/battery_charge.png'),
                                                    fit:BoxFit.fill,),

                                                )

                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(top:20),
                                            child: Text("50%",style:TextStyle(fontSize:25,fontWeight:FontWeight.bold,color:Colors.black87),),
                                          ),

                                        ],

                                      ),





                                    ],
                                  ),
                                ),



                                // Padding(
                                //   padding: const EdgeInsets.only(bottom:20.0),
                                //   child: Column(
                                //     mainAxisAlignment:MainAxisAlignment.start,
                                //     crossAxisAlignment:CrossAxisAlignment.start,
                                //     children: [
                                //
                                //
                                //       Padding(
                                //         padding: const EdgeInsets.only(bottom:80.0,left:0,top:20),
                                //         child: Row(
                                //           mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                //           children: [
                                //
                                //
                                //
                                //             Icon(Icons.call,size:40,color:Color(0xff323232)),
                                //             Padding(
                                //               padding: const EdgeInsets.only(left:55.0),
                                //               child: Icon(Icons.message,size:40,color:Color(0xff323232)),
                                //             ),
                                //             Padding(
                                //               padding: const EdgeInsets.only(left:55.0),
                                //               child: Icon(Icons.bluetooth,size:40,color:Color(0xff323232)),
                                //             ),
                                //             Padding(
                                //               padding: const EdgeInsets.only(left:55.0),
                                //               child: Icon(Icons.network_cell,size:40,color:Color(0xff323232)),
                                //             ),
                                //             Padding(
                                //               padding: const EdgeInsets.only(left:55.0),
                                //               child: Icon(Icons.battery_charging_full_sharp,size:40,color:battery_color()),
                                //             )
                                //
                                //
                                //           ],
                                //         ),
                                //       ),
                                //
                                //       Padding(
                                //         padding: const EdgeInsets.only(left:50.0,top:80),//we can change the DTE position from here
                                //         child: Text("DTE 100km",style:TextStyle(fontSize:24,fontWeight:FontWeight.bold,color:Colors.black),),
                                //       ),
                                //       Row(
                                //         children: [
                                //           Container(
                                //             width:330,
                                //             height:50
                                //             ,
                                //
                                //
                                //
                                //             child: LinearProgressIndicator(
                                //               value: 0.42,
                                //
                                //               valueColor: AlwaysStoppedAnimation(Color(0xffff6600)),
                                //               backgroundColor:Colors.white,
                                //             ),
                                //           ),
                                //
                                //           Padding(
                                //             padding: const EdgeInsets.only(left:0),
                                //             child: Container(
                                //                 height:50,
                                //                 width:50,
                                //                 decoration:const BoxDecoration(
                                //                   image:DecorationImage(image: ExactAssetImage('assets/images/battery_charge.png'),
                                //                     fit:BoxFit.fill,),
                                //
                                //                 )
                                //
                                //             ),
                                //           ),
                                //           Padding(
                                //             padding: const EdgeInsets.all(5.0),
                                //             child: Text("50%",style:TextStyle(fontSize:25,fontWeight:FontWeight.bold,color:Colors.black),),
                                //           ),
                                //
                                //         ],
                                //
                                //       ),
                                //
                                //
                                //
                                //
                                //
                                //     ],
                                //   ),
                                // ),



                              ],
                            ),
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left:0.0),
                        child: InkWell(onTap:(){ Navigator.push(context,MaterialPageRoute(builder:(context)=>menubar()));},
                          child: SizedBox(
                              height:300,

                              child:Row(

                                mainAxisAlignment:MainAxisAlignment.end,
                                children: [

                                  IconButton(onPressed:(){

                                    Navigator.push(context,MaterialPageRoute(builder:(context)=>menubar()));

                                  },icon:Icon(Icons.keyboard_double_arrow_right,size:80,color:Colors.white,),)



                                ],

                              )

                          ),
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
                        padding: const EdgeInsets.only(top:0,bottom:0,left:20),
                        child: Container(
                          width:900,//1175
                          height:40,


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
                                fontSize:20,
                                fontWeight:FontWeight.bold,
                                color:Colors.black,
                              ),

                              ),




                              Text("ODO $rpm km",style:GoogleFonts.roboto(
                                fontSize:20,
                                fontWeight:FontWeight.bold,
                                color:Colors.black,
                              ),),



                              Text("Trip 293.8km",style:GoogleFonts.roboto(
                                fontSize:20,
                                fontWeight:FontWeight.bold,
                                color:Colors.black,
                              ),),


                              Text("TPMS",style:GoogleFonts.roboto(
                                fontSize:20,
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


