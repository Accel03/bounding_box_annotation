import 'dart:typed_data';

import 'package:bounding_box_annotation/src/annotation_controller.dart';
import 'package:bounding_box_annotation/src/models/label.dart';
import 'package:bounding_box_annotation/src/widgets/label_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_drawing_board/flutter_drawing_board.dart';
import 'package:flutter_drawing_board/paint_contents.dart';

/// Bounding Box Annotation Canvas Widget
class BoundingBoxAnnotation extends StatefulWidget {
  final AnnotationController controller;
  final Uint8List imageBytes;
  final Color? color;
  final double? strokeWidth;
  const BoundingBoxAnnotation(
      {super.key,
      required this.controller,
      required this.imageBytes,
      this.color,
      this.strokeWidth,});

  @override
  State<BoundingBoxAnnotation> createState() => _BoundingBoxAnnotationState();
}

class _BoundingBoxAnnotationState extends State<BoundingBoxAnnotation> {
  DrawingController drawingController = DrawingController();
  List<List<Offset>> offsetLists = [];
  List<Label> labelList = [];
  List<PaintContent> history = [];

  /// Get rectangle vertices offset
  Future<List<Offset>> getAnnotationOffset() async {
    List<Map<String, dynamic>> jsonList = drawingController.getJsonList();

    Offset p1 = Offset(
      jsonList.last["startPoint"]["dx"],
      jsonList.last["startPoint"]["dy"],
    );
    Offset p2 = Offset(
      jsonList.last["endPoint"]["dx"],
      jsonList.last["startPoint"]["dy"],
    );
    Offset p3 = Offset(
      jsonList.last["endPoint"]["dx"],
      jsonList.last["endPoint"]["dy"],
    );
    Offset p4 = Offset(
      jsonList.last["startPoint"]["dx"],
      jsonList.last["endPoint"]["dy"],
    );

    Offset? temp1;
    Offset? temp2;

    if (p1.dx > p2.dx && p1.dy < p3.dy) {
      temp1 = p1;
      temp2 = p3;

      p1 = p2;
      p2 = temp1;
      p3 = p4;
      p4 = temp2;
    } else if (p1.dx < p2.dx && p1.dy > p3.dy) {
      temp1 = p1;
      temp2 = p2;

      p1 = p4;
      p2 = p3;
      p3 = temp2;
      p4 = temp1;
    } else if (p1.dx > p2.dx && p1.dy > p3.dy) {
      temp1 = p1;
      temp2 = p2;

      p1 = p3;
      p2 = p4;
      p3 = temp1;
      p4 = temp2;
    }

    return [
      Offset(p1.dx, p1.dy),
      Offset(p2.dx, p2.dy),
      Offset(p3.dx, p3.dy),
      Offset(p4.dx, p4.dy),
    ];
  }

  @override
  void initState() {
    widget.controller.imageBytes = widget.imageBytes;
    drawingController = widget.controller.drawingController;
    offsetLists = widget.controller.offsetLists;
    labelList = widget.controller.labelList;
    history = drawingController.getHistory;
    widget.controller.addListener(() {
      setState(() {});
    });
    drawingController.setPaintContent(Rectangle());
    if (widget.color != null) {
      drawingController.setStyle(color: widget.color);
    }
    if (widget.strokeWidth != null) {
      drawingController.setStyle(strokeWidth: widget.strokeWidth);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 400.0, maxHeight: 400.0),
          child: Center(
            child: Stack(
              children: [
                DrawingBoard(
                  boardPanEnabled: false,
                  boardScaleEnabled: false,
                  controller: drawingController,
                  background: SizedBox(
                    width: 400.0,
                    height: 400.0,
                    child: FittedBox(
                      fit: BoxFit.fill,
                      child: Image.memory(widget.imageBytes),
                    ),
                  ),
                  onPointerUp: (e) async {
                    List<Offset> offsetList = await getAnnotationOffset();
                    if (offsetList[0] != offsetList[2]) {
                      if (context.mounted) {
                        await showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (context) {
                            return const AnnotationLabelDialog(
                              header: "Add",
                              text: "",
                            );
                          },
                        ).then((value) async {
                          if (value != null) {
                            setState(() {
                              offsetLists.add(offsetList);
                              labelList.add(Label(
                                  text: value.toString(),
                                  offset: offsetList[0],),);
                            });
                          } else {
                            drawingController.undo();
                            setState(() {
                              history.removeLast();
                            });
                          }
                        });
                      }
                    }
                  },
                ),
                for (int i = 0; i < labelList.length; i++) ...[
                  Positioned(
                    left: labelList[i].offset.dx,
                    top: labelList[i].offset.dy,
                    child: InkWell(
                      onTap: () async {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AnnotationLabelDialog(
                              header: "Edit",
                              text: labelList[i].text,
                            );
                          },
                        ).then((value) async {
                          if (value != null) {
                            setState(() {
                              widget.controller.labelList[i].text =
                                  value.toString();
                            });
                          }
                        });
                      },
                      child: Container(
                        color: widget.color ?? Colors.red,
                        padding: const EdgeInsets.symmetric(
                          vertical: 5.0,
                          horizontal: 10.0,
                        ),
                        child: Text(
                          labelList[i].text,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: offsetLists[i][1].dx - 20,
                    top: offsetLists[i][1].dy - 20,
                    child: InkWell(
                      onTap: () async {
                        setState(() {
                          history.removeAt(i);
                          labelList.removeAt(i);
                          offsetLists.removeAt(i);
                        });
                        List<Map<String, dynamic>> jsonList =
                            drawingController.getJsonList();
                        drawingController.clear();
                        for (int i = 0; i < jsonList.length; i++) {
                          drawingController.addContents(
                              <PaintContent>[Rectangle.fromJson(jsonList[i])],);
                        }
                      },
                      child: Container(
                          decoration: BoxDecoration(
                              color: widget.color ?? Colors.red,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5.0)),),
                          padding: const EdgeInsets.all(8.0),
                          child: const Icon(
                            Icons.delete_rounded,
                            color: Colors.white,
                            size: 18.0,
                          ),),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ],
    );
  }
}
