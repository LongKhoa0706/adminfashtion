import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

 showProgress(BuildContext context)  {
  return BackdropFilter(
    filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
    child: Center(
      child: Dialog(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Container(
            height: 90,
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(1, 1),
                    spreadRadius: 1,
                    blurRadius: 1,
                    color: Colors.grey.withOpacity(.1),
                  ),
                ]),
            child: Row(
              children: [
                SpinKitCircle(
                  color: Colors.black,
                  size: 40,
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "Loading....",
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

hideProgess(BuildContext context){
  Navigator.pop(context);
}