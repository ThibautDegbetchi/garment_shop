
import 'package:flutter/material.dart';

import '../../components/color.dart';

Widget buildImageCard(int index, String pictures,String produceName, double price) {
  return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        children: [
          Card(
            child: Image.asset(pictures),
          ),
          Text(produceName,style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: tdBlackColor
          ),),
          Text("$price \$",style: TextStyle(
              fontSize: 10,
              color: tdGreyColor
          ),)
        ],
      )
  );
}