import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hackathon/layouts/main_layout.dart';
import 'package:image_picker/image_picker.dart';

import '../../constants/colors.dart';

class Yaz extends StatefulWidget {
  const Yaz({Key? key}) : super(key: key);

  @override
  _YazState createState() => _YazState();
}

class _YazState extends State<Yaz> {
  bool value = false;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController textController = TextEditingController();
  String? path = '';

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      button: FloatingActionButton(
        onPressed: () async {
          int now = DateTime.now().millisecondsSinceEpoch;
          FirebaseStorage _storage = FirebaseStorage.instance;
          File photo = File(path!);
          //final fileName = basename(photo!.path);
          //final destination = 'files/$fileName';
          try {
            final ref = _storage
                .ref('images/')
                .child(now.toString());
            await ref.putFile(photo).then((p0) {
              _storage.ref('images/').child(now.toString()).getDownloadURL().then((url) {

                FirebaseFirestore.instance.collection('posts').doc().set(
                    {
                      'description':textController.text.toString(),
                      'name': value ? 'Anonim' : nameController.text.toString(),
                      'url': url,
                      'likes': []
                    }
                );
              });
            });
            Navigator.pop(context);
          } catch (e) {
            print('error occured');
          }
        },
        child: Icon(Icons.send,color: AppColors.black,),
        backgroundColor: AppColors.white,
      ),
      content: Column(
        children: [
          Container(
            height: 100.h,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Checkbox(value: value, onChanged: onChanged),
                  Expanded(
                    child: TextFormField(
                      enabled: !value,
                      controller: nameController,
                      style: TextStyle(color: AppColors.light_grey),
                      decoration: InputDecoration(
                        hintText: value? 'Anonim' : 'Isim',
                        labelStyle: TextStyle(color: AppColors.sand),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: AppColors.light_grey,
                            width: 1.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: AppColors.sand,
                            width: 1.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextFormField(
              controller: textController,
              maxLines: 10,
              minLines: 3,
              style: TextStyle(color: AppColors.light_grey),
              decoration: InputDecoration(
                hintText: 'Icinizden geceni yazin',
                labelStyle: TextStyle(color: AppColors.sand),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: AppColors.light_grey,
                    width: 1.0,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: AppColors.sand,
                    width: 1.0,
                  ),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: (){
                    final ImagePicker _picker = ImagePicker();
                    // Pick an image
                    // Capture a photo
                    _picker.pickImage(source: ImageSource.camera).then((value) {
                      path = value?.path;

                      print(value?.path);

                    });
                  },
                  icon: Icon(Icons.camera)
              ),
              SizedBox(width: 30.w,),
              IconButton(
                  onPressed: (){
                    final ImagePicker _picker = ImagePicker();
                    // Pick an image
                    _picker.pickImage(source: ImageSource.gallery).then((value) {
                      path = value?.path;
                      print(value?.path);
                    });
                  },
                  icon: Icon(Icons.folder)
              ),

            ],
          ),
          /*Padding(
            padding: const EdgeInsets.all(20.0),
            child: InkWell(
              onTap: () async {

              },
              child: Container(
                width: 100.w,
                height: 50.h,
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20.0))
                ),
                child: Center(
                  child: Text(
                      'Send'
                  ),
                ),
              ),
            ),
          ),*/
        ],
      ),
    );
  }
  onChanged(_){
    setState(() {
      value = _;
    });
  }
}
