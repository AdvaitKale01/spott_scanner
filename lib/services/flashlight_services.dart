
import 'package:google_lens_clone/interfaces/i_flashlight.dart';
import 'package:google_lens_clone/interfaces/i_vibration.dart';

class FlashLightServices implements IFlashLight {

  @override
  void offFlash() async {
    // TODO: implement offFlash
    
  }

  @override
  void onFlash() async {
    // TODO: implement onFlash
    // if(await Lantern.hasLamp)
    //     Lantern.turnOn();
  }



}