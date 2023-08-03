import 'package:flutter/material.dart';

import '../model/appcolors.dart';

Widget appbars(String apptitle,Widget iconss) {
  return AppBar(
    toolbarHeight: 65,
    automaticallyImplyLeading: false,
    elevation: 0,
    foregroundColor: Colors.black,
    backgroundColor: AppColors.appbackgroundcolor,
    title: Text(apptitle),
    actions: [
      Padding(
        padding:const  EdgeInsets.only(right: 15.0),
        child: iconss,
      )
    ],
  );
}
