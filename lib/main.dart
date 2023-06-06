import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';



import 'Screen/HomePage/showRoom.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: ShowRoomScreen(),
     // home: Login_Form(),
      //home:  SignUpScreen(),
      //  home: AddRoomDeviceScreen(),
    );
  }
}
