import 'package:google_lens_clone/interfaces/i_flashlight.dart';
import 'package:google_lens_clone/interfaces/i_imagepicker.dart';
import 'package:google_lens_clone/interfaces/i_vibration.dart';
import 'package:google_lens_clone/locator.dart';

class Services {

   IVibration i_vibrate = locator<IVibration>();
   IFlashLight i_flashlight = locator<IFlashLight>();
   IImagePicker i_imagepicker = locator<IImagePicker>();
}