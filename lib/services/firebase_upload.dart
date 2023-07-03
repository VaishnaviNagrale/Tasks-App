import 'dart:convert';
import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

final FirebaseStorageService storageService = FirebaseStorageService();

void uploadFilesToFirebaseStorage(BuildContext context) async {
  // Read the files
  String tasksBlocContent = await DefaultAssetBundle.of(context).loadString('lib/blocx/test_bloc/tasks_bloc.dart');
  String tasksEventContent = await DefaultAssetBundle.of(context).loadString('lib/blocx/test_bloc/tasks_event.dart');
  String tasksStateContent = await DefaultAssetBundle.of(context).loadString('lib/blocx/test_bloc/tasks_state.dart');

  // Upload tasks_bloc.dart
  String? tasksBlocURL = await storageService.uploadFile(
    'tasks_bloc.dart',
    Uint8List.fromList(utf8.encode(tasksBlocContent)),
  );

  // Upload tasks_event.dart
  String? tasksEventURL = await storageService.uploadFile(
    'tasks_event.dart',
    Uint8List.fromList(utf8.encode(tasksEventContent)),
  );

  // Upload tasks_state.dart
  String? tasksStateURL = await storageService.uploadFile(
    'tasks_state.dart',
    Uint8List.fromList(utf8.encode(tasksStateContent)),
  );

  // Print the download URLs
  // print('tasks_bloc.dart URL: $tasksBlocURL');
  // print('tasks_event.dart URL: $tasksEventURL');
  // print('tasks_state.dart URL: $tasksStateURL');
}

class FirebaseStorageService {
  FirebaseStorage _storage = FirebaseStorage.instance;

  Future<String?> uploadFile(String fileName, Uint8List fileData) async {
    try {
      Reference ref = _storage.ref().child(fileName);
      UploadTask uploadTask = ref.putData(fileData);
      TaskSnapshot snapshot = await uploadTask;
      String downloadURL = await snapshot.ref.getDownloadURL();
      return downloadURL;
    } catch (e) {
     // print('Error uploading file: $e');
      return null;
    }
  }
}
