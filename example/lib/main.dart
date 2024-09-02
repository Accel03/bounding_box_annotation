import 'dart:io';

import 'package:bounding_box_annotation_example/annotation.dart';
import 'package:bounding_box_annotation_example/image_picker_dialog.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.blue,
      )),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  File? imageFile;
  bool isEmpty = true;

  void cropImage(File imageFile) async {
    final croppedImage = await ImageCropper().cropImage(
      sourcePath: imageFile.path,
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Crop Image',
            toolbarColor: Colors.blue,
            toolbarWidgetColor: Colors.white,
            aspectRatioPresets: [CropAspectRatioPreset.square],
            initAspectRatio: CropAspectRatioPreset.square,
            lockAspectRatio: true),
        IOSUiSettings(
          title: 'Crop Image',
          aspectRatioPresets: [CropAspectRatioPreset.original],
        ),
      ],
    );

    if (croppedImage == null) {
      return;
    } else {
      imageCache.clear();
      setState(() {
        this.imageFile = File(croppedImage.path);
        isEmpty = false;
      });
    }
  }

  void getImage(ImageSource imageSource) async {
    try {
      final imageXFile = await ImagePicker().pickImage(source: imageSource);

      if (imageXFile == null) {
        return;
      } else {
        cropImage(File(imageXFile.path));
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Annotation Demo",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
            imageFile == null
                ? DottedBorder(
                    color: Colors.grey,
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(10.0),
                    dashPattern: const <double>[6, 4],
                    strokeWidth: 2,
                    strokeCap: StrokeCap.round,
                    child: InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return ImagePickerDialog(getImage: getImage);
                            });
                      },
                      child: const SizedBox(
                          width: 300.0,
                          height: 300.0,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Icon(Icons.add_photo_alternate_outlined,
                                    color: Colors.grey, size: 60.0),
                                SizedBox(height: 10.0),
                                Text("Add Image",
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 18.0))
                              ],
                            ),
                          )),
                    ))
                : SizedBox(
                    width: 300.0,
                    height: 300.0,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Stack(
                          children: <Widget>[
                            Image.file(imageFile!, height: 300.0, width: 300.0),
                            Align(
                              alignment: Alignment.topRight,
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    imageFile = null;
                                    isEmpty = true;
                                  });
                                },
                                child: Container(
                                  decoration: const BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5.0))),
                                  padding: const EdgeInsets.all(5.0),
                                  margin: const EdgeInsets.all(15.0),
                                  child: const Icon(
                                    Icons.delete_rounded,
                                    color: Colors.white,
                                    size: 35.0,
                                  ),
                                ),
                              ),
                            )
                          ],
                        )),
                  ),
            const SizedBox(height: 40.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(120.0, 45.0),
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        disabledBackgroundColor: Colors.blue.withOpacity(0.5),
                        disabledForegroundColor: Colors.white),
                    onPressed: isEmpty
                        ? null
                        : () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        Annotation(imageFile: imageFile!)));
                          },
                    child: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.draw_rounded, size: 30.0),
                          SizedBox(width: 10.0),
                          Text("Annotate",
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.w600))
                        ],
                      ),
                    ))
              ],
            ),
          ])),
    );
  }
}
