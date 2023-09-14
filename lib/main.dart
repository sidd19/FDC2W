//importing all the required package
import 'dart:io'; //for input /output file operations
import 'dart:async'; //for asyncronous or timer related functions
import 'package:flutter/material.dart'; //all the ui related widgets
import 'package:flutter_homescreen/provider/count_provider.dart';
import 'package:flutter_homescreen/screens/count_example.dart';
//user defined files
import 'package:flutter_homescreen/variables_func.dart';
import 'package:flutter_homescreen/splashscreen.dart';
import 'package:flutter_homescreen/regenmode.dart';
import 'package:flutter_homescreen/parkingmode.dart';
import 'package:flutter_homescreen/menubar.dart' ;


import 'package:http/http.dart' as http; //server package
import 'package:thread/thread.dart';
//end of user defined files

// external added package files


import 'dart:typed_data';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import 'package:provider/provider.dart';
import 'package:flutter_homescreen/powermode.dart';

//end of external added package files


//main function
void main() {
  runApp(MyApp());
}

////end of Main function

class MyApp extends StatelessWidget {
  
  @override
  
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create:(_)=>count_provider())],
    child:   MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,

      //Setting the pages routes
      routes: {
        '/': (context) =>  splash_screen(), //MyHomePage(),
        '/first':(context)=>MyHomePage(),
         '/second': (context) => powermode(),
         '/third': (context) => regenmode(),
         '/fourth': (context) => parkingmode(),
        '/fifth': (context) => menubar(),
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    ),);

  }
}





class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();

}

class _MyHomePageState extends State<MyHomePage> {


//indicator function:-this is used to blink the indicator 6 times after an intervel of 1 seconds


//updare_value:This function is used to update the value of the gauge by taking input from the list
  double update_value() {
    if (timer1 == null) {
      timer1 = Timer.periodic(Duration(milliseconds:50), (_) {
        setState(() {
          /*The choose screen function will switch the screen to left or right
           according to the input frame keyip it will manage the current state and store the index of the screen*/
           choose_screen();

         /*This will brake the frames and split the frame in to substring to pass the value to all variable*/
          //loadGaugeValues();
        });
      });
    }
    return value;
  }
//end of update_value function

  //function to read data from a file that is stored in assets

  //////////function end

  //write data in to gauge

  //////////////////////////write end

//this part of code will execute the part of code written inside it at the starting of building of the ui
  //List<String> availablePort = SerialPort.availablePorts;
  @override
   initState()   {
    super.initState();

   // thread.start();
    mythreadfunc();
    final countprovider=Provider.of<count_provider>(context,listen:false);
    print("build");
    countprovider.indicator();
    Future.delayed(Duration(seconds: 5), () {

    });
    print("indicator function complete");
    Timer.periodic(Duration(milliseconds:100), (timer) {
      countprovider.loadGaugeValues();
    });

   // mythreadfunc();commented now
   // indicator(); commented now
    //update_value();
  }

//end of init state function

// Dispose:used to cancel the timer

  @override
  void dispose() {
    timer?.cancel();
    timer1?.cancel();

    super.dispose();
  }



  //End of pop function

  @override
  Widget build(BuildContext context) {
    final countprovider=Provider.of<count_provider>(context,listen:false);

    return Scaffold(
      body: Consumer<count_provider>(builder:(context, datafile, child) {

        return Center(
            child: Container(
              height: 600,
              width: 1024,
              decoration: BoxDecoration(
                  color: Color(0xffFFFE0), //Color(0xffF8F8F8)

                  borderRadius: BorderRadius.only(
                      topLeft: Radius.elliptical(0, 0),
                      bottomLeft: Radius.elliptical(0, 0),
                      topRight: Radius.elliptical(0, 0),
                      bottomRight: Radius.elliptical(0, 0)),
                  border: Border.all(
                    color: Colors.black26, //Color(0xff38eeff),
                    width: 3,
                  ),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 11,
                      spreadRadius: 11,
                      color: Colors.white, //Color(0xff38eeff),
                    )
                  ]),
              child: Center(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        left == true
                            ? Image.asset(
                          'assets/images/left_green.png',
                          fit: BoxFit.fill,
                        )
                            : Image.asset(
                          'assets/images/left.png',
                          fit: BoxFit.cover,
                        ),
                        Container(
                          height: 70,
                          width: 600,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.elliptical(400, 400),
                                  bottomRight: Radius.elliptical(400, 400)),
                              border: Border.all(
                                color: Colors.black26, //Color(0xff38eeff),
                                width: 3,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 0,
                                  spreadRadius: 0,
                                  color: Colors.black26, //Color(0xff38eeff),
                                )
                              ]),
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 0.0),
                            child: Column(
                              children: [
                                Text(

                                DateFormat('E d MMMM').format(DateTime.now()),
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                                Text(
                                  DateFormat('HH:mm:ss').format(DateTime.now()),

                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                        right == true
                            ? Image.asset(
                          'assets/images/right_green.png',
                          fit: BoxFit.fill,
                        )
                            : Image.asset(
                          'assets/images/right.png',
                          fit: BoxFit.fill,
                        ),
                      ],
                    ),
                    SizedBox(height: 0),
                    SizedBox(
                      height: 50,
                      width: 800,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Container(
                              height: 50,  //actual size was 40 height width for all indicators
                              width: 50,
                              child: parking_mode == true
                                  ? Image.asset(
                                'assets/images/parkingcolor.png',
                                fit: BoxFit.cover,
                              )
                                  : Image.asset(
                                'assets/images/parking.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 50.0, top: 10),
                            child: Container(
                              height: 50,
                              width: 50,
                              child: highbeam == true
                                  ? Image.asset(
                                'assets/images/high-beam_blue.png',
                                fit: BoxFit.cover,
                              )
                                  : Image.asset(
                                'assets/images/high-beam.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 50.0, top: 10),
                            child: Container(
                              height: 50,
                              width: 50,
                              child: hazard == true
                                  ? Image.asset(
                                'assets/images/colorhazardbg.png',
                                fit: BoxFit.cover,
                              )
                                  : Image.asset(
                                'assets/images/hazard.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 50, top: 10),
                            child: Container(
                              height: 50,
                              width: 50,
                              child: headlamp == true
                                  ? Image.asset(
                                'assets/images/low-beam_green.png',
                                fit: BoxFit.cover,
                              )
                                  : Image.asset(
                                'assets/images/low-beam.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 50, top: 10),
                            child: Container(
                              height: 50,
                              width: 50,
                              child: side_stand == true
                                  ? Image.asset(
                                'assets/images/colorside_standbg.png',
                                fit: BoxFit.cover,
                              )
                                  : Image.asset(
                                'assets/images/side_stand.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 50, top: 0),
                            child: Container(
                              height: 50,
                              width: 50,
                              child: Text(
                                "$gearr",
                                style: GoogleFonts.roboto(
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              //child:side_stand==true?Image.asset('assets/images/colorside_standbg.png',fit:BoxFit.fill,):Image.asset('assets/images/side_stand.png',fit:BoxFit.fill,),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 110.0, top: 20.0),
                          child: Center(
                            child: Container(
                              height: 350,
                              width: 800,
                              //here we are doing the box decoration
                              decoration: BoxDecoration(
                                  color: Colors
                                      .white, //Color(0xffCCCCFF),//Color(0xff38eeff),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(800),
                                      bottomLeft: Radius.circular(800),
                                      topRight: Radius.elliptical(100, 100),
                                      bottomRight: Radius.elliptical(100, 100)),
                                  border: Border.all(
                                    color: Colors.black26, //Color(0xff38eeff),
                                    width: 3,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 3,
                                      spreadRadius: 3,
                                      color: Colors.black26, //Color(0xff38eeff),
                                    )
                                  ]),
                              //boxdecoration end

                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SfRadialGauge(
                                    enableLoadingAnimation: false,
                                    animationDuration: 4500,
                                    //
                                    axes: <RadialAxis>[
                                      RadialAxis(
                                          minimum: 0,
                                          maximum: 200,
                                          isInversed: false,
                                          startAngle:
                                          50, //240,//90  //for now 7/24/2023 50
                                          endAngle:
                                          -50, //240,//-90  //for now 7/24/2023 -50
                                          interval: 10,
                                          showLabels: false,
                                          showTicks: false,
                                          ranges: <GaugeRange>[
                                            GaugeRange(
                                              startValue: 0,
                                              endValue: 40,
                                              color: Colors.orange,
                                              startWidth: 5,
                                              endWidth: 5,
                                            ),
                                            GaugeRange(
                                              startValue: 40,
                                              endValue: 70,
                                              color: Colors.orange,
                                              startWidth: 5,
                                              endWidth: 5,
                                            ),
                                            GaugeRange(
                                              startValue: 70,
                                              endValue: 140,
                                              color: Colors.orange,
                                              startWidth: 5,
                                              endWidth: 5,
                                            ),
                                            GaugeRange(
                                              startValue: 140,
                                              endValue: 200,
                                              color: Colors.orange,
                                              startWidth: 5,
                                              endWidth: 5,
                                            ),
                                          ],
                                          axisLineStyle: AxisLineStyle(
                                              thickness: 40,
                                              color:
                                              Colors.black12), //Color(0xffEC5800)

                                          pointers: <GaugePointer>[
                                            NeedlePointer(
                                              value: 50,
                                              enableAnimation: false,
                                              needleStartWidth: 0,
                                              needleEndWidth: 0,
                                              needleColor: Color(0xFFDADADA),
                                              knobStyle: KnobStyle(
                                                  color: Colors.white,
                                                  borderColor:
                                                  Colors.white, //Color(0xFFDADADA

                                                  knobRadius: 0.00,
                                                  borderWidth: 0.00),
                                              tailStyle: TailStyle(
                                                  color: Color(0xFFDADADA),
                                                  width: 0,
                                                  length: 0.0),
                                              animationType: AnimationType.ease,
                                            ),
                                            RangePointer(
                                              value: double.tryParse(speedD)!>=200?200:double.tryParse(speedD)!,
                                              width: 35,
                                              color: get_guage_color(),
                                              pointerOffset: 5,
                                            ),
                                            MarkerPointer(
                                              value: double.tryParse(speedD)!>=200?200:double.tryParse(speedD)!,
                                              markerOffset: 3,
                                              markerWidth: 5,
                                              markerHeight: 35,
                                              color: Colors.white,
                                              borderWidth: 0,
                                            ) //Color(0xffFCD12A)get_guage_color()
                                            //MarkerPointer(value:value,markerOffset:35,markerWidth:40,markerType: MarkerType.image,markerHeight:50,color:get_guage_color(),borderWidth:0,imageUrl:"assets/images/bike_blue.png",)//Color(0xffFCD12A)                //0xff0FFF50 for eco mode
                                          ],
                                          annotations: <GaugeAnnotation>[
                                            GaugeAnnotation(
                                              widget: Text(
                                                "ECO",
                                                style: TextStyle(
                                                    fontSize: 30,
                                                    fontWeight: FontWeight.bold,
                                                    color: Color(0xffFF7417)),
                                              ),
                                              angle: -90,
                                              positionFactor: 0.4,
                                            ),
                                            GaugeAnnotation(
                                              widget: Text(
                                                double.tryParse(speedD)!>=200?"200":speedD,
                                                style: TextStyle(
                                                    fontSize: 60,
                                                    fontWeight: FontWeight.bold,
                                                    color: Color(0xffFF7417)),
                                              ),
                                              angle: -90,
                                              positionFactor: 0.1,
                                            ),
                                            GaugeAnnotation(
                                              widget: Text(
                                                "kmph",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black38),
                                              ),
                                              angle: 90,
                                              positionFactor: .4,
                                            ),
                                          ])
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 0, bottom: 0), //change
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            Stack(
                                              children: [
                                                Container(
                                                  alignment:Alignment.topLeft,
                                                  height:40,width:80,
                                                  child: Icon(Icons.call,
                                                      size: 40, color: Color(0xff323232)),
                                                ),

                                                Positioned(left:20,child: Text("")),
                                              ],
                                            ),
                                            Padding(
                                              padding:
                                              const EdgeInsets.only(left: 15.0),
                                              child: Icon(Icons.message,
                                                  size: 40, color: Color(0xff323232)),
                                            ),
                                            Padding(
                                              padding:
                                              const EdgeInsets.only(left: 55.0),
                                              child: Icon(Icons.bluetooth,
                                                  size: 40, color: Color(0xff323232)),
                                            ),
                                            Padding(
                                              padding:
                                              const EdgeInsets.only(left: 55.0),
                                              child: Icon(Icons.network_cell,
                                                  size: 40, color: Color(0xff323232)),
                                            ),
                                            Padding(
                                              padding:
                                              const EdgeInsets.only(left: 55.0),
                                              child: Icon(
                                                  Icons.battery_charging_full_sharp,
                                                  size: 40,
                                                  color: battery_color()),
                                            ),
                                          ],
                                        ),
                                        Container(
                                          height: 204,
                                          width: 420,
                                          color: Colors.white,
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding:
                                                const EdgeInsets.only(top: 20.0),
                                                child: Container(
                                                  width: 100,
                                                  height: 100,
                                                  color: Colors.white,
                                                  child: Icon(
                                                    Icons.music_note,
                                                    size: 100,
                                                    color: Colors.blue,
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                songTitle,
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold),
                                              ),
                                              Text(
                                                Movie,
                                                style: TextStyle(
                                                    fontSize: 16, color: Colors.grey),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                                children: [
                                                  IconButton(
                                                    icon: Icon(Icons.skip_previous),
                                                    onPressed: () {
                                                      // Implement skip to previous logic
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
                                        Row(
                                          children: [
                                            Container(
                                                width: 330,
                                                height: 100,
                                                child: Column(
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets.only(
                                                        right: 160,
                                                      ),
                                                      child: Text(
                                                        "DTE${fuelvalue*600}km",
                                                        style: TextStyle(
                                                            fontSize: 24,
                                                            fontWeight:
                                                            FontWeight.bold,
                                                            color: Colors.black87),
                                                      ),
                                                    ),
                                                    Container(
                                                      height: 50,
                                                      child: LinearProgressIndicator(
                                                        value:fuelvalue ,///
                                                        valueColor:
                                                        AlwaysStoppedAnimation(
                                                            Color(0xffFCD12A)),
                                                        backgroundColor: Colors.grey,
                                                      ),
                                                    ),
                                                  ],
                                                )),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 0, top: 20),
                                              child: Container(
                                                  height: 50,
                                                  width: 50,
                                                  decoration: const BoxDecoration(
                                                    image: DecorationImage(
                                                      image: ExactAssetImage(
                                                          'assets/images/fuel-icon2.png'),
                                                      fit: BoxFit.fill,
                                                    ),
                                                  )),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(top: 20),
                                              child: Text(
                                                "${fuelvalue*100}0%" ,
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black87),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 0.0),
                          child: InkWell(
                            onTap: () {
                              currentScreenIndex=2;
                              Navigator.of(context).pushReplacementNamed('/second');
                            },
                            child: SizedBox(
                                height: 300,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        currentScreenIndex=2;
                                         Navigator.of(context).pushReplacementNamed('/second');
                                         Navigator.push(context,MaterialPageRoute(builder: (context)=>powermode()));
                                      },
                                      icon: Icon(
                                        Icons.keyboard_double_arrow_right,
                                        size: 80,
                                        color: Colors.grey,
                                      ),
                                    )
                                  ],
                                )),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 600,
                      height: 30,
                      alignment: Alignment.center,
                      // Set the background color for the container
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [],
                      ),
                    ),
                    SizedBox(
                      height: 0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 0, bottom: 0, left: 20),
                          child: Container(
                            width: 900, //1175
                            height: 40,

                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(100),
                                    bottomLeft: Radius.circular(100),
                                    topRight: Radius.circular(100),
                                    bottomRight: Radius.circular(100)),
                                border: Border.all(
                                  color: Colors.grey, //Color(0xff38eeff),
                                  width: 3,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 0,
                                    spreadRadius: 0,
                                    color: Colors.grey, //Color(0xff38eeff),
                                  )
                                ]),

                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                 double.tryParse(speedD)!>=200?"Avg speed 200 km/h":"Avg speed ${speedD} km/h",
                                  style: GoogleFonts.roboto(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  "ODO $odometerr km",
                                  style: GoogleFonts.roboto(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(

                                  "Rpm $rpmr" ,

                                  style: GoogleFonts.roboto(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  "Service $serviceD",
                                  style: GoogleFonts.roboto(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ));

      }),


    );
  }



  //page changes
int switch_screen_lock=0;
  void choose_screen()
  {
    if(currentScreenIndex==1 && last_mode!=1)
    {
      last_mode=1;
      if(move=='2')
      {
        currentScreenIndex=4;
        //Navigator.pushNamed(context, '/Second');
        //Navigator.push(context,MaterialPageRoute(builder: (context)=>menubar()));

      }
      else if(move=='3')
      {
        currentScreenIndex=2;
       // Navigator.push(context,MaterialPageRoute(builder: (context)=>powermode()));

      }
      else{
        currentScreenIndex=currentScreenIndex;
        move='4';
      }
    }

    //////////////////////////////////////////////

    else if(currentScreenIndex==2  && last_mode!=2)
    {

      last_mode=1;
      if(move=='2')
      {
        currentScreenIndex=1;
        //Navigator.pushNamed(context, '/Second');
        Navigator.push(context,MaterialPageRoute(builder: (context)=>MyHomePage()));

      }
      else if(move=='3')
      {
        currentScreenIndex=3;
       // Navigator.push(context,MaterialPageRoute(builder: (context)=>regenmode()));

      }

      else{
        currentScreenIndex=currentScreenIndex;
        move='4';
      }
    }

    /////////////////////////////////

    else if(currentScreenIndex==3  && last_mode!=3)
    {
      last_mode=3;
      if(move=='2')
      {
        currentScreenIndex=2;
        //Navigator.pushNamed(context, '/Second');
       // Navigator.push(context,MaterialPageRoute(builder: (context)=>powermode()));

      }
      else if(move=='3')
      {
        currentScreenIndex=4;
      //  Navigator.push(context,MaterialPageRoute(builder: (context)=>menubar()));

      }

      else{
        currentScreenIndex=currentScreenIndex;
        move='4';
      }
    }

    /////////////////////////////////

    else if(currentScreenIndex==4  && last_mode!=4)
    {
      last_mode=4;
      if(move=='2')
      {
        currentScreenIndex=3;
        //Navigator.pushNamed(context, '/Second');
      //  Navigator.push(context,MaterialPageRoute(builder: (context)=>regenmode()));

      }
      else if(move=='3')
      {
        currentScreenIndex=1;
        Navigator.push(context,MaterialPageRoute(builder: (context)=>MyHomePage()));

      }

      else{
        currentScreenIndex=currentScreenIndex;
        move='4';



      }
    }






  }




//mode change function
void switch_mode()
{
  if(modeDr=='1' && last_mode!=1)
    {
      currentScreenIndex=1;
      Navigator.of(context).pushReplacementNamed('/first');
      last_mode=1;
    }
  else if(modeDr=='2' && last_mode!=2 )
    {

      currentScreenIndex=2;
      Navigator.of(context).pushReplacementNamed('/second');
      last_mode=2;
    }
  else if(modeDr=='3'  && last_mode!=3)
    {

      currentScreenIndex=3;
      Navigator.of(context).pushReplacementNamed('/third');
      last_mode=3;
    }

  else{
    last_mode=0;
  }









}







































///////////////////////////////////////////////////////
}
