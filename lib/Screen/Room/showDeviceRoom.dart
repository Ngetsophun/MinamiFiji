import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:minamifuji/Screen/Room/addDeviceRoom.dart';
import 'package:minamifuji/Screen/Room/updateDeviceRoom.dart';

class ShowDeviceRoom extends StatefulWidget {
  const ShowDeviceRoom({super.key});

  @override
  State<ShowDeviceRoom> createState() => _ShowDeviceRoomState();
}

class _ShowDeviceRoomState extends State<ShowDeviceRoom> {
  final databaseRef = FirebaseDatabase.instance.reference().child('path');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Show Device'),
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
          child: FirebaseAnimatedList(
              query: databaseRef,
              itemBuilder: (BuildContext context, DataSnapshot snapshot,
                  Animation<double> animation, int index) {
                Map myroomAPP = snapshot.value as Map;
                myroomAPP['key'] = snapshot.key;
                return ListItems(myroomAPP);
                // return Container(
                //   padding: EdgeInsets.all(10),
                //   child: ListTile(
                //     shape: RoundedRectangleBorder(
                //       side: BorderSide(
                //         color: Colors.white,
                //       ),
                //       borderRadius: BorderRadius.circular(10),
                //     ),
                //     tileColor: Colors.indigo[100],
                //     trailing: Row(
                //       mainAxisSize: MainAxisSize.min,
                //       children: [
                //         IconButton(
                //             onPressed: () {
                //               databaseRef.child(snapshot.key!).remove();
                //             },
                //             icon: Icon(Icons.delete)),
                //         IconButton(
                //             onPressed: () {
                //               //databaseRef.child(snapshot.key!).update(value)
                //             },
                //             icon: Icon(Icons.update)),
                //       ],
                //     ),
                //     subtitle: Text(snapshot.child('name').value.toString()),
                //     title: Text(snapshot.child('board').value.toString()),
                //   ),
                // );
              })),
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

  Widget ListItems(Map myroomapp) {
    return Container(
      height: 100,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: ListTile(
        onTap: () {
          print(myroomapp['name']);
        },

        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Color.fromARGB(255, 213, 209, 240),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        
        tileColor: Color.fromARGB(255, 194, 204, 235),
        trailing: Column(
          children: [
            PopupMenuButton(
              itemBuilder: (context) => [
                PopupMenuItem(
                    child: InkWell(
                  onTap: () {
                   
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) =>
                    //             UpdateDeviceRoom(myroomAPP: myroomapp['key'])));
                  //  UpdateDeviceRoomDialog();
                    
                    print('update');
                  },
                  child: Row(
                    children: [
                      Icon(Icons.update),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text('Update'),
                      ),
                    ],
                  ),
                )),
                PopupMenuItem(
                    child: InkWell(
                  onTap: () {
                    databaseRef.child(myroomapp['key']).remove();
                  },
                  child: Row(
                    children: [
                      Icon(Icons.delete),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text('Delete'),
                      ),
                    ],
                  ),
                )),
              ],
            ),
          ],
        ),
        title: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Name:' + '\t' + myroomapp['name'],
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'GPIO:' + '\t' + myroomapp['GPIO'],
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'BoardID:' + '\t' + myroomapp['board'],
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future UpdateDeviceRoomDialog(String name, BuildContext context) {
    var nameUpDeviceControler = TextEditingController(text: name);

    return showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: SizedBox(
              height: 300,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'UPDATE DEVICE',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                        child: TextFormField(
                      controller: nameUpDeviceControler,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 2)),
                        labelText: 'Name Device',
                        labelStyle: TextStyle(color: Colors.black),
                        prefixIcon: Icon(
                          Icons.devices_sharp,
                          color: Colors.black,
                        ),
                      ),
                    )),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        height: 50,
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                          ),
                          onPressed: () {
                            UpdateData(name, Key);
                          },
                          child: const Text(
                            'Update',
                            style: TextStyle(fontSize: 18),
                          ),
                        ))
                  ],
                ),
              ),
            ),
          );
        });
  }

  void UpdateData(String name, var key) {
    Map<String, String> x = {'name': name};
    databaseRef.child(key).update(x);
  }
}
