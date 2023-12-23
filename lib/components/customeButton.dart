
import 'package:flutter/cupertino.dart';

Widget custom_button(double h, double w, String? text, Icon? icon, double radius,Color c){
  return Container(
      padding: const EdgeInsets.only(top:5),
      width: w,
      height: h,
      decoration: BoxDecoration(
        color: c,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: icon ?? Text(text!,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: h/2
        ),)
  );
}
