import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddRoomDeviceScreen extends StatefulWidget {
  const AddRoomDeviceScreen({super.key});

  @override
  State<AddRoomDeviceScreen> createState() => _AddRoomDeviceScreenState();
}

class _AddRoomDeviceScreenState extends State<AddRoomDeviceScreen> {
  File? imageFile;

  TextEditingController nameDeviceController = TextEditingController();
  TextEditingController StateController = TextEditingController();
  TextEditingController nameRoomController = TextEditingController();
  TextEditingController boardController = TextEditingController();
  TextEditingController GPIOnumbereController = TextEditingController();

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
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Stack(
                  children: <Widget>[
                    Column(children: <Widget>[
                      imageFile != null
                          ? CircleAvatar(
                              radius: 60,
                              backgroundImage: FileImage(imageFile!))
                          : CircleAvatar(
                              radius: 60,
                              backgroundImage:
                                  AssetImage('assets/Images/defaultImage.png'),
                            )
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
                  // controller: nameRoomController,
                  // validator: (value) {
                  //   if (value!.isEmpty) return 'Name can not is empty';
                  //   return null;
                  // },
                  controller: nameRoomController,
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
                child: TextFormField(
                  controller: nameDeviceController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2)),
                    labelText: 'Name Device',
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
                child: TextFormField(
                  controller: boardController,
                  validator: (value) {
                    if (value!.isEmpty) return 'Name can not is empty';
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2)),
                    labelText: 'Board ID',
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
                child: TextFormField(
                  controller: GPIOnumbereController,
                  // validator: (value) {
                  //   if (value!.isEmpty) return 'Name can not is empty';
                  //   return null;
                  // },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2)),
                    labelText: 'GPIO Number',
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
                child: TextFormField(
                  controller: StateController,
                  // validator: (value) {
                  //   if (value!.isEmpty) return 'Name can not is empty';
                  //   return null;
                  // },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2)),
                    labelText: 'State',
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
                      Map<String, dynamic> data = {
                        "name Room": nameRoomController.text.trim(),
                        'nameDevice': nameDeviceController.text.trim(),
                        'boardID': boardController.text.trim(),
                        'GPIOnumber': GPIOnumbereController.text.trim(),
                        "state": StateController.text.trim(),
                        // 'imageLink': imageFile,
                      };

                      FirebaseFirestore.instance.collection('Room').add(data);
                      nameDeviceController.clear();
                      nameRoomController.clear();
                      boardController.clear();
                      GPIOnumbereController.clear();
                      StateController.clear();
                    },
                    child: const Text(
                      'Save Room',
                      style: TextStyle(fontSize: 18),
                    ),
                  ))
            ],
          ),
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
