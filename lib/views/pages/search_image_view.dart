//Here write Image Searching Algorithm
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_lens_clone/viewmodels/search_image_viewmodel.dart';
import 'package:google_lens_clone/views/core/base_view.dart';
import 'package:google_lens_clone/views/widgets/lens_appbar.dart';
import 'package:google_lens_clone/views/widgets/rubberbottomsheet_widget.dart';
import 'package:rubber/rubber.dart';

class SearchImageView extends StatefulWidget {

   final String imagePath;
  final bool islandscape;

  SearchImageView({this.imagePath,this.islandscape});

  @override
  _SearchImageViewState createState() => _SearchImageViewState();
}

class _SearchImageViewState extends State<SearchImageView> {

 
  bool hide = false; // hide the widget on top of botto sheet once reach top
  @override
  void initState() {


    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<SearchImageViewModel>(
        onModelReady: (model)=> model.getDefaultData(widget.imagePath),
           builder: (context, model, child) =>  Scaffold(

             body: SafeArea(
               child: Stack(
                 children: <Widget>[

                   new RotatedBox(
                     quarterTurns: widget.islandscape ?-1 :0,
                      child:  Image.file(File(widget.imagePath),fit: BoxFit.fill,height: double.infinity,width: double.infinity),
                   ),
                   RubberBottomSheetWidget(initialvalue: 20.0,listofsearchimage: model.list_imagetilemodel,),

                   LensAppBar(false,onpop,OpenGallery)

                 ],
               ),
             ),
           ));
  }

void onpop(bool page){

      Navigator.pop(context);
}

void OpenGallery(){

  //TODO in version 2

}

 
}