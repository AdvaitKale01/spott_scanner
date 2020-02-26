
import 'package:flutter/material.dart';
import 'package:google_lens_clone/managers/lifecycle_manager.dart';
import 'package:google_lens_clone/views/pages/home_camera_view.dart';
import 'package:google_lens_clone/views/shared/app_colors.dart';

import 'locator.dart';

void main() async {
	//Dependecy injectiion
	setupLocator();
	runApp(MyApp());
}

class MyApp extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return LifeCycleManager(
			child: MaterialApp(
				title: 'Spott',
				theme: ThemeData(
					primaryColor: PrimaryColor,
					fontFamily: 'Quicksand'
				),
				home:HomeCameraView()
			),
		);
	}
}
