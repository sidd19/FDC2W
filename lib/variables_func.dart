/*importing all the required variables*/

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:libserialport/libserialport.dart';
import 'dart:typed_data';

//variables for signals

double value=0;
double speed=0;
double rpm=0;
bool left=true;
bool right=true;
bool hazard=true;
bool malfunction=true;
bool highbeam=true;
bool side_stand=true;
bool parking_mode=true;
bool parking_brake=true;
double battery=76.6;
bool show_pointer=false;
Timer? timer;
Timer?timer1;
final String songTitle = "Kar Har Maidaan Fateh";
final String Movie = "Sanju";
double playbackProgress = 1.0;
//List <double> values=[14,12,13,14,15,16,12,13,14,15,16,18,20,24,26,34,46,14,12,30,32];
int i=0;
int j=0;

//These variables will store data of the frame
/*Variables that ends with character D are directly take substring data that broke down from the lines
Variables that ends with r character are actual variable in which i am passing to the ui variables
 */

String fuelLevelD = 'N/A';
String fuelLevelr='0';
String rpmD = 'N/A';
String rpmr='0';
String speedD = 'N/A';
String speedr='0';
String odometerD = 'N/A';
String odometerr='0';
String headLampD = 'N/A';
String headLampr='0';
String gearD = 'N/A';
String gearr='0';
String leftIndicatorD = 'N/A';
String leftIndicatorr='0';
String rightIndicatorD = 'N/A';
String rightIndicatorr='0';
String modeD = 'N/A';
String modeDr = 'N/A';
String serviceD = 'N/A';
String serviceDr = 'N/A';
String batteryD = 'N/A';
String batteryDr = 'N/A';
String assistD = 'N/A';
String assistDr = 'N/A';
String KeyIPD = 'N/A';
String KeyIPDr = 'N/A';


/*additional variables*/
String my_data = '';

List<String> gaugeValues = [];
List<String> speedValues = [];
double b = 0;
String c = '';
String avgspeed = '';
String avgspeeddata = '';



/*The get gauge color function will return the color
* of the gauge according to the incoming value*/
Color get_guage_color(){

  if (value <=40)
  {

    return Colors.green;

  }

  else if (value <= 70)
  {

    return Colors.blue;

  }

  else if (value <= 100)
  {

    return Colors.red;

  }

  else
    return Colors.red;

}

/* battery color is the function which returns the color and according to the battery percentage status
color of the battery icon will change*/

Color battery_color(){

  if (battery <=40) {

    return Colors.red;

  }

  else if (battery <= 70) {

    return Colors.yellow;

  }

  else if (battery <= 100) {
    return Colors.green;

  }

  else
    return Colors.black;

}












