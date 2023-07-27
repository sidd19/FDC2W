

import 'package:flutter/material.dart';
import 'package:bluez/bluez.dart';
import 'package:collection/collection.dart';

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
                ElevatedButton(
                  onPressed: () async {
                    await initBluetooth();
                  },
                  child: Text('Scan for Devices',style:TextStyle(color:Colors.blue,fontSize:20,fontWeight:FontWeight.bold),),
                ),
                SizedBox(height: 20),
                if (devices != null)
                  Column(
                    children: [
                      for (var device in devices!)
                        ListTile(
                          title: Text(device.alias,style:TextStyle(color:Colors.black,fontSize:14,fontWeight:FontWeight.bold),),
                          subtitle: Text(device.address,style:TextStyle(color:Colors.black,fontSize:14,fontWeight:FontWeight.bold),),
                          onTap: () {
                            setState(() {
                              deviceToConnect = device;
                            });
                          },
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