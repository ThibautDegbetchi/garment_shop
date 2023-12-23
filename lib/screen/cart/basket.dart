import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:garment_shop/components/color.dart';
import 'package:garment_shop/components/drawer.dart';
import 'package:garment_shop/helper/mediaqueryhelper.dart';
import 'package:garment_shop/screen/productCard/card.dart';

import '../../components/customeButton.dart';
import '../../model/produceModel.dart';

class ShopingCart extends StatefulWidget {
  String? title='Your Cart';
  List<Produce> cart=[];
  ShopingCart({super.key,
    this.title,
    required this.cart
  });

  @override
  State<ShopingCart> createState() => _ShopingCartState();
}

class _ShopingCartState extends State<ShopingCart> {
  int totalPrice=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Menu(),
      extendBodyBehindAppBar: true,
      backgroundColor: tdBGColor,
      appBar: AppBar(
        title: widget.title==null? Text('Your Cart',style: TextStyle(color: tdBlackColor),):Text('${widget.title}',style: TextStyle(color: tdBlackColor)),
        centerTitle: true,
        backgroundColor: tdBGColor,
        leading: IconButton(onPressed: () {
          setState(() {
            Navigator.pop(context);
          });
        },
          icon: Icon(Icons.arrow_back,color: tdBlackColor,),
        ),
        actions:  [
              CircleAvatar(
                backgroundImage: AssetImage('assets/profile.png')
              )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: ListView.builder(
                itemCount: widget.cart.length,
                itemBuilder: (context,index){
                  return CardProduce(produce: widget.cart[index]);
                }

            ),
      ),
          Expanded(
            flex: 1,
              child: Container(
                width: width(context, 1.2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text("Total",style: TextStyle(
                          color: tdGreyColor,
                          fontWeight: FontWeight.normal,
                          fontSize: width(context, 35)
                        ),),
                        Text("\$$totalPrice",style: TextStyle(
                            color: tdBlackColor,
                            fontWeight: FontWeight.bold,
                            fontSize: width(context, 30)
                        ),)
                      ],
                    ),
                    InkWell(
                      onTap: (){},
                      child: custom_button(height(context, 10), width(context, 1.9), 'Pay now', null, 35, tdPinkColor),
                    )
                  ],
                ),
              )
          )
          ]
      )
    );
  }
}

Widget ProduceCard(BuildContext context,String url,String name,double price,bool isCheck){
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
                  Text(name,style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                  ),),
                  Text("\$$price",style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold
                  ),)
                ],
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Checkbox(
                value: isCheck,
                onChanged: (onChanged){},
                checkColor: tdWhiteColor,
                activeColor: tdPinkColor,
              ),
              Container(
                height: height(context, 40),
                width: width(context, 15),
                decoration: BoxDecoration(
                    //color: tdBlackColor,
                    borderRadius: BorderRadius.circular(5)
                ),
                child: Row(
                  children: [
                    InkWell(
                      onTap: (){},
                      child: Container(
                        child: Icon(Icons.add,
                        size: width(context, 80),),
                      ),
                    ),
                    Text("number"),
                    InkWell(
                      onTap: (){},
                      child: Container(
                        child: Icon(Icons.remove,
                          size: width(context, 80),),
                      ),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    )
  );
}

