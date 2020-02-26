import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:google_lens_clone/models/image_tile_model.dart';


final Uint8List kTransparentImage = new Uint8List.fromList(<int>[
  0x89,
  0x50,
  0x4E,
  0x47,
  0x0D,
  0x0A,
  0x1A,
  0x0A,
  0x00,
  0x00,
  0x00,
  0x0D,
  0x49,
  0x48,
  0x44,
  0x52,
  0x00,
  0x00,
  0x00,
  0x01,
  0x00,
  0x00,
  0x00,
  0x01,
  0x08,
  0x06,
  0x00,
  0x00,
  0x00,
  0x1F,
  0x15,
  0xC4,
  0x89,
  0x00,
  0x00,
  0x00,
  0x0A,
  0x49,
  0x44,
  0x41,
  0x54,
  0x78,
  0x9C,
  0x63,
  0x00,
  0x01,
  0x00,
  0x00,
  0x05,
  0x00,
  0x01,
  0x0D,
  0x0A,
  0x2D,
  0xB4,
  0x00,
  0x00,
  0x00,
  0x00,
  0x49,
  0x45,
  0x4E,
  0x44,
  0xAE,
]);

class ImageInfoTileWidget extends StatelessWidget {

  final ImageTileModel imageInfoTileWidget;
  final Size size;

  ImageInfoTileWidget({this.imageInfoTileWidget,this.size});
  
  @override
  Widget build(BuildContext context) {
      return new Card(
        elevation: 2.0,
      child: new Column(
        children: <Widget>[
          new Stack(
            children: <Widget>[
              //new Center(child: new CircularProgressIndicator()),
              // new Center(
              //   child: new FadeInImage.memoryNetwork(
              //     placeholder: kTransparentImage,
              //     image: 'https://picsum.photos/${size.width.toInt()}/${size.height.toInt()}/',
              //   ),
              // ),
                new Center(
                child:  new Image.memory(imageInfoTileWidget.imagebyte,
                  height: imageInfoTileWidget.size.height,
                  width: imageInfoTileWidget.size.width
                , fit: BoxFit.cover,),
                
              ),
            ],
          ),
          new Padding(
            padding: const EdgeInsets.all(4.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                new Text(
                  imageInfoTileWidget.title,
                  style: const TextStyle(fontWeight: FontWeight.bold),textAlign: TextAlign.start,
                ),
                new Text(
                  imageInfoTileWidget.url,
                  style: const TextStyle(color: Colors.grey),
                ),
              
              ],
            ),
          )
        ],
      ),
    );
  }
}