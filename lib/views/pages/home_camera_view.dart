import 'dart:io';

import 'package:camera/camera.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/material.dart';
import 'package:google_lens_clone/models/carousal_item_model.dart';
import 'package:google_lens_clone/services/imagepicker_services.dart';
import 'package:google_lens_clone/viewmodels/home_camera_viewmodel.dart';
import 'package:google_lens_clone/views/core/base_view.dart';
import 'package:google_lens_clone/views/pages/search_image_view.dart';
import 'package:google_lens_clone/views/pages/selected_image_view.dart';
import 'package:google_lens_clone/views/widgets/carousal_slider_widget.dart';
import 'package:google_lens_clone/views/widgets/lens_appbar.dart';
import 'package:page_transition/page_transition.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class HomeCameraView extends StatefulWidget {
	@override
	_HomeCameraViewState createState() => _HomeCameraViewState();
}

class _HomeCameraViewState extends State<HomeCameraView>
	with SingleTickerProviderStateMixin {
	CameraController cameracontroller;
	List cameras;
	bool fileSelected = false;
	int selectedCameraIdx = 0;
	File _image;
	String imagePath;
	static int maincameraindex = 0; //back camera
	BuildContext _context;
	
	Future _initializeCamera() {
		availableCameras().then((availableCameras) {
			cameras = availableCameras;
			if (cameras.length > 0) {
				setState(() {
					selectedCameraIdx = 0;
				});
				_initCameraController(cameras[selectedCameraIdx]).then((
					void v) {
					
				});
			} else {
				print("No camera available");
			}
		}).catchError((err) {
			print('Camera Error: $err.code\nError Message: $err.message');
		});

//		Initiliaze camera controller
//		 _initCameraController(cameras[maincameraindex]).then((void v) {});
	}
	
	@override
	void initState() {
		_initializeCamera();
		super.initState();
	}
	
	Future _initCameraController(CameraDescription cameraDescription) async {
		if (cameracontroller != null) {
			await cameracontroller.dispose();
		}
		
		cameracontroller =
			CameraController(cameraDescription, ResolutionPreset.ultraHigh,
				enableAudio: false);
		
		// If the controller is updated then update the UI.
		cameracontroller.addListener(() {
			if (mounted) {
				setState(() {});
			}
			
			if (cameracontroller.value.hasError) {
				print(
					'Camera error ${cameracontroller.value.errorDescription}');
			}
		});
		
		try {
			await cameracontroller.initialize();
		} on CameraException catch (e) {
			// _showCameraException(e);
		}
		
		if (mounted) {
			setState(() {
				print('camera mounted');
			});
		}
	}
	
	final List<CarousalItemModel> _carousallist = [
		CarousalItemModel(Icons.translate, "Translate"),
		CarousalItemModel(Icons.search, "Search"),
		CarousalItemModel(Icons.library_books, "Text Recognition"),
//		CarousalItemModel(Icons.fastfood,"Dining"),
	];
	
	Future<String> _recognizeTextFromImage(decodedImage) async {
		final FirebaseVisionImage visionImage = FirebaseVisionImage.fromFilePath(decodedImage);
		final TextRecognizer textRecognizer = FirebaseVision.instance
			.textRecognizer();
		final VisionText visionText = await textRecognizer.processImage(
			visionImage);
		String text = visionText.text;
		for (TextBlock block in visionText.blocks) {
			final Rect boundingBox = block.boundingBox;
			final List<Offset> cornerPoints = block.cornerPoints;
			final String text = block.text;
			final List<RecognizedLanguage> languages = block
				.recognizedLanguages;
			
//			for (TextLine line in block.lines) {
//				// Same getters as TextBlock
//				for (TextElement element in line.elements) {
//					// Same getters as TextBlock
//
//				}
//			}
		}
		return(text);
	}
	
	@override
	Widget build(BuildContext context) {
		//temporart solution
		_context = context;
		return BaseView<HomeCameraViewModel>(
			onModelReady: (model) => model.getDefaultData(),
			builder: (context, model, child) =>
				Scaffold(
					backgroundColor: Colors.black,
					body: Stack(
						children: <Widget>[
							(cameras != null)
								? CameraPreview(cameracontroller)
								: Container(),
//						Positioned.fill(child :LensParticles(20)),
							CustomCarousalSlider(_carousallist, selectedpage),
							Align(
								alignment: Alignment.topCenter,
								child: LensAppBar(true, null, OpenGallery),
							),
						],
					),
				));
	}
	
	void selectedpage(int pageIndex) async {
		// Take the Picture in a try / catch block. If anything goes wrong,
		// catch the error.
		try {
			// Attempt to take a picture and log where it's been saved
			final path = join(
				// In this example, store the picture in the temp directory. Find
				// the temp directory using the `path_provider` plugin.
				(await getTemporaryDirectory()).path,
				'${DateTime.now()}.png',
			);
			print('path : $path');
			imagePath = path;
			
			await cameracontroller.takePicture(path);
			
			var decodedImage = await decodeImageFromList(
				File(path).readAsBytesSync());
			
			//Process images here. Implement the desigred functionality
			if (pageIndex == 0) {
				//TODO: Implement Translate Functionality
				
			}
			else if (pageIndex == 1) {
				String text = await _recognizeTextFromImage(imagePath);
				
				await Navigator.push(
					_context,
					PageTransition(
						type: PageTransitionType.fade,
						child: SearchImageView(
							imagePath: path,
							islandscape: decodedImage.width >
								decodedImage.height,
							recognizedText: text,
						)));
			}
			else {
				//TODO: Implement Text Recognition Functionality
				
			}
		} catch (e) {
			// If an error occurs, log the error to the console.
			print(e);
		}
	}
	
	ImagePickerServices selectedImage = ImagePickerServices();
	
	void OpenGallery() async {
		_image = await selectedImage.pickerImageFromGallery();
		String text = await _recognizeTextFromImage(_image);
		setState(() {
			fileSelected = true;
			print('Image Selected :  $_image');
			Navigator.push(_context, MaterialPageRoute(builder: (context) =>
				SelectedImageView(imagePath: imagePath, image: _image,)));
		});
		
		//		 model.services.i_imagepicker.pickerImageFromGallery();
	}
}
