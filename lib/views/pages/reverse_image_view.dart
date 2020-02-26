import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_lens_clone/models/image_tile_model.dart';
import 'package:google_lens_clone/views/widgets/imageinfo_tile_widget.dart';



class ReverseImageView extends StatelessWidget {

  ScrollController scrollController;
  List<ImageTileModel> listimagetile;

//  ReverseImageView(this._scrollController);


  ReverseImageView(this.scrollController,this.listimagetile) ;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
 
      body: Card(
        elevation: 1.0,
              child:
               new StaggeredGridView.countBuilder(
          physics: NeverScrollableScrollPhysics(),
          controller:scrollController ,
          primary: false,
          crossAxisCount: 4,
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
          itemBuilder: (context, index) => new ImageInfoTileWidget(imageInfoTileWidget:listimagetile[index]),
          staggeredTileBuilder: (index) => new StaggeredTile.fit(2),
        ),
      ),
    );
  }
}