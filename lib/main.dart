import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:minamifuji/Screen/HomePage/showRoom.dart';
import 'package:minamifuji/Screen/Login_Screen/SingUpForm.dart';
import 'package:minamifuji/Screen/Login_Screen/loginForm.dart';
import 'package:minamifuji/Screen/Report/barchartScreen.dart';
import 'package:minamifuji/Screen/Room/showDeviceRoom.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, 
    //home: ShowDeviceRoom()
        //home: ShowRoomScreen(),
        home:  SignUpScreen(),
        );
  }
}
