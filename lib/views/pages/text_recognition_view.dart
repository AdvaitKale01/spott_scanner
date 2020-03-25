import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_lens_clone/viewmodels/text_recognition_viewmodel.dart';
import 'package:google_lens_clone/views/core/base_view.dart';
import 'package:google_lens_clone/views/widgets/lens_appbar.dart';
import 'package:google_lens_clone/views/widgets/rubberbottomsheet_text_recognition.dart';

class TextRecognitionView extends StatefulWidget {
  final String imagePath;
  final bool islandscape;
  final List<String> objects;
  final String recognizedText;
  final Rect box;
  final List<Offset> cornerPoints;

  TextRecognitionView({
    this.imagePath,
    this.islandscape,
    this.objects,
    this.recognizedText,
    this.box,
    this.cornerPoints,
  });

  @override
  _TextRecognitionViewState createState() =>
      _TextRecognitionViewState(recognizedText);
}

class _TextRecognitionViewState extends State<TextRecognitionView> {
  bool hide = false; // hide the widget on top of bottom sheet once reach top
  String recognizedText;
  List<String> recognizedTextList = [];
  _TextRecognitionViewState(this.recognizedText);

  @override
  void initState() {
    print(recognizedText.split('\n'));
    recognizedTextList = recognizedText.split('\n');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<TextRecognitionViewModel>(
        onModelReady: (model) => model.getDefaultData(recognizedTextList),
        builder: (context, model, child) => Scaffold(
              body: SafeArea(
                child: Stack(
                  children: <Widget>[
                    RotatedBox(
                      quarterTurns: widget.islandscape ? -1 : 0,
                      child: Image.file(File(widget.imagePath),
                          fit: BoxFit.fill,
                          height: double.infinity,
                          width: double.infinity),
                    ),
//                    CustomPaint(
//                      painter: TextRecognitionPainter(
//                          box: widget.box, cornerPoints: widget.cornerPoints),
//                      willChange: false,
//                    ),
                    RubberBottomSheetTextRecognitionWidget(
                      listOfRecognizedText: model.list_texttilemodel,
                    ),
//								SelectableText('${widget.recognizedText}'),

                    LensAppBar(false, onpop, null),
                  ],
                ),
              ),
            ));
  }

  void onpop(bool page) {
    Navigator.pop(context);
  }
}
