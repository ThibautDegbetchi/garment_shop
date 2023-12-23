import 'package:flutter/material.dart';

import '../helper/mediaqueryhelper.dart';
import 'color.dart';
import 'customeButton.dart';

Widget searchBar(BuildContext context){
  return  Row(
    children:<Widget> [
      Container(
          width: width(context, 4/3.4),
          margin:  EdgeInsets.only(left: height(context, 20),right: height(context, 50)),
          decoration: BoxDecoration(
            color: tdWhiteColor,
            borderRadius: BorderRadius.circular(  100),
          ),
          child: TextField(
            keyboardType:  TextInputType.text,
            decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: Icon(Icons.menu,color: tdBlackColor,),
                hintText: '...',
                constraints: BoxConstraints(
                  minHeight: height(context,15),
                  minWidth: width(context, 3),
                )
            ),
          )
      ),
      InkWell(
        onTap: (){},
        child: custom_button(height(context, 15),width(context, 15),null,const Icon(Icons.menu),10,tdPinkColor)
        ,
      )
    ],
  );
}