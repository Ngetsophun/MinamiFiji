import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';


class UpdateDeviceRoom extends StatefulWidget {
  const UpdateDeviceRoom({super.key, required this.myroomAPP});

  final String myroomAPP;

  @override
  State<UpdateDeviceRoom> createState() => _UpdateDeviceRoomState();
}

class _UpdateDeviceRoomState extends State<UpdateDeviceRoom> {
  TextEditingController nameUpDevicecontroller = TextEditingController();
  late DatabaseReference dbRef;


  void initState() {
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child('path');
  }

  void getDeviceRoomData() async{
    // DataSnapshot snapshot  = (await dbRef.child(widget.myroomAPP))
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
