import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_lens_clone/viewmodels/text_translation_viewmodel.dart';
import 'package:google_lens_clone/views/core/base_view.dart';
import 'package:google_lens_clone/views/widgets/lens_appbar.dart';
import 'package:google_lens_clone/views/widgets/rubberbottomsheet_text_translation.dart';

class TextTranslationView extends StatefulWidget {
  final String imagePath;
  final bool islandscape;
  final String recognizedText;

  TextTranslationView({
    this.imagePath,
    this.islandscape,
    this.recognizedText,
  });

  @override
  _TextTranslationViewState createState() =>
      _TextTranslationViewState(recognizedText);
}

class _TextTranslationViewState extends State<TextTranslationView> {
  bool hide = false; // hide the widget on top of bottom sheet once reach top
  String recognizedText;
  List<String> recognizedTextList = [];
  _TextTranslationViewState(this.recognizedText);
  String initialSentence = '';

  @override
  void initState() {
    recognizedTextList = recognizedText.split('\n');

    for (String word in recognizedTextList) {
      initialSentence = initialSentence + '. ' + word;
    }
    initialSentence = initialSentence.substring(2);
    print(initialSentence);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<TextTranslationViewModel>(
        onModelReady: (model) => model.getDefaultData(initialSentence),
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
                    RubberBottomSheetTextTranslationWidget(
                      sentence: model.list_texttilemodel,
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
