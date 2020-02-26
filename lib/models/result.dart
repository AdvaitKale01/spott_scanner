import 'package:google_lens_clone/enums/viewstate.dart';

class ResultAndStatus{

  ViewState stateStatus;
  String errormessage;
  Object resultdata;

  ResultAndStatus(this.stateStatus, this.errormessage, this.resultdata);


  getViewState(){
    return stateStatus;
  }
  getErrorMessage(){
    return errormessage;
  }
  getData(){
    return resultdata;
  }


}