import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MyImagePicker extends StatefulWidget {
  const MyImagePicker({super.key});

  @override
  State<MyImagePicker> createState() => _MyImagePickerState();
}

class _MyImagePickerState extends State<MyImagePicker> {
  File? _selectedImage;
  Future _pickImageFromGallery() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnedImage == null) return;
    setState(() {
      _selectedImage = File(returnedImage.path);
    });
  }

  Future _pickImageFromCamera() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnedImage == null) return;
    setState(() {
      _selectedImage = File(returnedImage.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          MaterialButton(
              height: 50,
              minWidth: 200,
              color: Colors.teal,
              child: const Text(
                'Pick Image from Gallery',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              onPressed: () => {_pickImageFromGallery()}),
          SizedBox(
            height: 20,
          ),
          MaterialButton(
              height: 50,
              minWidth: 200,
              color: Colors.red,
              child: const Text(
                'Pick Image from Camera',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              onPressed: () => {_pickImageFromCamera()}),
          SizedBox(height: 20),
          SizedBox(
            height: 300,
            width: 300,
            child: Column(
              children: [
                _selectedImage != null
                    ? Image.file(_selectedImage!)
                    : Center(child: Text('Please select an image')),
              ],
            ),
          )
        ],
      ),
    );
  }
}
