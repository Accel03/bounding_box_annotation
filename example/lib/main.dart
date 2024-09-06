import 'package:bounding_box_annotation/bounding_box_annotation.dart';
import 'package:bounding_box_annotation_example/result.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
        ),
      ),
      home: const Loading(),
    );
  }
}

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  Uint8List? imageBytes;

  void getImageBytes() async {
    final byteData = await rootBundle.load("assets/flutter-logo.png");
    imageBytes = byteData.buffer.asUint8List();

    if (context.mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Annotation(imageBytes: imageBytes!),
        ),
      );
    }
  }

  @override
  void initState() {
    getImageBytes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

class Annotation extends StatefulWidget {
  final Uint8List imageBytes;
  const Annotation({super.key, required this.imageBytes});

  @override
  State<Annotation> createState() => _AnnotationState();
}

class _AnnotationState extends State<Annotation> {
  final AnnotationController annotationController = AnnotationController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "Annotation Demo",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  border: Border.all(
                color: Colors.blue,
                width: 10.0,
              ),),
              child: BoundingBoxAnnotation(
                  controller: annotationController,
                  imageBytes: widget.imageBytes,),
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(120.0, 45.0),
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
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
                                Radius.circular(10.0),
                              ),
                            ),
                            padding: const EdgeInsets.all(30.0),
                            child: const SizedBox(
                              width: 40.0,
                              height: 40.0,
                              child: CircularProgressIndicator(
                                color: Colors.blue,
                                strokeWidth: 6.0,
                              ),
                            ),
                          ),
                        );
                      },
                    );
                    List<AnnotationDetails> annotationList =
                        await annotationController.getData();
                    if (context.mounted) {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              Result(annotationList: annotationList),
                        ),
                      );
                    }
                  },
                  child: const Text(
                    "Save",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(width: 10.0),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(120.0, 45.0),
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  onPressed: () {
                    annotationController.clear();
                  },
                  child: const Text(
                    "Clear",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
