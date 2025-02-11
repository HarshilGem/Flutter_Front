// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// ignore_for_file: public_member_api_docs

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:path_provider/path_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

import 'ImageFromGalleryEx.dart';


enum ImageSourceType { gallery, camera }

class HomePage2 extends StatefulWidget {
  @override
  State<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  void _handleURLButtonPress(BuildContext context, var type) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => ImageFromGalleryEx(type)));
  }
  String? id;
  Uint8List? _imageFile;
  String? _imageUrl;
  bool _uploading = false;

  var _image;
  var imagePicker;
  var type;



  Future<void> pickImage() async {
    final picker = ImagePicker();
    try {
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        if (kIsWeb) {
          final bytes = await pickedFile.readAsBytes();
          setState(() {
            _imageFile = bytes;

          });

        } else {
          Uint8List  bytes = await pickedFile.readAsBytes();
          String bs4str = base64.encode(bytes);
          // Uint8List decodedbytes = base64.decode(bs4str);
          // File decodedimgfile = await File("test.jpg").writeAsBytes(decodedbytes);
          // String decodedpath = decodedimgfile.path;
          //
          // setState(() {
          //   _imageFile = bytes;
          //
          // });
          // print("-----------------------");

          print(pickedFile.path);
         File newimage =  await File(pickedFile.path).copy("C:/Users/ADMIN/StudioProjects/test_logo/assets/");




          // print(bs4str);

        }
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Image Picker Example"),
        ),
        body: Center(
          child: Column(
            children: [
              MaterialButton(
                color: Colors.blue,
                child: Text(
                  "Pick Image from Gallery",
                  style: TextStyle(
                      color: Colors.white70, fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  pickImage();
                },
              ),
              // MaterialButton(
              //   color: Colors.blue,
              //   child: Text(
              //     "Pick Image from Camera",
              //     style: TextStyle(
              //         color: Colors.white70, fontWeight: FontWeight.bold),
              //   ),
              //   onPressed: () {
              //     _handleURLButtonPress(context, ImageSourceType.camera);
              //   },
              // ),
            ],
          ),
        ));
  }
}