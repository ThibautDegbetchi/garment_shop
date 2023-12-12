import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:garment_shop/components/color.dart';
import 'package:garment_shop/helper/mediaqueryhelper.dart';

class ShopingCart extends StatefulWidget {
  String? title='Cart';
  final String name;
  final  String url;
  final double  price;
  ShopingCart({super.key,
    this.title,
    required this.name,
    required this.url,
    required this.price,
  });

  @override
  State<ShopingCart> createState() => _ShopingCartState();
}

class _ShopingCartState extends State<ShopingCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBGColor,
      appBar: AppBar(
        title: Text('widget.title'),
        centerTitle: true,
      ),
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            /*Expanded(
              flex: 4,
                child: SingleChildScrollView(
                  child: Column(
                    
                  ),
                )
            )*/
            ProduceCard(context,widget.url,widget.name,widget.price)
          ],
        ),
      )
    );
  }
}
Widget ProduceCard(BuildContext context,String url,String name,double price){
  return Card(
    margin: EdgeInsets.all(height(context, 20)),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    color: tdWhiteColor,
    elevation: 1,
    child: Container(
      height: height(context, 5),
      width: width(context, 1.1),
      padding: EdgeInsets.all(height(context, 60)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: height(context, 5.1),
                width: width(context, 10),
                decoration: BoxDecoration(
                  //color: tdGreyColor,
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(url),
                      fit: BoxFit.fill,
                    )
                ),
              ),
              SizedBox(width: width(context, 50),),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name,style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                  ),),
                  Text("\$$price",style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold
                  ),)
                ],
              )
            ],
          ),


        ],
      ),
    )
  );
}
