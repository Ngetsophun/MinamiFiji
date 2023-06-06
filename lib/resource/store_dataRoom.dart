import 'dart:io';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

final FirebaseStorage _storage = FirebaseStorage.instance;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;
Future<String> uploadImageToStorage(String name, File imageFile) async {
  Reference ref = _storage.ref().child(name);
  UploadTask uploadTask = ref.putData(imageFile as Uint8List);
  TaskSnapshot snapshot = await uploadTask;
  String downloadUrl = await snapshot.ref.getDownloadURL();
  return downloadUrl;
}

Future<String> saveDataRoom({required String name, required File file}) async {
  String resp = 'Some Error Occurred';

  try {
    if (name.isNotEmpty) {
      String imageUrl = await uploadImageToStorage('Room', file);
      await _firestore
          .collection('RoomDevice')
          .add({'name': name, 'imageLink': imageUrl});

      resp = 'success';
    }
  } catch (err) {
    resp = err.toString();
  }
  return resp;
}
