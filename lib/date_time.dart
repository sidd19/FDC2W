
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

bool time=true;

class date_time extends StatefulWidget{

  @override

  State<date_time> createState() =>_date_time();

}


class _date_time  extends State<date_time>
{



  var time=DateTime.now();


  void _Showtimepicker()
  {
    showTimePicker(context: context, initialTime: TimeOfDay(hour: 12, minute: 60,));

  }
  @override
  Widget build(BuildContext context) {
     return Scaffold(

      body:Center(
        child:MaterialButton(
          onPressed:(){
            //_Showtimepicker();
          },
          child:Center(
            child: Container(
              height:200,
              width:400,
              color:Colors.blue,
              child:Column(
                  mainAxisAlignment:MainAxisAlignment.spaceAround,
                  crossAxisAlignment:CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment:MainAxisAlignment.spaceAround,
                    children: [
                      Text("${time.hour}",style:TextStyle(fontSize:50,fontWeight:FontWeight.bold,color:Colors.black),),
                      Text(":",style:TextStyle(fontSize:50,fontWeight:FontWeight.bold,color:Colors.black),),
                      Text("${time.minute}",style:TextStyle(fontSize:50,fontWeight:FontWeight.bold,color:Colors.black),),
                      Text(":",style:TextStyle(fontSize:50,fontWeight:FontWeight.bold,color:Colors.black),),
                      Text("${time.second}",style:TextStyle(fontSize:50,fontWeight:FontWeight.bold,color:Colors.black),),
                    ],
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top:20.0,right:50,left:30),


                    child: ElevatedButton(onPressed:(){
                      setState(() {
                        time=DateTime.now();
                      });
                    },child:Text("check time"),),
                  )
                ],
              ),





            ),
          )
        ),
      )


    );


  }

}