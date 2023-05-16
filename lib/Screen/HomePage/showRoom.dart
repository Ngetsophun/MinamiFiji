import 'package:flutter/material.dart';
import 'package:minamifuji/Screen/HomePage/addCamera.dart';
import 'package:minamifuji/Screen/HomePage/addRoom.dart';
import 'package:minamifuji/Screen/Login_Screen/loginForm.dart';
import 'package:minamifuji/Screen/Report/ReportScreen.dart';

import 'package:minamifuji/Screen/Room/addDevice.dart';
import 'package:minamifuji/Screen/Room/showDevice.dart';
import 'package:minamifuji/Screen/Translation/translation_screen.dart';
import 'package:minamifuji/model/room_model.dart';

class ShowRoomScreen extends StatefulWidget {
  const ShowRoomScreen({super.key});

  @override
  State<ShowRoomScreen> createState() => _ShowRoomScreenState();
}

class _ShowRoomScreenState extends State<ShowRoomScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'),
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: ((build) => TranslationScreen()));
              },
              icon: Icon(Icons.translate)),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(child: Text('Header')),
            ListTile(
              leading: Icon(Icons.people),
              title: Text('Profile'),
              onTap: () {
                print("profile");
              },
            ),
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text('Notification'),
              onTap: () {
                print("Notification");
              },
            ),
            ListTile(
              leading: Icon(Icons.pie_chart_outline),
              title: Text('Report'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ReportScreen()));
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('settings'),
              onTap: () {
                print("settings");
              },
            ),
            ListTile(
              leading: Icon(Icons.question_answer),
              title: Text('About US'),
              onTap: () {
                print("About US");
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Logout'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Login_Form()));
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Room',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddRoomScreen()));
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
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 200,
                ),
                itemCount: dataRoomList.length,
                itemBuilder: (context, Index) {
                  DataRoom dataRoom = dataRoomList[Index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ShowDeviceScreen(
                                    dataRoom: dataRoom,
                                  )));
                    },
                    child: Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Padding(padding: EdgeInsets.all(5)),
                          Text(
                            dataRoom.nameRoom,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            height: 110,
                            width: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Image.asset(dataRoom.imgRoom),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            child: Text(dataRoom.deviceRoom),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
