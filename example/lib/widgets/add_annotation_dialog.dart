import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddAnnotationDialog extends StatefulWidget {
  final Function (double x, double y, double width, double height, String label) setValue;
  const AddAnnotationDialog({super.key, required this.setValue});

  @override
  State<AddAnnotationDialog> createState() => _AddAnnotationDialogState();
}

class _AddAnnotationDialogState extends State<AddAnnotationDialog> {
  final _formKey = GlobalKey<FormState>();
  final xController = TextEditingController();
  final yController = TextEditingController();
  final widthController = TextEditingController();
  final heightController = TextEditingController();
  final labelController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 450.0),
        padding: const EdgeInsets.all(30.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Text(
                "Add Annotation",
                style: TextStyle(
                  color: Color(0xFF38424D),
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget> [
                  SizedBox(
                    width: 150.0,
                    child: TextFormField(
                      style: const TextStyle(fontSize: 16.0),
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        hintText: "x",
                        hintStyle: TextStyle(
                          color: Color(0xFFA9A9A9),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0,
                          horizontal: 15.0,
                        ),
                      ),
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter x Value";
                        }
                        return null;
                      },
                      controller: xController,
                    ),
                  ),
                  const SizedBox(width: 20.0),
                  SizedBox(
                    width: 150.0,
                    child: TextFormField(
                      style: const TextStyle(fontSize: 16.0),
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        hintText: "y",
                        hintStyle: TextStyle(
                          color: Color(0xFFA9A9A9),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0,
                          horizontal: 15.0,
                        ),
                      ),
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter y Value";
                        }
                        return null;
                      },
                      controller: yController,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              TextFormField(
                style: const TextStyle(fontSize: 16.0),
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  hintText: "Width",
                  hintStyle: TextStyle(
                    color: Color(0xFFA9A9A9),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 15.0,
                  ),
                ),
                inputFormatters: [
                  LengthLimitingTextInputFormatter(3),
                  FilteringTextInputFormatter.digitsOnly
                ],
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Enter Annotation Width";
                  } else if (value == "0"){
                    return "Value must be greater than 0";
                  }
                  return null;
                },
                controller: widthController,
              ),
              const SizedBox(height: 20.0),
              TextFormField(
                style: const TextStyle(fontSize: 16.0),
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  hintText: "Height",
                  hintStyle: TextStyle(
                    color: Color(0xFFA9A9A9),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 15.0,
                  ),
                ),
                inputFormatters: [
                  LengthLimitingTextInputFormatter(3),
                  FilteringTextInputFormatter.digitsOnly
                ],
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Enter Annotation Height";
                  } else if (value == "0"){
                    return "Value must be greater than 0";
                  }
                  return null;
                },
                controller: heightController,
              ),
              const SizedBox(height: 20.0),
              TextFormField(
                style: const TextStyle(fontSize: 16.0),
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  hintText: "Label",
                  hintStyle: TextStyle(
                    color: Color(0xFFA9A9A9),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 15.0,
                  ),
                ),
                inputFormatters: [LengthLimitingTextInputFormatter(15)],
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Enter Annotation Label";
                  }
                  return null;
                },
                controller: labelController,
              ),
              const SizedBox(height: 30.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 5.0,
                      ),
                      child: Text(
                        "Cancel",
                        style: TextStyle(
                          color: Color(0xFF747E88),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        widget.setValue(
                          double.parse(xController.text),
                          double.parse(xController.text),
                          double.parse(widthController.text),
                          double.parse(heightController.text),
                          labelController.text
                        );
                        Navigator.of(context).pop(true);
                      }
                    },
                    child: const Text(
                      "Confirm",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}