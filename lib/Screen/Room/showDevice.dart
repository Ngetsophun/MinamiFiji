import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:minamifuji/Screen/Room/addDeviceRoom.dart';

import 'package:minamifuji/model/device_model.dart';
import 'package:minamifuji/model/room_model.dart';

class ShowDeviceScreen extends StatefulWidget {
  final DataRoom dataRoom;
  const ShowDeviceScreen({super.key, required this.dataRoom});

  @override
  State<ShowDeviceScreen> createState() => _ShowDeviceScreenState();
}

class _ShowDeviceScreenState extends State<ShowDeviceScreen> {
  bool onchange = false;
  late DataRoom dataRoompage;

  final databaseRef = FirebaseDatabase.instance.reference().child('LivingRoom');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Show Device',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView.builder(
            itemCount: deviceList.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              Device device = deviceList[index];
              return Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Container(
                  height: 80,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            device.deviceName,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            device.Board,
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              Transform.scale(
                                alignment: Alignment.bottomRight,
                                scaleX: 0.8,
                                scaleY: 0.85,
                                child: Switch.adaptive(
                                    value: onchange,
                                    activeColor: onchange
                                        ? Colors.green.withOpacity(0.4)
                                        : Colors.black,
                                    // trackColor: Colors.black,
                                    onChanged: (bool value) {
                                      setState(() {
                                        onchange = value;
                                      });
                                    }),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              );
            }),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddDeviceScreen()));
        },
        label: const Text(
          'Add Device',
          style: TextStyle(color: Colors.black),
        ),
        icon: const Icon(
          Icons.devices_sharp,
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}
