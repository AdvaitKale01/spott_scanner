import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
        child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          controller: scrollController,
          primary: false,
//          crossAxisCount: 1,
//          mainAxisSpacing: 4.0,
//          crossAxisSpacing: 4.0,
          itemBuilder: (context, index) {
            print('index : $index');
            if (index < listTextTile.length) {
              return TextInfoTileWidget(text: listTextTile[index]);
            }
            return null;
          },
//          staggeredTileBuilder: (index) => StaggeredTile.fit(2),
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
      padding: const EdgeInsets.only(top: 30, bottom: 30, left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SelectableText(
            text,
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, letterSpacing: 1),
          ),
          IconButton(
            icon: Icon(
              Icons.content_copy,
              color: Theme.of(context).accentIconTheme.color,
            ),
            onPressed: () async {
              await Clipboard.setData(ClipboardData(text: text));
              Scaffold.of(context).showSnackBar(SnackBar(
                content: Text('Copied to Clipboard!'),
                behavior: SnackBarBehavior.floating,
              ));
            },
          ),
        ],
      ),
    );
  }
}
