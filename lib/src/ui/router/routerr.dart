
import 'package:adminfashtion/src/ui/router/router_path.dart';
import 'package:adminfashtion/src/ui/screen/category_screen.dart';
import 'package:adminfashtion/src/ui/screen/dash_board.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Routerr{
  static RouteFactory onGenerateRouter = (RouteSettings settings){
    switch(settings.name){
      case CategoryScreens:
        return _generateMaterialRoute(CategoryScreen());
      case DashBoardScreens:
        return _generateMaterialRoute(DashBoard());
    }
  };
}
 _generateMaterialRoute(Widget screen) {
  return MaterialPageRoute(builder: (BuildContext context) => screen);
}
