
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_homescreen/variables_func.dart';

class count_provider extends ChangeNotifier{
   int _count=0;
   String _a='1';
   int _count2=1;
   int get count2=>count;
   int get count=>_count ;
   String get a=>_a;

  void setcount()
  {
     _count++ ;
     notifyListeners();
  }



  ///////////////////////////////
   Future<void> loadGaugeValues() async {
     try {


       List<String> lines = rawdata.toString().split('\n');

       List<String> values = [];
       List<String> svalues = [];
       for (String line in lines) {
         //    await Future.delayed(const Duration(milliseconds: 1));


         if (line.isNotEmpty && line.startsWith('*E') && line.endsWith('K#')) {
           rpmD = line.substring(2, 7);
           // print('rpm is $rpmD');
           speedD = line.substring(8, 11);

           // print('speed is $speedD');
           fuelLevelD = line.substring(12, 13);
           //print('fuel level is $fuelLevelD');

           odometerD = line.substring(14, 20);
           //print('odo meter rating is $odometerD');
           headLampD = line.substring(21, 22);
           // print('headlamp status is $headLampD');
           gearD = line.substring(23, 24)??"N";
           // print('gear status is $gearD');
           leftIndicatorD = line.substring(25, 26);
           // print('left indicator status is $leftIndicatorD');
           rightIndicatorD = line.substring(27, 28);
           //print('right indicator status is $rightIndicatorD');
           modeD = line.substring(29, 30);
           // print('mode status is $rightIndicatorD');
           serviceD = line.substring(31, 32);
           // print('serviceD status is $serviceD');
           batteryD = line.substring(32, 34);
           // print('batteryD status is $batteryD');
           assistD = line.substring(34, 35);
           // print('assistD status is $assistD');
           KeyIPD = line.substring(35, 36);
           _a=line.substring(35, 36);

         } else {
           if (line.isNotEmpty) {
            // print('data frame is incorrect');
             line = lines.last;
           } else {
             line = lines.last;
           }

         }




           fuelLevelr=int.tryParse(fuelLevelD) ?? 0;
           if(fuelLevelr>0 && fuelLevelr <=9)
           {
             fuelvalue=fuelLevelr/10 ;
           }
           else{
             fuelvalue=0;
           }
          speedr = speedD;
          odometerr = odometerD;
           gearr=gearD ;
           rpmr=rpmD ;
           serviceDr=serviceD ;
           hazardr=hazardD ;
           leftIndicatorr = leftIndicatorD;
           move=KeyIPD ;

           rightIndicatorr = rightIndicatorD;
           parkingr=parkingD;
           headLampr = headLampD;
           move=KeyIPD;
           modeDr=modeD;
           highbeamr=highbeamD;
           sidestandDr=sidestandD;

           //switch_mode();//this will change the screen according to the mode input
           leftIndicatorr == '1' ? left = true : left = false;
           rightIndicatorr == '1' ? right = true : right = false;
           headLampr == '1' ? headlamp = true : headlamp = false;
           highbeamr=='1' ? highbeam=true : highbeam =false ;
           sidestandDr=='1'? side_stand=true: side_stand=false ;
           hazardr=='1'?  hazard=true:hazard=false ;
           parkingr=='1'? parking_mode=true:parking_mode=false ;





         notifyListeners();


         // });
       }
     } catch (e) {
       print('Error loading gauge values: $e');
     }
   }


   void indicator() {
     if (timer == null) {
       timer = Timer.periodic(Duration(milliseconds: 1000), (_) {

           if (i <= 6) {

             i = i + 1;
           } else {
             timer?.cancel();
           }

           if (j <= 6) {
             indicator_Blinker();

             j = j + 1;
           } else {
             timer?.cancel();
             //print("timer one is stopped");
             Future.delayed(Duration(seconds: 5), () {

             });
           }
         });
        notifyListeners();
     }
   }


}