

import 'package:flutter/material.dart';
import 'package:bluez/bluez.dart';
import 'package:collection/collection.dart';
import 'package:flutter_homescreen/menubar.dart';

class bluetooth extends StatefulWidget
{

  @override
  State<bluetooth> createState()=>_bluetooth();

}

class _bluetooth extends State<bluetooth> {
  List<BlueZDevice>? devices;
  BlueZDevice? deviceToConnect;
  BlueZClient client = BlueZClient();

  @override
  void initState() {
    super.initState();
    initBluetooth();
  }

  Future<void> initBluetooth() async {
    try {
      await client.connect();
      devices = await client.devices;
      setState(() {}); // Trigger a UI update after obtaining the device list.
    } catch (e) {
      print('Failed to initialize Bluetooth: $e');
    }
  }

  Future<void> connectToDevice() async {
    if (deviceToConnect != null) {
      try {
        await deviceToConnect!.connect();
        print('Connected to device ${deviceToConnect!.address} ${deviceToConnect!.alias}');
      } catch (e) {
        print('Failed to connect to device: $e');
      }
    }
  }

  @override
  void dispose() {
    client.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Container(
            width:1024,
            height:600,

            decoration:BoxDecoration(
                color:Colors.white,
                boxShadow:[
                BoxShadow(
                  blurRadius:10,
                  blurStyle:BlurStyle.normal,
                )
              ]
            ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  children: [
                    IconButton(onPressed: (){
                      Navigator.push(context,MaterialPageRoute(builder:(context)=>menubar()));
                    }, icon:Icon(Icons.keyboard_double_arrow_left,size:80,color:Colors.grey,),
                    ),

                    ElevatedButton(
                      onPressed: () async {
                        await initBluetooth();
                      },
                      child: Text('Scan for Devices',style:TextStyle(color:Colors.blue,fontSize:20,fontWeight:FontWeight.bold),),
                    ),


                  ],
                ),
                SizedBox(height: 20),
                if (devices != null)
                  Column(
                    children: [
                      for (var device in devices!)

                        InkWell(onTap:(){

                          showDialog(context: context, builder:(context){
                            return Container();
                          });
                        },
                          child: ListTile(
                            leading: Icon(Icons.bluetooth),
                            title: Text(device.alias,style:TextStyle(color:Colors.black,fontSize:14,fontWeight:FontWeight.bold),),
                            subtitle: Text(device.address,style:TextStyle(color:Colors.black,fontSize:14,fontWeight:FontWeight.bold),),

                            onTap: () {

                              setState(() {
                                deviceToConnect = device;
                                showDialog(context: context, builder: (context){

                                  return AlertDialog(
                                      
                                      content:Container(height:380,width:40,
                                      child:Column(
                                        children: [
                                          Container(height:50,width:300,color:Colors.grey,child:Center(child: Text(device.alias,style:TextStyle(fontSize:20,color:Colors.white,fontWeight:FontWeight.bold),)),),
                                          Container(height:200,width:300,color:Colors.grey,child:Image.asset("assets/images/headphone.png")) ,                                  //Icon(Icons.headphones,size:200,color:Colors.blue,),
                                          Padding(
                                            padding: const EdgeInsets.only(top:0.0),
                                            child: Container(

                                              child: ElevatedButton(
                                                onPressed: deviceToConnect == null ? null : connectToDevice,
                                                child: Text('Connect to Device'),
                                              ),
                                            ),



                                          ), SizedBox(height:20),Container(

                                            child: ElevatedButton(
                                              onPressed: deviceToConnect == null ? null : connectToDevice,
                                              child: Text('Disconnect to Device'),
                                            ),
                                          ),
                                          //ElevatedButton(onPressed:(){Navigator.pop(context);},child:Text(device.alias)),
                                        ],
                                      ),),
                                  );

                                });
                              });;
                            },
                          ),
                        ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: deviceToConnect == null ? null : connectToDevice,
                        child: Text('Connect to Device'),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}