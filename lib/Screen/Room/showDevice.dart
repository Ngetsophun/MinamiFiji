import 'package:flutter/material.dart';
import 'package:minamifuji/Screen/Room/addDevice.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Show Device'),
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Device',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddDeviceScreen()));
                  },
                  child: Container(
                    height: 55,
                    width: 70,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.black),
                    child: Center(
                      child: Text(
                        '+',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: deviceList.length,
                  itemBuilder: (context, index) {
                    Device device = deviceList[index];
                    return Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Container(
                        height: 80,
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
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
          ],
        ),
      ),
    );
  }
}
