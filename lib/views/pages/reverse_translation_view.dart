import 'package:flutter/material.dart';
import 'package:google_lens_clone/views/widgets/supported_languages.dart';
import 'package:translator/translator.dart';

class ReverseTranslationView extends StatefulWidget {
  final ScrollController scrollController;
  final String sentence;
//  ReverseImageView(this._scrollController);

  ReverseTranslationView(
    this.scrollController,
    this.sentence,
  );

  @override
  _ReverseTranslationViewState createState() => _ReverseTranslationViewState();
}

class _ReverseTranslationViewState extends State<ReverseTranslationView> {
  String translation = '';

  bool isTranslated = false;
  final _translator = GoogleTranslator();
  Map<String, String> supportedLanguages =
      SupportedLanguages.getSupportedLanguages();
  String supportedLanguageValue = 'en';
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Card(
        elevation: 1.0,
        child: ListView(
          physics: NeverScrollableScrollPhysics(),
          controller: widget.scrollController,
          primary: false,
          children: <Widget>[
            Container(
              child: Text(
                'Detected Text',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                softWrap: true,
              ),
              padding: EdgeInsets.only(top: 20, bottom: 0),
            ),
            TranslationInfoTileWidget(
              text: widget.sentence,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Text(
                    'From  auto',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                Icon(
                  Icons.swap_horiz,
                  color: Colors.black,
                ),
                Container(
                  child: Text(
                    'To',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                DropdownButton(
                  items: supportedLanguages
                      .map((description, value) => MapEntry(
                          description,
                          DropdownMenuItem(
                            value: description,
                            child: Text(
                              value,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          )))
                      .values
                      .toList(),
                  value: supportedLanguageValue,
                  onChanged: (String value) async {
                    setState(() {
                      isTranslated = false;
                    });
                    translation =
                        await _translator.translate(widget.sentence, to: value);
                    setState(() {
                      supportedLanguageValue = value;
                      isTranslated = true;
                      //value is en
                    });
                  },
                ),
              ],
            ),
            Container(
              child: Text(
                'Translated Text',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                softWrap: true,
              ),
              padding: EdgeInsets.only(top: 20, bottom: 0),
            ),
            isTranslated
                ? TranslationInfoTileWidget(
                    text: translation,
                  )
                : Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.45,
                          top: 20),
                      height: 40,
                      width: 40,
                      child: CircularProgressIndicator(),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}

class TranslationInfoTileWidget extends StatelessWidget {
  final text;
  TranslationInfoTileWidget({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, bottom: 30, left: 20, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width * .88,
            child: SelectableText(
              text,
              style: TextStyle(fontSize: 18, letterSpacing: 1),
            ),
          ),
        ],
      ),
    );
  }
}
