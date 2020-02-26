import 'dart:typed_data';

import 'dart:ui';

class ImageTileModel {

   Uint8List imagebyte;
   String title;
   String url;
   Size size;
 
  ImageTileModel(this.imagebyte,this.title,this.url,this.size);
}