import 'package:flutter/cupertino.dart';

double height(BuildContext context, double val){
  return MediaQuery.of(context).size.height/val;
}
double width(BuildContext context, double val){
  return MediaQuery.of(context).size.width/val;
}