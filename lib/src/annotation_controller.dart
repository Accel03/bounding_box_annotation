import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:bounding_box_annotation/src/models/annotation_details.dart';
import 'package:bounding_box_annotation/src/models/drawing.dart';
import 'package:bounding_box_annotation/src/models/label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_drawing_board/flutter_drawing_board.dart';
import 'package:image/image.dart' as img;

/// Annotation Canvas Controller
class AnnotationController extends ChangeNotifier {
  /// Base image bytes
  Uint8List? imageBytes;

  /// `flutter_drawing_board` controller
  final DrawingController drawingController = DrawingController();

  /// List of rectangle vertices offset
  List<List<Offset>> offsetLists = [];

  /// List of annotation labels
  List<Label> labelList = [];

  /// Get list of all created bounding box annotation(s).
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
        targetHeight: image.height,
        targetWidth: image.width,
      );

      ui.FrameInfo fi = await codec.getNextFrame();
      ui.Image uiImage = fi.image;

      return uiImage;
    }

    /// Convert a Dart Image Library Image to a Flutter UI Image.
    Future<Uint8List> convertImagetoBytes(ui.Image uiImage) async {
      final byteData = await uiImage.toByteData(format: ui.ImageByteFormat.png);
      final bytes = byteData!.buffer.asUint8List();
      return bytes;
    }

    /// Convert a Flutter UI Image to a Uint8List.
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

      final img.Image? decodedImage = img.decodeImage(imageBytes!);
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

        final img.Image croppedImage = img.copyCrop(
          resizedImage,
          x: (p1.dx).round(),
          y: (p1.dy).round(),
          width: ((p3.dx - p1.dx).abs()).round(),
          height: ((p3.dy - p1.dy).abs()).round(),
        );

        final img.Image resizedCroppedImage = img.copyResize(
          croppedImage,
          width: 400,
          height: 400,
          maintainAspect: true,
        );
        ui.Image uiImage = await convertImageToFlutterUi(resizedCroppedImage);
        Uint8List image =
            await Future.delayed(const Duration(milliseconds: 250), () async {
          return convertImagetoBytes(uiImage);
        });

        annotationList.add(
          AnnotationDetails(
            p1: p1,
            p2: p2,
            p3: p3,
            p4: p4,
            label: drawingList[i].label,
            image: image,
          ),
        );
      }

      return annotationList;
    }

    List<AnnotationDetails> annotationList = await getAnnotationDetails();

    return annotationList;
  }

  /// Remove all annotation(s) inside the canvas
  void clear() {
    drawingController.clear();
    offsetLists.clear();
    labelList.clear();
    notifyListeners();
  }
}
