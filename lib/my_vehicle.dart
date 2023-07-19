//This dart file is for power mode

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class my_vehicle extends StatefulWidget{

  @override

  State<my_vehicle > createState() =>_my_vehicle ();



}
class _my_vehicle  extends State<my_vehicle >{
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar:AppBar(

        backgroundColor:Color(0Xff7FFFD4),

        title: Text(""),


      ),

      body:Center(
          child:Container(

            height:600,
            width:1200,
            decoration:BoxDecoration(
                gradient:LinearGradient(colors:[
                  Color(0xffB2BEB5),
                  Color(0xffA9A9A9),
                  Color(0xff808080),
                ],

                  begin:Alignment.bottomCenter,
                  end: Alignment.topCenter,


                ),

                borderRadius:BorderRadius.only(topLeft:Radius.circular(100),bottomLeft:Radius.circular(100),topRight:Radius.circular(100),bottomRight:Radius.circular(100)),
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
              children: [

                Padding(
                  padding: const EdgeInsets.only(left:90,bottom:360.0),
                  child: IconButton(onPressed:(){}, icon:Icon(Icons.keyboard_double_arrow_left,size:90,color:Colors.white,),),
                ),

                Padding(
                  padding: const EdgeInsets.only(left:0.0),
                  child: Column(
                    children: [
                      SizedBox(height:80,child:Row(
                        mainAxisAlignment:MainAxisAlignment.start,
                        children: [

                          //IconButton(onPressed:(){}, icon:Icon(Icons.keyboard_double_arrow_left,size:80,color:Colors.white,),),
                          //IconButton(onPressed: (){}, icon:Icon(Icons.keyboard_double_arrow_right,size:80,color:Colors.white))
                        ],
                      ),),
                      SizedBox(
                        width:800,
                        height:80,
                        child: ElevatedButton(onPressed:(){


                        }, child:Row(
                          mainAxisAlignment:MainAxisAlignment.start,
                          children: [
                            //Icon(Icons.home_outlined,color:Colors.white,size:50,),
                            Padding(
                              padding: const EdgeInsets.only(left:8.0),
                              child: Text("Service",textAlign:TextAlign.start,style:TextStyle(color:Colors.white,fontSize:40,fontWeight:FontWeight.bold),),
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


                        }, child:Row(
                          mainAxisAlignment:MainAxisAlignment.start,
                          children: [

                            Text("Error",textAlign:TextAlign.start,style:TextStyle(color:Colors.white,fontSize:40,fontWeight:FontWeight.bold),),
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
                            Text("Digital Documents",textAlign:TextAlign.start,style:TextStyle(color:Colors.white,fontSize:40,fontWeight:FontWeight.bold),),
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
                            Text("Trip Meter",textAlign:TextAlign.start,style:TextStyle(color:Colors.white,fontSize:40,fontWeight:FontWeight.bold),),
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
                            Text("Privacy",textAlign:TextAlign.start,style:TextStyle(color:Colors.white,fontSize:40,fontWeight:FontWeight.bold),),
                          ],
                        ),style:ElevatedButton.styleFrom(backgroundColor:Colors.black,side:BorderSide(color:Colors.white,width:2)),),
                      ),





                    ],
                  ),
                ),
              ],
            ),
          )
      ),


    );

  }
}


