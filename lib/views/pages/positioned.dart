import 'package:flutter/material.dart';
import 'package:google_lens_clone/views/shared/app_colors.dart';

class PositionedDraggableIcon extends StatefulWidget {
  final double top;
  final double left;

  PositionedDraggableIcon({Key key, this.top, this.left}) : super(key: key);

  @override
  _PositionedDraggableIconState createState() => _PositionedDraggableIconState();
}

class _PositionedDraggableIconState extends State<PositionedDraggableIcon> {
  GlobalKey _key = GlobalKey();
  double top, left;
  double xOff, yOff;
  double containerwidth = 10;
  double containerheight = 10;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(_afterLayout);
    top = widget.top;
    left = widget.left;

    Future.delayed(const Duration(milliseconds: 500), () {

// Here you can write your code

        setState(() {
          // Here you can write your code for open new view
            containerwidth =300;
            containerheight = 300;
            top = 240;
            left = 60;

        });

      });


    super.initState();

  }

  void _getRenderOffsets() {
    final RenderBox renderBoxWidget = _key.currentContext.findRenderObject();
    final offset = renderBoxWidget.localToGlobal(Offset.zero);

    yOff = offset.dy - this.top;
    xOff = offset.dx - this.left;
  }

  void _afterLayout(_) {
    _getRenderOffsets();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      key: _key,
      top: top,
      left: left,   
      child: Draggable(
        child:  CropperUi(),
        feedback: CropperUi(),
        childWhenDragging:Container(),
        onDragEnd: (drag) {
          setState(() {
            top = drag.offset.dy - yOff;
            left = drag.offset.dx - xOff;
          });
        },
      ),
    );
  }



  Widget CropperUi(){
    
    return AnimatedContainer(
      duration: Duration (milliseconds:50),
      height: containerheight,
      width: containerwidth,
      child: Stack(
        children: <Widget>[

          Positioned(
            top:1,
            left: 1,
            child: Container(
              width: 30,
              height: 30,
              //color: Colors.red,
              decoration: BoxDecoration(
                    // color: Colors.white,
                    // borderRadius: BorderRadius.all(Radius.circular(20.0)),
            
              border: Border(
                left: BorderSide( //                   <--- left side
                  color: CropperBorderColor,
                  width: 4.0,
                  
                ),
                top: BorderSide( //                    <--- top side
                  color: CropperBorderColor,
                  width: 4.0,
                ),
              ),
              ),
            ),
          ),

          Positioned(
            top:1,
            right: 1,
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
              border: Border(
                right: BorderSide( //                   <--- left side
                  color: CropperBorderColor,
                  width: 4.0,
                ),
                top: BorderSide( //                    <--- top side
                  color:CropperBorderColor,
                  width: 4.0,
                ),
              ),
              ),
            ),
          ),

          Positioned(
            bottom:1,
            left: 1,
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide( //                   <--- left side
                  color:CropperBorderColor,
                  width: 4.0,
                ),
                left: BorderSide( //                    <--- top side
                  color: CropperBorderColor,
                  width: 4.0,
                ),
              ),
              ),
            ),
          ),

          Positioned(
            bottom:1,
            right: 1,
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide( //                   <--- left side
                  color: CropperBorderColor,
                  width: 4.0,
                ),
                right: BorderSide( //                    <--- top side
                  color:CropperBorderColor,
                  width: 4.0,
                ),
              ),
              ),
            ),
          ),

          Align(
            alignment: Alignment.center,
            child: Container(
              color:  Colors.white.withOpacity(0.3),
              height: containerheight-10,
              width: containerwidth-10,
            ),
          )

        ],
      ),
    );
  }

   Widget CropperUiV2(){
    
    return AnimatedContainer(
      duration: Duration (milliseconds:50),
      height: containerheight,
      width: containerwidth,

      child: Stack(
        children: <Widget>[

          Align(
            alignment: Alignment.center,
            child: Container(
              
                    decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    ),
              height: containerheight,
              width: containerwidth,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              
              color:  Colors.white.withOpacity(0.3),
              height: containerheight-10,
              width: containerwidth-10,
            ),
          )

        ],
      ),
    );
  }
}