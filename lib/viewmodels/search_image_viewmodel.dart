
import 'dart:io';
import 'dart:math';
import 'dart:ui';

import 'package:google_lens_clone/enums/viewstate.dart';
import 'package:google_lens_clone/interfaces/i_vibration.dart';
import 'package:google_lens_clone/locator.dart';
import 'package:google_lens_clone/models/image_tile_model.dart';

import 'core/base_viewmodel.dart';

class SearchImageViewModel extends BaseViewModel{

   List<ImageTileModel> list_imagetilemodel = [];

   void getDefaultData(String path) async{

     setState(ViewState.Busy);


     var imagebyte = File(path).readAsBytesSync();

     var lis_ofsizes = _createSizes(1000);

     for(var size in lis_ofsizes){

       list_imagetilemodel.add(new ImageTileModel(imagebyte,"Feature coming soon","google lens clone ui",size));

     }

     setState(ViewState.Idle);
     

   }

   List<Size> _createSizes(int count) {
  Random rnd = new Random();
  return new List.generate(count,
      (i) => new Size( (rnd.nextInt(500) + 200).toDouble(), rnd.nextInt(800) + 200.toDouble()));
}

}