//Here write Image Searching Algorithm
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_lens_clone/viewmodels/search_image_viewmodel.dart';
//import 'package:google_lens_clone/models/recognized_text_tile_model.dart';
import 'package:google_lens_clone/viewmodels/text_recognition_viewmodel.dart';
import 'package:google_lens_clone/views/core/base_view.dart';
import 'package:google_lens_clone/views/widgets/lens_appbar.dart';
import 'package:google_lens_clone/views/widgets/rubberbottomsheet_text_recognition.dart';
import 'package:google_lens_clone/views/widgets/rubberbottomsheet_widget.dart';

class TextRecognitionView extends StatefulWidget {
	
	final String imagePath;
	final bool islandscape;
	final List<String> objects;
	final String recognizedText;
	
	TextRecognitionView({this.imagePath, this.islandscape, this.objects, this.recognizedText});
	
	@override
	_TextRecognitionViewState createState() => _TextRecognitionViewState();
}

class _TextRecognitionViewState extends State<TextRecognitionView> {
	
	bool hide = false; // hide the widget on top of bottom sheet once reach top
	
	
	@override
	void initState() {
//		print('tr view init ${widget.recognizedText.blocks}');
		super.initState();
	}
	
	@override
	Widget build(BuildContext context) {
		return BaseView<TextRecognitionViewModel>(
			onModelReady: (model) => model.getDefaultData(widget.recognizedText),
			builder: (context, model, child) =>
				Scaffold(
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
								RubberBottomSheetTextRecognitionWidget(
									initialvalue: 1.0,
									listOfRecognizedText: model
										.list_texttilemodel,),
//								SelectableText('${widget.recognizedText}'),
								LensAppBar(false, onpop, null)
							
							],
						),
					),
				));
	}
	
	void onpop(bool page) {
		Navigator.pop(context);
	}
}