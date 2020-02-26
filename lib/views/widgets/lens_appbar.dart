import 'package:flutter/material.dart';
import 'package:google_lens_clone/views/pages/home_camera_view.dart';

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
			width: MediaQuery.of(context).size.width,
			height: 80,
			child: AppBar(
				backgroundColor: Colors.transparent,
				centerTitle: true,
				title: Image(image: AssetImage('images/spott_logo.png'),height: 50, width: 70,),
				elevation: 0.0,
				leading: GestureDetector(
					onTap: () {
//                  IFlashLight i_flashlight = locator<IFlashLight>();
//            If toggle from first page
						if (widget.isfirstpage) {
							if (toggle_flash) {
								toggle_flash = false;
							} else {
								toggle_flash = true;
							}
							setState(() {
							});
						}
						//If toggle from second page
						else {
							widget.poppage(true);
						}
					},
					child: widget.isfirstpage
						? toggle_flash ? Icon(Icons.flash_on) : Icon(Icons.flash_off)
						: Icon(Icons.arrow_back),
				),
				actions: <Widget>[
					IconButton(
						padding: EdgeInsets.all(5.0),
						icon: Icon(Icons.image),
						onPressed: () {
							//TODO: Open gallery and show clicked image
							widget.opengallery();
						},
					),
					_morePopup()
				],
			));
	}
	
	Widget _morePopup() => PopupMenuButton<String>(
		offset: Offset(0, 100),
		icon: Icon(Icons.more_vert),
		itemBuilder: (context) => [
			PopupMenuItem(
				value: "feedback",
				child: Text("Send Feedback"),
			),
			PopupMenuItem(
				value: "privacy",
				child: Text("Privacy Policy"),
			),
			PopupMenuItem(
				value: "privacy",
				child: Text("Terms of Services"),
			),
		],
	);
}
