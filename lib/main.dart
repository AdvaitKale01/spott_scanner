import 'package:flutter/material.dart';
import 'package:google_lens_clone/managers/lifecycle_manager.dart';
import 'package:google_lens_clone/views/pages/home_camera_view.dart';
import 'package:google_lens_clone/views/pages/splash_screen.dart';
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
          fontFamily: 'Quicksand',
          accentIconTheme: IconThemeData(
            color: Colors.black,
          ),
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
        ),
        home: SplashScreen(),
        routes: <String, WidgetBuilder>{
          '/HomeCameraView': (BuildContext context) => HomeCameraView(),
        },
        darkTheme: ThemeData.dark().copyWith(
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          accentIconTheme: IconThemeData(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
