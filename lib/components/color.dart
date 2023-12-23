import 'package:flutter/material.dart';

import '../model/produceModel.dart';
import '../screen/cart/basket.dart';
import '../screen/home.dart';
import '../screen/profile/porfile.dart';

Color tdBGColor= const Color(0xFFEEEFF5);
Color tdPinkColor = const  Color(0x96de225a);
Color tdGreyColor = const  Color(0xe4c8c8cb);
Color tdBlackColor = const Color(0xFF000000);
Color tdWhiteColor =const  Color(0xffffffff);

double totalprice=0;
int number1=1;
List pages=[HomePage(title: 'Home', ),ShopingCart(cart: produces),Profile()];
int currentIndex=0;