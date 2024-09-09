import 'package:bounding_box_annotation/bounding_box_annotation.dart';
import 'package:flutter/material.dart';

class Result extends StatefulWidget {
  final List<AnnotationDetails> annotationList;
  const Result({super.key, required this.annotationList});

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "Annotation Result",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Container(
        margin: const EdgeInsets.all(20.0),
        child: ListView.builder(
          itemCount: widget.annotationList.length,
          itemBuilder: (context, index) {
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.blue,
                          width: 5.0,
                        ),
                      ),
                      width: 200.0,
                      height: 200.0,
                      child: Image.memory(widget.annotationList[index].image),
                    ),
                    const SizedBox(width: 20.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.annotationList[index].label,
                          style: const TextStyle(
                            color: Colors.blue,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        Text(
                          "P1 (${((widget.annotationList[index].p1.dx).round()).toString()}, ${((widget.annotationList[index].p1.dy).round()).toString()})",
                        ),
                        const SizedBox(height: 10.0),
                        Text(
                          "P2 (${((widget.annotationList[index].p2.dx).round()).toString()}, ${((widget.annotationList[index].p2.dy).round()).toString()})",
                        ),
                        const SizedBox(height: 10.0),
                        Text(
                          "P3 (${((widget.annotationList[index].p3.dx).round()).toString()}, ${((widget.annotationList[index].p3.dy).round()).toString()})",
                        ),
                        const SizedBox(height: 10.0),
                        Text(
                          "P4 (${((widget.annotationList[index].p4.dx).round()).toString()}, ${((widget.annotationList[index].p4.dy).round()).toString()})",
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
