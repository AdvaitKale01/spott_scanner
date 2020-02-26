import 'package:flutter/material.dart';
import 'package:google_lens_clone/enums/viewstate.dart';
import 'package:google_lens_clone/interfaces/i_vibration.dart';
import 'package:google_lens_clone/locator.dart';
import 'package:google_lens_clone/services/services.dart';

class BaseViewModel extends ChangeNotifier {

  bool _dispose = false;
  ViewState _state = ViewState.Idle;
  Services services = locator<Services>();

  ViewState get state => _state;

  void setState(ViewState viewState) {
    _state = viewState;
    if(_dispose == false)
        notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
    _dispose = true;
  }
}