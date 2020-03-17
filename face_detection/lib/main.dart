import 'dart:io';
import 'dart:ui' as ui;
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter/material.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:image_picker/image_picker.dart';

void main() =>
	runApp(
		MaterialApp(
			title: 'Flutter Demo',
			theme: ThemeData(
				primarySwatch: Colors.blue,
			),
			home: FacePage(),
		),
	);

class FacePage extends StatefulWidget {
	@override
	_FacePageState createState() => _FacePageState();
}

class _FacePageState extends State<FacePage> {
	File _imageFile;
	List<Face> _faces;
	bool isLoading = false;
	ui.Image _image;
	
	_getImageFromCameraAndDetectFaces() async {
		final imageFile = await ImagePicker.pickImage(
			source: ImageSource.camera);
		setState(() {
			isLoading = true;
		});
		final image = FirebaseVisionImage.fromFile(imageFile);
		final faceDetector = FirebaseVision.instance.faceDetector(
			FaceDetectorOptions(
				mode: FaceDetectorMode.accurate,
				enableClassification: false,
				enableContours: false,
				enableLandmarks: false,
				enableTracking: false,
			),
		);
		List<Face> faces = await faceDetector.processImage(image);
		if (mounted) {
			setState(() {
				_imageFile = imageFile;
				_faces = faces;
				_loadImage(imageFile);
			});
		}
	}
	
	_getImageFromGalleryAndDetectFaces() async {
		final imageFile = await ImagePicker.pickImage(
			source: ImageSource.gallery);
		setState(() {
			isLoading = true;
		});
		final image = FirebaseVisionImage.fromFile(imageFile);
		final faceDetector = FirebaseVision.instance.faceDetector(
			FaceDetectorOptions(
				mode: FaceDetectorMode.accurate,
				enableClassification: true,
				enableContours: true,
				enableLandmarks: true,
				enableTracking: false,
			),
		);
		List<Face> faces = await faceDetector.processImage(image);
		if (mounted) {
			setState(() {
				_imageFile = imageFile;
				_faces = faces;
				_loadImage(imageFile);
			});
		}
	}
	
	_loadImage(File file) async {
		final data = await file.readAsBytes();
		await decodeImageFromList(data).then(
				(value) =>
				setState(() {
					_image = value;
					isLoading = false;
				}),
		);
	}
	
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			body: isLoading
				? Center(child: CircularProgressIndicator())
				: (_imageFile == null)
				? Center(child: Text('No image selected'))
				: Center(
				child: FittedBox(
					child: SizedBox(
						width: _image.width.toDouble(),
						height: _image.height.toDouble(),
						child: CustomPaint(
							painter: FacePainter(_image, _faces),
						),
					),
				),
			),
			floatingActionButton: SpeedDial(
				animatedIcon: AnimatedIcons.menu_close,
				curve: Curves.bounceIn,
				overlayColor: Colors.black,
				overlayOpacity: 0,
				children: [
					SpeedDialChild(
						child: Icon(Icons.add_a_photo),
						backgroundColor: Colors.red,
						label: 'Take Image',
						onTap: () => _getImageFromCameraAndDetectFaces(),
					),
					
					SpeedDialChild(
						child: Icon(Icons.brush),
						backgroundColor: Colors.blue,
						label: 'Pick Image',
						onTap: () => _getImageFromGalleryAndDetectFaces(),
					),
				],
			),
		);
	}
}

class FacePainter extends CustomPainter {
	final ui.Image image;
	final List<Face> faces;
	final List<Rect> rects = [];
	
	
	FacePainter(this.image, this.faces) {
		for (var i = 0; i < faces.length; i++) {
			rects.add(faces[i].boundingBox);
		}
	}
	
	@override
	void paint(ui.Canvas canvas, ui.Size size) {
		final Paint paint = Paint()
			..style = PaintingStyle.stroke
			..strokeWidth = 35.0
			..color = Colors.red;
		
		canvas.drawImage(image, Offset.zero, Paint());
		for (var i = 0; i < faces.length; i++) {
			canvas.drawRect(rects[i], paint);
			canvas.drawRect(rects[i], paint);
		}
	}
	
	@override
	bool shouldRepaint(FacePainter oldDelegate) {
		return image != oldDelegate.image || faces != oldDelegate.faces;
	}
}