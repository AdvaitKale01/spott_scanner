import 'package:google_lens_clone/enums/viewstate.dart';

import 'core/base_viewmodel.dart';

class TextRecognitionViewModel extends BaseViewModel {
  List<String> list_texttilemodel = [];

  void getDefaultData(List<String> recognizedText) async {
    setState(ViewState.Busy);

//		var imagebyte = File(path).readAsBytesSync();

//		var lis_ofsizes = _createSizes(100);

    list_texttilemodel.addAll(recognizedText);

    setState(ViewState.Idle);
  }

//	List<Size> _createSizes(int count) {
//		Random rnd = new Random();
//		return new List.generate(count,
//				(i) => new Size((rnd.nextInt(50) + 200).toDouble(),
//				rnd.nextInt(100) + 300.toDouble()));
//	}

}
