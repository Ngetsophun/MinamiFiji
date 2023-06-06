// ignore_for_file: unused_local_variable

import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:minamifuji/resource/store_dataRoom.dart';

class AddRoomScreen extends StatefulWidget {
  const AddRoomScreen({super.key});

  @override
  State<AddRoomScreen> createState() => _AddRoomScreenState();
}

class _AddRoomScreenState extends State<AddRoomScreen> {
  File? imageFile;

  CollectionReference roomdevices =
      FirebaseFirestore.instance.collection('roomdevices');

  get _globalKey => GlobalKey<FormState>();
  TextEditingController nameRoomController = TextEditingController();

  void SaveRoom() async {
    String name = nameRoomController.text;
    String resp = await saveDataRoom(name: name, file: imageFile!);
  }

  Future<void> _pickImage(ImageSource source) async {
    final image = await openImagePicker(source);

    setState(() {
      imageFile = image;
    });
  }

  Future<File?> openImagePicker(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: source);

    if (pickedFile != null) {
      return File(pickedFile.path);
    } else {
      // User canceled the picker
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Room'),
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Add Room',
              style: TextStyle(fontSize: 40),
            ),
            SizedBox(
              height: 40,
            ),
            Center(
              child: Stack(
                children: <Widget>[
                  Column(children: <Widget>[
                    imageFile != null
                        ? CircleAvatar(
                            radius: 80, backgroundImage: FileImage(imageFile!))
                        : CircleAvatar(
                            radius: 80,
                            backgroundImage:
                                AssetImage('assets/Images/defaultImage.png'),
                          )
                    // CircleAvatar(
                    //   backgroundColor: Colors.black,
                    //   radius: 80,
                    //   backgroundImage:
                    //      _imageFile != null ? FileImage(_imageFile!) : null,
                    //  // backgroundImage:
                    //     //  AssetImage('assets/Images/defaultImage.png'),
                    // ),
                  ]),
                  Positioned(
                      bottom: 20.0,
                      right: 10.0,
                      child: InkWell(
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              builder: ((build) => bottomsheet()));
                        },
                        child: Icon(
                          Icons.camera_alt,
                          color: Colors.teal,
                          size: 28.0,
                        ),
                      ))
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: TextFormField(
                controller: nameRoomController,
                validator: (value) {
                  if (value!.isEmpty) return 'Name can not is empty';
                  return null;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.teal)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 2)),
                  labelText: 'Name Room',
                  labelStyle: TextStyle(color: Colors.black),
                  prefixIcon: Icon(
                    Icons.home,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                  ),
                  onPressed: () {
                    SaveRoom();
                    print('Save Room to firebase');
                  },
                  child: const Text(
                    'Save Room',
                    style: TextStyle(fontSize: 18),
                  ),
                ))
          ],
        ),
      ),
    
    );
  }

  Future<File?> openGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      return File(pickedFile.path);
    } else {
      // User canceled the picker
      return null;
    }
  }

  Future<File?> openCamera() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    if (pickedFile != null) {
      return File(pickedFile.path);
    } else {
      // User canceled the picker
      return null;
    }
  }

  Widget bottomsheet() {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: [
          Text(
            'Choose Room photo',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton.icon(
                  onPressed: () => _pickImage(ImageSource.camera),
                  icon: Icon(Icons.camera),
                  label: Text('Camera')),
              TextButton.icon(
                  onPressed: () => _pickImage(ImageSource.gallery),
                  icon: Icon(Icons.image),
                  label: Text('Gallery')),
            ],
          )
        ],
      ),
    );
  }

}
