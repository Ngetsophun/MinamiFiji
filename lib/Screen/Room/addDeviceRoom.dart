import 'dart:ffi';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class AddDeviceScreen extends StatefulWidget {
  const AddDeviceScreen({super.key});

  @override
  State<AddDeviceScreen> createState() => _AddDeviceScreenState();
}

class _AddDeviceScreenState extends State<AddDeviceScreen> {
  late String chooseBoard = '0 = OFF';
  List ItemBoard = ['0 = OFF', '1 = ON'];

  TextEditingController nameDeviceController = TextEditingController();
  TextEditingController boardIDController = TextEditingController();
  TextEditingController numberGPIOController = TextEditingController();
  TextEditingController stateDeviceController = TextEditingController();

  final databaseRef = FirebaseDatabase.instance.reference();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Device'),
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height / 2.0,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
                child: TextFormField(
              controller: nameDeviceController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 2)),
                labelText: 'Name Device',
                labelStyle: TextStyle(color: Colors.black),
                prefixIcon: Icon(
                  Icons.devices_sharp,
                  color: Colors.black,
                ),
              ),
            )),
            SizedBox(
              height: 15,
            ),
            Container(
                child: TextFormField(
              controller: boardIDController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 2)),
                labelText: 'Board ID',
                labelStyle: TextStyle(color: Colors.black),
                prefixIcon: Icon(
                  Icons.add_chart,
                  color: Colors.black,
                ),
              ),
            )),
            SizedBox(
              height: 15,
            ),
            Container(
                child: TextFormField(
              controller: numberGPIOController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 2)),
                labelText: 'GPIO Number',
                labelStyle: TextStyle(color: Colors.black),
                prefixIcon: Icon(
                  Icons.pin_sharp,
                  color: Colors.black,
                ),
              ),
            )),
            SizedBox(
              height: 15,
            ),
            Container(
                child: TextField(
              controller: stateDeviceController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                suffixIcon: DropdownButtonFormField(
                  value: chooseBoard,
                  onChanged: (item) {
                    setState(() {
                      chooseBoard = item!;
                    });
                  },
                  items: ItemBoard.map((item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(item),
                      )).toList(),
                ),
              ),
            )),
            SizedBox(
              height: 15,
            ),
            Container(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                  ),
                  onPressed: () {
                    // if (nameDeviceController.text.isNotEmpty &&
                    //     boardIDController.text.isNotEmpty &&
                    //     numberGPIOController.text.isNotEmpty &&
                    //     stateDeviceController.text.isNotEmpty) {
                    InsertDevice(
                        nameDeviceController.text,
                        boardIDController.text,
                        numberGPIOController.text,
                        stateDeviceController.text);
                    print('add firebase');
                    // }
                    // print('addd data');
                  },
                  child: const Text(
                    'Create Device',
                    style: TextStyle(fontSize: 18),
                  ),
                ))
          ],
        ),
      ),
    );
  }

  void InsertDevice(
      String nameDevice, String boardID, String numberGPIO, String State) {
    // String? key = databaseRef.child('path').child('Room1').push().key;
    String? key = databaseRef.child('path').push().key;
    databaseRef.child('path').child(key!).set({
      'id': key,
      'name': nameDevice,
      'board': boardID,
      'GPIO': numberGPIO,
      'State': State
    });
    nameDeviceController.clear();
    boardIDController.clear();
    numberGPIOController.clear();
    stateDeviceController.clear();
  }
}
