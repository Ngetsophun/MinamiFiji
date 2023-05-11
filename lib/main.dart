import 'package:flutter/material.dart';
import 'package:minamifuji/Screen/HomePage/addCamera.dart';

import 'package:minamifuji/Screen/HomePage/addRoom.dart';
import 'package:minamifuji/Screen/HomePage/showRoom.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ShowRoomScreen(),
    );
  }
}

