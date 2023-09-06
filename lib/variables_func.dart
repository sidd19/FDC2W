/*importing all the required variables*/

import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io' ;
import 'dart:typed_data';
import 'package:path_provider/path_provider.dart';

//variables for signals
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

String fuelLevelD = '0';
String fuelLevelr='0';
String rpmD = '0';
String rpmr='0';
String speedD = '0';
String speedr='0';
String odometerD = '0';
String odometerr='0';
String headLampD = '0';
String headLampr='0';
String gearD = '0';
String gearr='0';
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

//counter storage clss load the file in the applcation and read function inside it is used tro read the data from the file
class CounterStorage {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('textnotes/gaugedata.txt'); // Corrected the path
  }

  Future<String> readCounter() async {
    try {
      final fileContents = await _localFile;



      return  await fileContents.readAsString();

    } catch (e) {
      // Provide more specific error handling or logging.
      print('Error reading the counter: $e');
      return '0';
    }
  }

  Future<File> writeCounter(int counter) async {
    final file = await _localFile;
    return file.writeAsString('$counter');
  }
}

//end of initialization of thE Class


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
}










