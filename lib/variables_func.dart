/*importing all the required variables*/

import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io' ;
import 'dart:typed_data';
import 'package:path_provider/path_provider.dart';
import 'package:thread/thread.dart';
import 'package:http/http.dart' as http;

//variables for signals
int switch_screen_lock=0;
int last_mode=0;
String httpdata='';
String frame='';
double value=0;
double speed=0;
double rpm=0;
bool left=true;
bool right=true;
bool hazard=true;
bool malfunction=true;
bool headlamp=true;
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
String move='1';//it is used to switch between the pages

//These variables will store data of the frame
/*Variables that ends with character D are directly take substring data that broke down from the lines
Variables that ends with r character are actual variable in which i am passing to the ui variables
 */
double fuelvalue=0;
String fuelLevelD = '0';
int fuelLevelr=0;
String rpmD = '0';
String rpmr='0';
String speedD = '0';
String speedr='0';
String odometerD = '0';
String odometerr='0';
String headLampD = '0';
String headLampr='0';
String highbeamD='0';
String highbeamr='0';
String gearD = 'N';
String gearr='N';
String leftIndicatorD = '0';
String leftIndicatorr='0';
String rightIndicatorD = '0';
String rightIndicatorr='0';
String modeD = '0';
String modeDr = '0';
String serviceD = '0';
String serviceDr = '0';
String batteryD = '0';
String batteryDr = '0';
String assistD = '0';
String assistDr = '0';
String KeyIPD = '0';
String KeyIPDr = '0';
String sidestandD='0';
String sidestandDr='0';
String hazardD= '0';
String hazardr= '0';
String parkingD='0';
String parkingr='0';


int limitspeed=140;

/*additional variables*/
String my_data = '';

List<String> gaugeValues = [];
List<String> speedValues = [];
double b = 0;
String c = '';
String avgspeed = '';
String avgspeeddata = '';
int currentScreenIndex=1;
int page=1 ;


String rawdata='';



/*The get gauge color function will return the color
* of the gauge according to the incoming value*/
Color get_guage_color(){

  if (double.tryParse(speedr)!<=40 )
  {

    return Colors.green;

  }

  else if (double.tryParse(speedr)!<=80)
  {

    return Colors.blue;

  }

  else if (double.tryParse(speedr)!<=140)
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






/*functions to blink the indicators*/

void indicator_Blinker()
{
  left = !left;
  right = !right;
  hazard = !hazard;
  malfunction = !malfunction;
  highbeam = !highbeam;
  side_stand = !side_stand;
  parking_mode = !parking_mode;
  parking_brake = !parking_brake;
  headlamp=!headlamp;
}
/*
int sudip=0;
final thread = Thread((events) {
  events.on('data', (String data) async {
    while(true) {
      await Future.delayed(const Duration(seconds: 1));
      sudip=sudip+1;
      events.emit('sudip', '<Computed s> $sudip');
      events.emit('result', '<Computed> $data');
    }
  });
});
*/




final thread = Thread((events) {
  events.on('data', (String data) async {
    while(true) {
      await Future.delayed(const Duration(milliseconds: 100));
      httpdata = await http.read(Uri.http('127.0.0.1:2001', ''));

      events.emit('realtime', '$httpdata');
    }
  });
});


void mythreadfunc()async{
  thread.on('realtime', (String data) => rawdata=data);

  thread.emit('data', 'Hello world!');
  thread.emit('data', 'Wow!');

  print(await thread.compute(() => 'Hello world!')  );
}



