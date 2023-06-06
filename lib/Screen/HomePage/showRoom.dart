import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

import 'package:minamifuji/Screen/Login_Screen/drawer_screen.dart';

import 'package:minamifuji/Screen/Translation/translation_screen.dart';



class ShowRoomScreen extends StatefulWidget {
  const ShowRoomScreen({super.key});

  @override
  State<ShowRoomScreen> createState() => _ShowRoomScreenState();
}

class _ShowRoomScreenState extends State<ShowRoomScreen> {
  bool light = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerScreen(),
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
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: StreamBuilder(
              stream: FirebaseFirestore.instance.collection('Room').snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 200,
                  ),
                  itemCount: snapshot.data?.docs.length,
                  itemBuilder: (context, Index) {
                    //DataRoom dataRoom = dataRoomList[Index];
                    return GestureDetector(
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => ShowDeviceRoom()));
                        print(snapshot.data?.docs[Index]['name Room']);
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
                              snapshot.data?.docs[Index]['name Room'],
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
                              child:
                                  Image.asset('assets/Images/livingroom.png'),
                            ),
                            // SizedBox(
                            //   height: 10,
                            // ),
                            // Container(
                            //   child: Text(dataRoom.deviceRoom),
                            // ),
                          ],
                        ),
                      ),
                    );
                  },
                );

                // if ( snapshot.hasData){
                //   return GridView.builder(
                //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                //       crossAxisCount: 2,
                //       mainAxisExtent: 200,
                //     ),
                //     itemCount: snapshot.data?.docs.length,
                //     itemBuilder: (context, Index) {
                //       // DataRoom dataRoom = dataRoomList[Index];
                //       return GestureDetector(
                //         onTap: () {
                //           // Navigator.push(
                //           //     context,
                //           //     MaterialPageRoute(
                //           //         builder: (context) => ShowDeviceRoom()));
                //         },
                //         child: Card(
                //           elevation: 3,
                //           shape: RoundedRectangleBorder(
                //             borderRadius: BorderRadius.circular(10),
                //           ),
                //           child: Column(
                //             children: [
                //               Padding(padding: EdgeInsets.all(5)),
                //               Text(
                //                 snapshot.data?.docs[Index]['nameRoom'],
                //                 style: TextStyle(
                //                     fontWeight: FontWeight.bold, fontSize: 18),
                //               ),
                //               // SizedBox(
                //               //   height: 10,
                //               // ),
                //               // Container(
                //               //   padding: EdgeInsets.all(10),
                //               //   height: 110,
                //               //   width: 150,
                //               //   decoration: BoxDecoration(
                //               //     borderRadius: BorderRadius.circular(5),
                //               //   ),
                //               //   child: Image.asset(dataRoom.imgRoom),
                //               // ),
                //               // SizedBox(
                //               //   height: 10,
                //               // ),
                //               // Container(
                //               //   child: Text(dataRoom.deviceRoom),
                //               // ),
                //             ],
                //           ),
                //         ),
                //       );
                //     },
                //   );
                // }
              }),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Navigator.push(context,
          //     MaterialPageRoute(builder: (context) => AddRoomScreen()));

          displayTextInputDialog(context);
        },
        label: const Text(
          'Add Room',
          style: TextStyle(color: Colors.black),
        ),
        icon: const Icon(
          Icons.home,
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
      ),
    );
  }

  final TextEditingController nameRoomDialogController =
      TextEditingController();
  Future<void> displayTextInputDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: TextField(
              onChanged: (value) {
                setState(() {
                  // valueText = value;
                });
              },
              controller: nameRoomDialogController,
              decoration: const InputDecoration(hintText: "Create Room"),
            ),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    setState(() {
                      Navigator.pop(context);
                    });
                  },
                  child: Text('CANCEL')),
              TextButton(
                  onPressed: () {
                    Map<String, dynamic> dataRoom = {
                      'name Room': nameRoomDialogController.text.trim()
                    };
                    FirebaseFirestore.instance.collection('Room').add(dataRoom);
                    nameRoomDialogController.clear();
                  },
                  child: Text('CREATE'))
            ],
          );
        });
  }
}
