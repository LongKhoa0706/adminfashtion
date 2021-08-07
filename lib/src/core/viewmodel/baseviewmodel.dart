import 'package:adminfashtion/src/core/enum/viewstate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BaseViewModel extends ChangeNotifier{
  ViewState _state = ViewState.Idle;

  ViewState get state => _state;

  void setState(ViewState viewState){
    _state = viewState;
    notifyListeners();
  }
}