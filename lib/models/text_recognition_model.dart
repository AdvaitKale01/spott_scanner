import 'dart:ui';

import 'package:firebase_ml_vision/firebase_ml_vision.dart';

class RecognizedTextModel {
  Rect boundingBox;
  List<Offset> cornerPoints;
  String text;
  List<RecognizedLanguage> languages;

  RecognizedTextModel(
      {this.boundingBox, this.cornerPoints, this.text, this.languages});
}
