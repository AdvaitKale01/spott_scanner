import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_lens_clone/models/carousal_item_model.dart';
import 'package:google_lens_clone/viewmodels/carousal_slider_viewmodel.dart';
import 'package:google_lens_clone/views/core/base_view.dart';
import 'package:google_lens_clone/views/shared/app_colors.dart';
import 'package:vibration/vibration.dart';

class CustomCarousalSlider extends StatefulWidget {
	final List<CarousalItemModel> _iconlist;
	final Function(int) onselectedpage;
	
	CustomCarousalSlider(this._iconlist,this.onselectedpage);
	
	@override
	_CustomCarousalSliderState createState() => _CustomCarousalSliderState();
}

class _CustomCarousalSliderState extends State<CustomCarousalSlider> {
	
	List childlist ;
	CarousalItemModel selecteditem = new CarousalItemModel(Icons.search, "Search");
	bool showDisplayItem = false;
	CarousalSliderViewModel _viewmodel;
	
	@override
	void initState() {
		// TODO: implement initState
		super.initState();
	}
	
	@override
	Widget build(BuildContext context) {
		return BaseView<CarousalSliderViewModel>(
			// onModelReady: (model)=> model.getDefaultData(),
			builder: (context, model, child) => Scaffold(
				backgroundColor: Colors.transparent,
				body: Stack(
					children: <Widget>[
						DisplaySelectedItem(),
						SelectorCircle(),
						Padding(
							padding: const EdgeInsets.fromLTRB(0,0,0,25),
							child: Align(
								alignment: Alignment.bottomCenter,
								child: CarouselSlider(
									items: CarousalSliderItems(),
									initialPage: 1,
									autoPlay: false,
									enlargeCenterPage: true,
									viewportFraction: 0.2,
									aspectRatio:7.0,
									enableInfiniteScroll: false,
									onPageChanged: (int index){
										actionOnPageChange(model,index);
										//TODO: Implement Different behaviour for index: 0 - Translate, 1: Search, 2 - Text
										print(index);
										if(index == 0) {
											TranslationModel();
										}
										else if(index == 1) {
											SearchModel();
										}
										else {
											TextRecognitionModel();
										}
									},
								),
							),
						)
					],
				),
			)
		);
	}
	
	Widget DisplaySelectedItem(){
		return Align(
			alignment: Alignment.center,
			child: AnimatedOpacity(
				opacity: showDisplayItem ?1.0:0.0 ,
				duration: Duration(milliseconds: 500),
				child: Container(
					height: 100,
					width: 100,
					child: Column(
						mainAxisSize: MainAxisSize.max,
						crossAxisAlignment: CrossAxisAlignment.stretch,
						children: <Widget>[
							Padding(
								padding: const EdgeInsets.all(8.0),
								child: Icon(selecteditem.icondata,size: 55, color:CarousalSliderItemColor,),
							),
							Align(
								alignment: Alignment.center,
								child: Text(selecteditem.name,style: TextStyle(fontSize: 20, color:CarousalSliderItemColor,fontWeight: FontWeight.bold),))
						],
					),
				),
			),
		);
	}
	
	Widget SelectorCircle(){
		return  Padding(
			padding: const EdgeInsets.fromLTRB(0,0,0,18),
			child: Align(
				alignment: Alignment.bottomCenter,
				child: new Container(
					width: 70.0,
					height: 70.0,
					decoration: new BoxDecoration(
						color: const Color(0x4dffffff),
						
						borderRadius: new BorderRadius.all(new Radius.circular(50.0)),
						border: new Border.all(
							color: Colors.white,
							width: 3.5,
						),
					),
				),
			),
		);
	}
	
	List CarousalSliderItems(){
		
		//Custom Mapper function from carousal slider's example
		List<T> map<T>(List list, Function handler) {
			List<T> result = [];
			for (var i = 0; i < list.length; i++) {
				result.add(handler(i, list[i]));
			}
			
			return result;
		}
		
		return map<Widget>(
			widget._iconlist,
				(index, i) {
				return GestureDetector(
					onTap: () async{
						
						widget.onselectedpage(index);
						
					},
					child: CircleAvatar(
						radius: 80.0,
						backgroundColor: const Color(0xd9ffffff),
						child: Icon(widget._iconlist[index].icondata,color: Colors.black,),
					),
				);
			},
		).toList();
	}
	
	
	void actionOnPageChange(CarousalSliderViewModel viewmodel,int index){
	//It display title and icon temporarily
		viewmodel.services.i_vibrate.vibrateForDurationInMilisecond(50);
		setState(() {
			showDisplayItem = true;
			selecteditem  = widget._iconlist[index];
		});
		//Hides the title and icon
		Future.delayed( Duration(milliseconds: 1500), () async {
			setState(() {
				showDisplayItem = false;
			});
		});
	}
}

class TranslationModel extends StatefulWidget {
  @override
  _TranslationModelState createState() => _TranslationModelState();
}

class _TranslationModelState extends State<TranslationModel> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class SearchModel extends StatefulWidget {
  @override
  _SearchModelState createState() => _SearchModelState();
}

class _SearchModelState extends State<SearchModel> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class TextRecognitionModel extends StatefulWidget {
  @override
  _TextRecognitionModelState createState() => _TextRecognitionModelState();
}

class _TextRecognitionModelState extends State<TextRecognitionModel> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

