import 'package:flutter/material.dart';

class InfoView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[

          Expanded(
                      child: Container(
              height: 80,
              width: 40,
              child: Card(),
            ),
          ),
            Expanded(
                      child: Container(
              height: 80,
              child: Card(),
            ),
          ),
            Expanded(
                      child: Container(
             
              child: Card(),
            ),
          ),

      //     Expanded(
      //                 child: Container(
      //                   width: 20,
      //                   child: Card(
      //         elevation: 1.0,
              
      //       ),
      //                 )
      //     ,flex: 2,)
      //     ,
      //  //  Spacer(),
      //     Expanded(
      //                 child: Card(
      //         elevation: 1.0,
      //         child: Container(),
      //       ),
      //     flex:4),
      //    //  Spacer(),
      //     Expanded(
      //                 child: Card(
      //         elevation: 1.0,
      //         child: Container(),
      //       ),
      //     flex:2),
      //     Spacer()
        ],
      ),
      
    );
  }
}