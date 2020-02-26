
import 'package:get_it/get_it.dart';
import 'package:google_lens_clone/interfaces/i_imagepicker.dart';
import 'package:google_lens_clone/interfaces/i_mockdata.dart';
import 'package:google_lens_clone/interfaces/i_vibration.dart';
import 'package:google_lens_clone/repository/mock_data/mockservice.dart';
import 'package:google_lens_clone/repository/repository.dart';
import 'package:google_lens_clone/services/flashlight_services.dart';
import 'package:google_lens_clone/services/imagepicker_services.dart';
import 'package:google_lens_clone/services/services.dart';
import 'package:google_lens_clone/services/vibration_services.dart';
import 'package:google_lens_clone/utils/datetime_utils.dart';
import 'package:google_lens_clone/viewmodels/carousal_slider_viewmodel.dart';
import 'package:google_lens_clone/viewmodels/home_camera_viewmodel.dart';
import 'package:google_lens_clone/viewmodels/search_image_viewmodel.dart';

import 'interfaces/i_flashlight.dart';
import 'interfaces/i_repository.dart';

GetIt locator = GetIt.I;
void setupLocator() {
 
 locator.registerFactory(() =>  HomeCameraViewModel());

locator.registerFactory(() =>   CarousalSliderViewModel());

locator.registerFactory(()=>SearchImageViewModel());


 locator.registerLazySingleton<IMockData>(()=> new MockService());
 locator.registerLazySingleton<IRepository>(()=> new Repository());
 locator.registerSingleton(new DateTimeUtils());
 locator.registerLazySingleton<IVibration>(()=> new VibrationServices());
 locator.registerLazySingleton<IFlashLight>(()=> new FlashLightServices());
 locator.registerLazySingleton<IImagePicker>(()=> new ImagePickerServices());
 locator.registerSingleton(new Services());

  
}