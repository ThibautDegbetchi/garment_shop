import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:garment_shop/components/color.dart';
import 'package:garment_shop/helper/mediaqueryhelper.dart';

class HomePage extends StatefulWidget {
   HomePage({super.key,required this.title});
  String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBGColor,
      appBar: AppBar(
        backgroundColor: tdBGColor,
        title: Text(widget.title,style: TextStyle(color: tdBlackColor),),
        centerTitle: true,
        leading: Icon(Icons.menu,color: tdBlackColor,),
        actions: [CircleAvatar(
          backgroundColor: tdGreyColor,
          child: Image.asset('assets/image1.png'),
        )],
      ),
      body: Container(
        margin: EdgeInsets.only(top: 10),
        child: Column(
          children: <Widget>[
            searchBar(context),
            Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 25),
                  width: width(context, 4/3),
                  height: height(context, 4),
                  decoration: BoxDecoration(
                    color: tdPinkColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('bonjour')
                        ],
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 1,
                  left: 2,
                  child: Image.asset('assets/image2.png',width: width(context, 3),height: height(context, 4),),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

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
        child: custom_button(height(context, 15),width(context, 15),null,Icon(Icons.menu),10,tdPinkColor)
        ,
      )
    ],
  );
}

Widget custom_button(double h, double w, String? text, Icon? icon, double radius,Color c){
  return Container(
      width: w,
      height: h,
      decoration: BoxDecoration(
        color: c,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: icon != null? icon: Text(text!,
        style: TextStyle(
            fontSize: w-2
        ),)
  );
}