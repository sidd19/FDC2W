//This dart file is for power mode

import 'package:flutter_homescreen/menubar.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_homescreen/date_time.dart';
import 'package:flutter_homescreen/menubar.dart';
import 'package:flutter_homescreen/parkingmode.dart';
import 'package:flutter_homescreen/sound.dart';


class general_settings extends StatefulWidget{

  @override

  State<general_settings > createState() =>_general_settings ();



}
class _general_settings  extends State<general_settings >{
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // appBar:AppBar(
      //
      //   backgroundColor:Color(0Xff7FFFD4),
      //
      //   title: Text(""),
      //
      //
      // ),

      body:Center(
          child:Container(

            height:600,
            width:1024,
            decoration:BoxDecoration(
                gradient:LinearGradient(colors:[
                  Color(0xffB2BEB5),
                  Color(0xffA9A9A9),
                  Color(0xff808080),
                ],

                  begin:Alignment.bottomCenter,
                  end: Alignment.topCenter,


                ),

                borderRadius:BorderRadius.only(topLeft:Radius.circular(0),bottomLeft:Radius.circular(0),topRight:Radius.circular(0),bottomRight:Radius.circular(0)),
                border:Border.all(

                  //color:Color(0xffF0FFFF),
                  width:2,),

                boxShadow:[
                  BoxShadow(
                    blurRadius:11,
                    spreadRadius:11,
                    color:Colors.black26,
                  )
                ]
            ),
            child:Row(
              mainAxisAlignment:MainAxisAlignment.spaceAround,
              children: [

                InkWell(onTap:(){Navigator.push(context, MaterialPageRoute(builder:(context)=>menubar()));},
                  child: SizedBox(
                    height:400,
                    child: IconButton(onPressed:(){

                      Navigator.push(context, MaterialPageRoute(builder:(context)=>menubar()));
                    }, icon:Icon(Icons.keyboard_double_arrow_left,size:80,color:Colors.white,),),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left:0.0),
                  child: Column(
                    children: [
                      SizedBox(height:80,child:Row(
                        mainAxisAlignment:MainAxisAlignment.start,
                        children: [


                        ],
                      ),),
                      SizedBox(
                        width:800,
                        height:80,
                        child: ElevatedButton(onPressed:(){


                        }, child:Row(
                          mainAxisAlignment:MainAxisAlignment.start,
                          children: [
                            Icon(Icons.home_outlined,color:Colors.white,size:50,),
                            Padding(
                              padding: const EdgeInsets.only(left:8.0),
                              child: Text("General Settings",textAlign:TextAlign.start,style:TextStyle(color:Colors.white,fontSize:40,fontWeight:FontWeight.bold),),
                            ),
                          ],
                        ),style:ElevatedButton.styleFrom(backgroundColor:Colors.black,side:BorderSide(color:Colors.white,width:2),enableFeedback:true,),),
                      )
                      ,

                      SizedBox(
                        height:10,
                      ),




                      SizedBox(
                        width:800,
                        height:80,
                        child: ElevatedButton(onPressed:(){


                          //Navigator.push(context,MaterialPageRoute(builder:(context)=>general_settings()));


                        }, child:Row(
                          mainAxisAlignment:MainAxisAlignment.start,
                          children: [

                            Text("Date",textAlign:TextAlign.start,style:TextStyle(color:Colors.white,fontSize:40,fontWeight:FontWeight.bold),),
                          ],
                        ),style:ElevatedButton.styleFrom(backgroundColor:Colors.black,side:BorderSide(color:Colors.white,width:2)),),
                      ),

                      SizedBox(
                        height:10,
                      ),


                      SizedBox(
                        width:800,
                        height:80,
                        child: ElevatedButton(onPressed:(){


                        }, child:Row(
                          mainAxisAlignment:MainAxisAlignment.start,
                          children: [
                            Text("Time",textAlign:TextAlign.start,style:TextStyle(color:Colors.white,fontSize:40,fontWeight:FontWeight.bold),),
                          ],
                        ),style:ElevatedButton.styleFrom(backgroundColor:Colors.black,side:BorderSide(color:Colors.white,width:2),),),
                      ),

                      SizedBox(
                        height:10,
                      ),




                      SizedBox(
                        width:800,
                        height:80,
                        child: ElevatedButton(onPressed:(){


                        }, child:Row(
                          mainAxisAlignment:MainAxisAlignment.start,
                          children: [
                            Text("Display Setttings",textAlign:TextAlign.start,style:TextStyle(color:Colors.white,fontSize:40,fontWeight:FontWeight.bold),),
                          ],
                        ),style:ElevatedButton.styleFrom(backgroundColor:Colors.black,side:BorderSide(color:Colors.white,width:2)),),
                      ),

                      SizedBox(
                        height:10,
                      ),


                      SizedBox(
                        width:800,
                        height:80,
                        child: ElevatedButton(onPressed:(){


                          Navigator.push(context,MaterialPageRoute(builder: (context)=>sound()));





                        }, child:Row(
                          mainAxisAlignment:MainAxisAlignment.start,
                          children: [
                            Text("Sound",textAlign:TextAlign.start,style:TextStyle(color:Colors.white,fontSize:40,fontWeight:FontWeight.bold),),
                          ],
                        ),style:ElevatedButton.styleFrom(backgroundColor:Colors.black,side:BorderSide(color:Colors.white,width:2)),),
                      ),





                    ],
                  ),
                ),



                Padding(
                  padding: const EdgeInsets.only(left:0,bottom:10.0),
                  child: InkWell(onTap:(){Navigator.push(context, MaterialPageRoute(builder:(context)=>parkingmode()));},
                    child: SizedBox(
                      height:400,
                      child: IconButton(onPressed:(){

                        Navigator.push(context, MaterialPageRoute(builder:(context)=>parkingmode()));
                      }, icon:Icon(Icons.keyboard_double_arrow_right,size:80,color:Colors.white,),),
                    ),
                  ),
                ),
              ],
            ),
          )
      ),



    );

  }
}

