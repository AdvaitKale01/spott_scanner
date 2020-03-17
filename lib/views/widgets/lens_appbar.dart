import 'package:flutter/material.dart';

class LensAppBar extends StatefulWidget {
	final Function(bool) poppage;
	final bool isfirstpage;
	final VoidCallback opengallery;
	
	LensAppBar(this.isfirstpage, this.poppage, this.opengallery);
	
	@override
	_LensAppBarState createState() => _LensAppBarState();
}

class _LensAppBarState extends State<LensAppBar> {
	bool toggle_flash = false;
	
	
	@override
	Widget build(BuildContext context) {
		return Container(
//        color: Colors.black.withOpacity(0.7),
			width: MediaQuery
				.of(context)
				.size
				.width,
			height: 80,
			child: AppBar(
				backgroundColor: Colors.transparent,
				centerTitle: true,
//          title: Image(
//            image: AssetImage('images/spott_grad_1.png'),
//            height: 50,
//            width: 70,
//          ),
				elevation: 0.0,
//				leading: GestureDetector(
//					onTap: () {
////              IFlashLight i_flashlight = locator<IFlashLight>();
////            If toggle from first page
//						if (widget.isfirstpage) {
//							if (toggle_flash) {
//								setState(() {
//
//								});
//								toggle_flash = !toggle_flash;
//							} else {
//							setState(() {
//
//							});
//								toggle_flash = !toggle_flash;
//							}
//
//						}
//						//If toggle from second page
//						else {
//							widget.poppage(true);
//						}
//					},
//					child: widget.isfirstpage
//						? toggle_flash ? Icon(Icons.flash_on) : Icon(
//						Icons.flash_off)
//						: Icon(Icons.arrow_back),
//				),
				actions: <Widget>[
					IconButton(
						padding: EdgeInsets.all(5.0),
						icon: Icon(Icons.image),
						onPressed: () {
							widget.opengallery();
						},
					),
					_morePopup()
				],
			));
	}
	
	Widget _morePopup() =>
		PopupMenuButton<String>(
			offset: Offset(0, 100),
			icon: Icon(Icons.more_vert),
			itemBuilder: (context) =>
			[
				PopupMenuItem(
					value: "settings",
					child: Text("Settings"),
				),
				PopupMenuItem(
					value: "credits",
					child: Text("Credits"),
				),
			],
		);
}
