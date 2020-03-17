import 'package:flutter/material.dart';
import 'package:google_lens_clone/views/widgets/rubberbottomsheet_widget.dart';
import 'package:google_lens_clone/viewmodels/search_image_viewmodel.dart';
import 'package:google_lens_clone/views/core/base_view.dart';

class SelectedImageView extends StatefulWidget {
	final String imagePath;
	final image;
	SelectedImageView({this.imagePath, this.image});
	
	@override
	_SelectedImageViewState createState() => _SelectedImageViewState();
}

class _SelectedImageViewState extends State<SelectedImageView> {
	
	@override
	Widget build(BuildContext context) {
		return BaseView<SearchImageViewModel>(
		  onModelReady: (model) => model.getDefaultData(widget.imagePath),
			builder: (context, model, child) => Scaffold(
		  	body: SafeArea(
		  		child: Stack(
		  			children: <Widget>[
		  				Container(
		  					child: Image.file(widget.image),
		  				),
		  				RubberBottomSheetWidget(
									initialvalue: 20.0,
									listofsearchimage: model
										.list_imagetilemodel,),
		  			],
		  		),
		  	),
		  ),
		);
	}
}
