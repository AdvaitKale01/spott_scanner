import 'package:flutter/material.dart';
import 'package:google_lens_clone/customize_existing_lib/modified_rubberbottomsheet.dart';
import 'package:google_lens_clone/models/image_tile_model.dart';
import 'package:google_lens_clone/views/pages/info_view.dart';
import 'package:google_lens_clone/views/pages/positioned.dart';
import 'package:google_lens_clone/views/pages/reverse_image_view.dart';
import 'package:rubber/rubber.dart';

class RubberBottomSheetWidget extends StatefulWidget {

  final List<ImageTileModel> listofsearchimage;
  final double initialvalue;

  RubberBottomSheetWidget({this.listofsearchimage,this.initialvalue});


  @override
  _RubberBottomSheetWidgetState createState() => _RubberBottomSheetWidgetState();
}

class _RubberBottomSheetWidgetState extends State<RubberBottomSheetWidget> with SingleTickerProviderStateMixin {


  bool hide = false; // hide the widget on top of botto sheet once reach top
  RubberAnimationController _rubbercontroller;
  ScrollController _scrollController = ScrollController();
  bool fabisclicked = true; // to detect whether button been click or not
  bool cropperbtn = false; 
 

  @override
  void initState() {

     _rubbercontroller = RubberAnimationController(
        vsync: this,
        lowerBoundValue:  AnimationControllerValue(percentage: 0.2),
        halfBoundValue: AnimationControllerValue(percentage: 0.5),
        upperBoundValue: AnimationControllerValue(percentage: 1),
        duration: Duration(milliseconds: 200),
      //initialValue: widget.initialvalue
    );

    
    Future.delayed(const Duration(milliseconds: 800), () {

// Here you can write your code

        setState(() {
          // Here you can write your code for open new view
          _rubbercontroller.halfExpand();

        });

      });

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return ModifiedRubberBottomSheet(
            ondraglast: togglevisibiltyofheader,
            scrollController: _scrollController,
            lowerLayer:  cropperbtn ? _getTopOverlayLayer() : Container( color: Colors.black.withOpacity(0.0)),
            header: 
            Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
              
                hide ? Container() :Expanded(
                      child: Container(child: bottomSheetHeader(), width: MediaQuery.of(context).size.width, height: 50,  ) ,flex: 4,),
                Expanded(

                  child: Container(
                        //color: Colors.amber,
                      
                      child:  Padding(
                        padding: const EdgeInsets.fromLTRB(10,20,0,0),
                        child: Text('Related Result',style: TextStyle(fontSize: 18),),
                      ),
                     decoration: new BoxDecoration(
                          color: Colors.white,
                          borderRadius: new BorderRadius.only(
                              topLeft: const Radius.circular(10.0),
                              topRight: const Radius.circular(10.0))),
                  //  child: Text('Result'),
                  ),


                flex: 6,)
              ],
            ),
            headerHeight: hide? 80 :150,//hide?80 : 100,
            upperLayer:ReverseImageView(_scrollController,widget.listofsearchimage),// InfoView(),//_getBodyLayer(),
            
            animationController: _rubbercontroller,
          
           );
  }


 Widget bottomSheetHeader(){


    return Padding(
      padding: const EdgeInsets.fromLTRB(0,0,0,0),
      child: Stack(

        children: <Widget>[

           Positioned(
              right: 10,
              child: GestureDetector(
                onTap: (){

                  setState(() {
                     if(cropperbtn){
                        _rubbercontroller.halfExpand();
                           cropperbtn = false;
                     }
                   
                    else{
                          _rubbercontroller.collapse();
                          cropperbtn = true; 

                    }
                      
                   
                  });

                },
                child: CircleAvatar(
                  radius: 23.0,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.crop,color:Colors.black),
                ),
              ),
            ),
            Positioned(
              left: 10,
              child:                      
              GestureDetector(
                onTap: (){
                      setState(() {

                    if(fabisclicked)
                      fabisclicked = false;
                    else
                      fabisclicked = true;
                        
                      });
                },
                              child: toggleSpeedialerbtn()
              ),
            )
            ,
           
        ],
      ),
    );
  }

 Widget toggleSpeedialerbtn(){

  if(fabisclicked){
    return CircleAvatar(
            radius: 23.0,
            backgroundColor: Colors.white,
            child: Icon(Icons.search,color:Colors.black),
          );
}
else{

  return Row(
    mainAxisSize: MainAxisSize.max,
    children: <Widget>[


      Padding(
        padding: const EdgeInsets.fromLTRB(0,0,0,0),
        child: GestureDetector(
          onTap: (){

            
            fabisclicked = true;

            setState(() {
              
            });


          },
                child: CircleAvatar(
                radius: 23.0,
                backgroundColor: Colors.white,
                child: Icon(Icons.search,color:Colors.black),
              ),
        ),
      ),
       Padding(
         padding: const EdgeInsets.fromLTRB(5,0,0,0),
         child: GestureDetector(
          onTap: (){

            
            fabisclicked = true;

            setState(() {
              
            });


          },
                child: CircleAvatar(
                radius: 23.0,
                backgroundColor: Colors.white,
                child: Icon(Icons.translate,color:Colors.black),
              ),
      ),
       ),

       Padding(
         padding: const EdgeInsets.fromLTRB(5,0,0,0),
         child: GestureDetector(
          onTap: (){

            
            fabisclicked = true;

            setState(() {
              
            });


          },
                child: CircleAvatar(
                radius: 23.0,
                backgroundColor: Colors.white,
                child: Icon(Icons.search,color:Colors.black),
              ),
      ),
       )
,

Padding(
  padding: const EdgeInsets.fromLTRB(5,0,0,0),
  child:   GestureDetector(
          onTap: (){
  
            
            fabisclicked = true;
  
            setState(() {
              
            });
  
  
          },
                child: CircleAvatar(
                radius: 23.0,
                backgroundColor: Colors.white,
                child: Icon(Icons.shopping_cart,color:Colors.black),
              ),
        ),
),

 Padding(
   padding: const EdgeInsets.fromLTRB(5,0,0,0),
   child: GestureDetector(
          onTap: (){

            
            fabisclicked = true;

            setState(() {
              
            });


          },
                child: CircleAvatar(
                radius: 23.0,
                backgroundColor: Colors.white,
                child: Icon(Icons.fastfood,color:Colors.black),
              ),
        ),
 )
    ],
  );
  }
}

 Widget _getBodyLayer() {
    return Container(
     
      decoration: BoxDecoration(
          color: Colors.white
      ),
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        controller: _scrollController,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(title: Text("Item $index"));
        },
        itemCount: 100
      ),
    );
  }

//Call when the bottomsheet reach top. Got bug. Sometime return true when drag down
 void togglevisibiltyofheader(bool ddsds){

    setState(() {
    hide = ddsds;
      
    });
  }


  Widget _getTopOverlayLayer(){

    return Container(
        color: Colors.black.withOpacity(0.4),
      child:
          Stack(
            alignment: Alignment.center,
            children: <Widget>[

               PositionedDraggableIcon(top:300,left:200)

            ],
          ),
           
    );
  }

}