import 'package:flutter/material.dart';
import 'package:flutter_homescreen/main.dart';
import 'dart:async';


class splash_screen2 extends StatefulWidget {
  @override
  State<splash_screen2> createState() => _splash_screen2();
}

class _splash_screen2 extends State<splash_screen2> {
  bool _visible = false; // Flag to control the visibility of the image

  @override
  void initState() {
    super.initState();
    // Set _visible to true after 1 second to trigger the fade-in animation
    Timer(Duration(seconds: 1), () {
      setState(() {
        _visible = true;
      });
    });
    // Navigate to the next screen after 5 seconds
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MyHomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            height:600,
            width:1024,
            color:Colors.white,
            child: Column(


              children: [


                AnimatedOpacity(
                  opacity: _visible ? 1.0 : 0.0, // Set the opacity based on the _visible flag
                  duration: Duration(milliseconds: 2000), // Duration of the fade animation
                  child:Column(children: [

                    _visible
                        ? Image.asset(
                      "assets/images/tvslogo.jpg",
                      height: 500,
                      width: 1024,
                    )
                        : Container(color:Colors.white,),
                  ], // Display an empty container if not visible
                  ),),
                Text("READY TO RIDE",style:TextStyle(fontSize:40,fontWeight:FontWeight.bold),),
                CircularProgressIndicator(color:Colors.red,)],
            )
        ),
      ),
    );
  }
}
