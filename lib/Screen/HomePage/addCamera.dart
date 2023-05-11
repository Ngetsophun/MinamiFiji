import 'dart:io';

import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';

class MyImageWidget extends StatefulWidget {
  const MyImageWidget({super.key});

  @override
  State<MyImageWidget> createState() => _MyImageWidgetState();
}

class _MyImageWidgetState extends State<MyImageWidget> {
  File? _imageFile;

  Future<void> _pickImage(ImageSource source) async {
    final image = await openImagePicker(source);

    setState(() {
      _imageFile = image;
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
        title: Text('Image Picker Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 80,
              backgroundImage:
                _imageFile != null ? FileImage(_imageFile!) : null,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _pickImage(ImageSource.gallery),
              child: Text('Select Image from Gallery'),
            ),
            ElevatedButton(
              onPressed: () => _pickImage(ImageSource.camera),
              child: Text('Take Image from Camera'),
            ),
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
}
