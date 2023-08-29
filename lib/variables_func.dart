import 'package:flutter/material.dart';
import 'dart:async';
import 'package:libserialport/libserialport.dart';
import 'dart:typed_data';
double value=0;
//variables for signals
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










Color get_guage_color(){





  if (value <=40) {

    return Colors.green;

  }

  else if (value <= 70) {

    return Colors.blue;

  }

  else if (value <= 100) {
    return Colors.red;

  }

  else
    return Colors.red;





}







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
Uint8List _stringToUinst8List(String data) {

  List<int> codeUnits = data.codeUnits;

  Uint8List uint8list = Uint8List.fromList(codeUnits);

  return uint8list;

}

/////////////////////////////////
void  serial() {
  List<String> availablePort = SerialPort.availablePorts;

  print('Available Port: $availablePort');


  SerialPort port = SerialPort('/dev/ttyUSB1');

  port.openReadWrite();


  try {

    print('Serial port opened: $port');



    //port.write(_stringToUinst8List('*E12345 123 1 123456 1 1 1 1 1 1 111K#'));



    //Read from port



    SerialPortReader reader = SerialPortReader(port);

    Stream<String> upcomingData = reader.stream.map((data) {

      return String.fromCharCodes(data);

    });


    upcomingData.listen((data) {

      //added logic


      String firstChar = data[0];
      String lastChar = data[data.length - 1];

      if (firstChar == '*' && lastChar == '#') {
        // The first and last values meet the conditions, process the data
        print('Read Data: $data');
        if (data.length == 10) {
          // Extract the speed (first two characters)
          String speedString = data.substring(1, 5);
          rpm = double.tryParse(speedString) ?? 0.0; // Convert to double

          // Extract the rpm (next six characters)
          String rpmString = data.substring(8, 10);
          speed = double.tryParse(rpmString) ?? 0.0; // Convert to double
        } else {
          // If the input string length is not as expected, set default values
          speed = 0.0;
          rpm = 0.0;
        }

        print('Speed: $speed');
        print('RPM: $rpm');
      }

      else {
        print('Invalid data format: $data');

      }


      //added logic end

      print('Read Data: $data');

    });

  } on SerialPortError catch (err, _) {

    print(SerialPort.lastError);

    port.close();

  }





}









