import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ReverseTextView extends StatelessWidget {
  ScrollController scrollController;
  List<String> listTextTile;

//  ReverseImageView(this._scrollController);

  ReverseTextView(this.scrollController, this.listTextTile);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Card(
        elevation: 1.0,
        child: new StaggeredGridView.countBuilder(
          physics: NeverScrollableScrollPhysics(),
          controller: scrollController,
          primary: false,
          crossAxisCount: 1,
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
          itemBuilder: (context, index) =>
              TextInfoTileWidget(text: listTextTile[index]),
          staggeredTileBuilder: (index) => StaggeredTile.fit(4),
        ),
      ),
    );
  }
}

class TextInfoTileWidget extends StatelessWidget {
  final text;

  TextInfoTileWidget({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, bottom: 40, left: 20, right: 20),
      child: SelectableText(
        text,
        style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, letterSpacing: 1),
      ),
    );
  }
}
