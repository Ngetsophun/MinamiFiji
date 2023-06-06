import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Setting'),
          backgroundColor: Colors.transparent,
        ),
        body: Padding(
          padding: EdgeInsets.all(5),
          child: ListView.builder(
              itemCount: 4,
              itemBuilder: (context, Index) {
                return GestureDetector(
                  onTap: () {},
                  child: Container(
                    //child: ,
                  ),
                   
                );
              }),
        ));
  }
}
