import 'dart:io';
import 'dart:ui' as ui;

import 'package:bounding_box_annotation/src/models/annotation_details.dart';
import 'package:bounding_box_annotation/src/models/drawing.dart';
import 'package:bounding_box_annotation/src/models/label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_drawing_board/flutter_drawing_board.dart';
import 'package:image/image.dart' as img;
import 'package:path_provider/path_provider.dart';

// Annotation Canvas Controller
class AnnotationController extends ChangeNotifier {
  File? imageFile;
  final drawingController = DrawingController();
  List<List<Offset>> offsetLists = [];
  List<Label> labelList = [];

  // Get list of all created bounding box annotation(s).
  Future<List<AnnotationDetails>> getData() async {
    Future<ui.Image> convertImageToFlutterUi(img.Image image) async {
      if (image.format != img.Format.uint8 || image.numChannels != 4) {
        final cmd = img.Command()
          ..image(image)
          ..convert(format: img.Format.uint8, numChannels: 4);
        final rgba8 = await cmd.getImageThread();
        if (rgba8 != null) {
          image = rgba8;
        }
      }

      ui.ImmutableBuffer buffer =
          await ui.ImmutableBuffer.fromUint8List(image.toUint8List());

      ui.ImageDescriptor id = ui.ImageDescriptor.raw(buffer,
          height: image.height,
          width: image.width,
          pixelFormat: ui.PixelFormat.rgba8888);

      ui.Codec codec = await id.instantiateCodec(
          targetHeight: image.height, targetWidth: image.width);

      ui.FrameInfo fi = await codec.getNextFrame();
      ui.Image uiImage = fi.image;

      return uiImage;
    }

    // Convert a Dart Image Library Image to a Flutter UI Image.
    Future<File> convertImagetoFile(ui.Image uiImage, int i) async {
      final byteData = await uiImage.toByteData(format: ui.ImageByteFormat.png);
      final bytes = byteData!.buffer.asUint8List();
      final directory = await getTemporaryDirectory();
      DateTime currentTime = DateTime.now();
      String fileName =
          "annotation_${currentTime.year}${currentTime.month}${currentTime.day}_${currentTime.hour}${currentTime.minute}${currentTime.second}${currentTime.millisecond}";
      File file = await File("${directory.path}/$fileName.png").create();
      await file.writeAsBytes(bytes);
      return file;
    }

    // Convert a Flutter UI Image to a File.
    Future<List<AnnotationDetails>> getAnnotationDetails() async {
      List<Map<String, dynamic>> jsonList = drawingController.getJsonList();
      for (int i = 0; i < jsonList.length; i++) {
        jsonList[i]["startPoint"]["dx"] = offsetLists[i][0].dx;
        jsonList[i]["startPoint"]["dy"] = offsetLists[i][0].dy;
        jsonList[i]["endPoint"]["dx"] = offsetLists[i][2].dx;
        jsonList[i]["endPoint"]["dy"] = offsetLists[i][2].dy;
        Map<String, dynamic> map = {"label": labelList[i].text};
        jsonList[i].addEntries(map.entries);
      }

      List<Drawing> drawingList =
          jsonList.map((e) => Drawing.fromJson(e)).toList();
      List<AnnotationDetails> annotationList = [];

      final bytes = await imageFile!.readAsBytes();
      final img.Image? decodedImage = img.decodeImage(bytes);
      final img.Image resizedImage =
          img.copyResize(decodedImage!, width: 400, height: 400);

      for (int i = 0; i < drawingList.length; i++) {
        Offset p1 =
            Offset(drawingList[i].startPoint.dx, drawingList[i].startPoint.dy);
        Offset p2 =
            Offset(drawingList[i].endPoint.dx, drawingList[i].startPoint.dy);
        Offset p3 =
            Offset(drawingList[i].endPoint.dx, drawingList[i].endPoint.dy);
        Offset p4 =
            Offset(drawingList[i].startPoint.dx, drawingList[i].endPoint.dy);

        final img.Image croppedImage = img.copyCrop(resizedImage,
            x: (p1.dx).round(),
            y: (p1.dy).round(),
            width: ((p3.dx - p1.dx).abs()).round(),
            height: ((p3.dy - p1.dy).abs()).round());

        final img.Image resizedCroppedImage = img.copyResize(croppedImage,
            width: 400, height: 400, maintainAspect: true);
        ui.Image uiImage = await convertImageToFlutterUi(resizedCroppedImage);
        File imageFile =
            await Future.delayed(const Duration(milliseconds: 250), () async {
          return convertImagetoFile(uiImage, i);
        });

        annotationList.add(AnnotationDetails(
            p1: p1,
            p2: p2,
            p3: p3,
            p4: p4,
            label: drawingList[i].label,
            imageFile: imageFile));
      }

      return annotationList;
    }

    List<AnnotationDetails> annotationList = await getAnnotationDetails();

    return annotationList;
  }

  // Remove all annotation(s) inside the canvas
  void clear() {
    drawingController.clear();
    offsetLists.clear();
    labelList.clear();
    notifyListeners();
  }
}
