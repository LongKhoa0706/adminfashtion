import 'package:adminfashtion/src/core/viewmodel/category_viewmodel.dart';
import 'package:adminfashtion/src/ui/screen/baseview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<CategoryViewModel>(
      builder: (BuildContext context, CategoryViewModel? model, Widget? child) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(model!.count.toString()),
            RaisedButton(
              onPressed: (){
                model.increment();
              },
            ),
          ],
        );
      },

    );
  }
}
