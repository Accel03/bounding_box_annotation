import 'dart:io';

import 'package:bounding_box_annotation/bounding_box_annotation.dart';
import 'package:bounding_box_annotation_example/result.dart';
import 'package:flutter/material.dart';

class Annotation extends StatefulWidget {
  final File imageFile;
  const Annotation({super.key, required this.imageFile});

  @override
  State<Annotation> createState() => _AnnotationState();
}

class _AnnotationState extends State<Annotation> {
  final annotationController = AnnotationController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text("Annotate Image",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BoundingBoxAnnotation(
                controller: annotationController, imageFile: widget.imageFile),
            const SizedBox(height: 20.0),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(120.0, 45.0),
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                  ),
                  onPressed: () async {
                    showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) {
                          return Center(
                              child: Container(
                                  decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0))),
                                  padding: const EdgeInsets.all(30.0),
                                  child: const SizedBox(
                                    width: 40.0,
                                    height: 40.0,
                                    child: CircularProgressIndicator(
                                        color: Colors.blue, strokeWidth: 6.0),
                                  )));
                        });
                    List<AnnotationDetails> annotationList =
                        await annotationController.getData();
                    if (context.mounted) {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Result(annotationList: annotationList)));
                    }
                  },
                  child: const Text("Save",
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.w600))),
              const SizedBox(width: 10.0),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(120.0, 45.0),
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                  ),
                  onPressed: () {
                    annotationController.clear();
                  },
                  child: const Text("Clear",
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.w600)))
            ])
          ],
        )));
  }
}
