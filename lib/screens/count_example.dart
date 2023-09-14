import 'package:flutter/material.dart' ;
import 'package:flutter/foundation.dart';
import 'package:flutter_homescreen/provider/count_provider.dart';
import 'package:flutter_homescreen/variables_func.dart';
import 'package:provider/provider.dart';
import 'dart:async';



class count_example extends StatefulWidget {
  @override
  State<count_example> createState() => _count_exampleState();

}

class _count_exampleState extends State<count_example> {


  @override
  // Initialize the gauge values
  //this function is used to update the time

  //////////////////////////write end

//this part of code will execute the part of code written inside it at the starting of building of the ui
  //List<String> availablePort = SerialPort.availablePorts;
  @override
  initState() {
    super.initState();
    final countprovider=Provider.of<count_provider>(context,listen:false);
    print("build");
     Timer.periodic(Duration(seconds:1), (timer) {
       countprovider.loadGaugeValues();
     });
  }

//end of init state function

// Dispose:used to cancel the timer

  @override
  void dispose() {
    super.dispose();
  }


  //End of pop function

  @override
  Widget build(BuildContext context) {

    final countprovider=Provider.of<count_provider>(context,listen:false);
    return Scaffold(
      body: Center(
          child: Consumer<count_provider>(builder:(context,value,child){

            return  Container(
            height: 600,
            width: 1024,
            child: Column(
              children: [
                Text(value.count.toString()),
                Text("none"),
                ElevatedButton(onPressed: (){
                  countprovider.setcount();
                }, child:Text("increament"))
              ],
            ),

          ); }),
    ));
  }


}
