import 'package:adminfashtion/src/core/enum/viewstate.dart';
import 'package:adminfashtion/src/core/viewmodel/baseviewmodel.dart';

class CategoryViewModel extends BaseViewModel{
  int count = 0;
  void increment(){
    count++;
    setState(ViewState.Idle);
  }
}