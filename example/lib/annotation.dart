import 'dart:io';

import 'package:bounding_box_annotation/bounding_box_annotation.dart';
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
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            BoundingBoxAnnotation(
              controller: annotationController,
              imageFile: widget.imageFile
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [
                ElevatedButton(
                  onPressed: () async {
                    List<AnnotationDetails> annotationList = await annotationController.getData();
                    for (int i = 0; i < annotationList.length; i++) {
                      print(annotationList[i].label);
                      print(annotationList[i].p1);
                      print(annotationList[i].p2);
                      print(annotationList[i].p3);
                      print(annotationList[i].p4);
                    }
                  },
                  child: const Text("Save")
                ),
                const SizedBox(width: 10.0),
                ElevatedButton(
                  onPressed: () async {
                    final jsonList = await annotationController.getJsonData();
                    print(jsonList);
                  },
                  child: const Text("JSON")
                ),
                const SizedBox(width: 10.0),
                ElevatedButton(
                  onPressed: () {
                    annotationController.clear();
                  },
                  child: const Text("Clear")
                )
              ]
            )
          ],
        )
      )
    );
  }
}