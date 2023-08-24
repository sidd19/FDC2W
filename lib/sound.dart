//This dart file is for power mode

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_homescreen/main.dart';

class sound extends StatefulWidget{

  @override

  State<sound > createState() =>_sound ();



}
class _sound  extends State<sound >{
  final String songTitle = "Kar Har Maidaan Fateh";
  final String Movie = "Sanju";


  double playbackProgress = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body: Center(
        child: Container(

             height:600,
             width:1024,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Song artwork or visual representation
              Row(
                mainAxisAlignment:MainAxisAlignment.spaceAround,
                children: [

                  IconButton(onPressed: (){
                    Navigator.pop(context);
                  }, icon:Icon(Icons.keyboard_double_arrow_left,size:80,color:Colors.grey,),
                  ),

                  Container(
                    width: 200,
                    height: 200,
                    color: Colors.grey,
                    child: Icon(
                      Icons.music_note,
                      size: 100,
                      color: Colors.white,
                    ),
                  ),

                  IconButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder:(context)=>MyHomePage()) );
                  }, icon:Icon(Icons.keyboard_double_arrow_right,size:80,color:Colors.grey,),
                  ),

                ],
              ),
              SizedBox(height: 20),
              // Song title and artist name
              Text(
                songTitle,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                Movie,
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              SizedBox(height: 30),
              // Playback progress indicator
              Slider(
                value: playbackProgress,
                onChanged: (value) {
                  setState(() {
                    playbackProgress = value;
                  });
                },
              ),
              // Playback control buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(Icons.skip_previous),
                    onPressed: () {
                      // Implement skip to previous logic
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.play_arrow),
                    onPressed: () {
                      // Implement play logic
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
          ),
        ),
      ),
    );
  }
}





