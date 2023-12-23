import 'package:flutter/material.dart';
import 'package:garment_shop/components/color.dart';
import 'package:garment_shop/helper/mediaqueryhelper.dart';
import 'package:garment_shop/model/produceModel.dart';
import 'package:garment_shop/screen/cart/basket.dart';

import '../../components/customeButton.dart';

class ProductPage extends StatefulWidget {
  Produce? produce;
  ProductPage({super.key, this.produce,});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  int selectedImage=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBGColor,
      /*appBar: AppBar(
        title: const Text("Produce Card"),
        centerTitle: true,
      ),*/
      body: SingleChildScrollView(
        scrollDirection:  Axis.vertical,
        padding: EdgeInsets.only(top: height(context, 100)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: width(context, 50),right: width(context, 100)),
              height: height(context, 1.3),
              width: width(context, 1.02),
              child: Stack(
                children: <Widget>[
                  /* Positioned(
                      top: 0,
                      left: 0,
                      width: width(context, 1),
                      height: height(context, 1),
                      child: Container(
                        width: width(context, 1),
                        height: height(context,1),
                        decoration: BoxDecoration(
                            color: tdWhiteColor,
                            borderRadius: BorderRadius.circular(70)
                        ),

                      )
                  ),*/
                  /*Positioned(
                      top: height(context, 1.5),
                      //bottom: height(context, 1),
                      height: height(context, 0.9),
                      width: width(context, 1.03),
                      child: ),*/
                  Card(
                    margin: EdgeInsets.only(top: height(context, 100),bottom: height(context, 80)),
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)
                    ),
                    child: Container(
                      height: height(context, 1.3) ,
                      width: width(context, 1),
                      decoration: BoxDecoration(
                         // color: tdPinkColor,
                        borderRadius: BorderRadius.circular(50),

                      ),
                      child: Image.asset(widget.produce!.url[selectedImage],
                      fit: BoxFit.contain,),
                    ),
                  ),

                  Positioned(
                      top:height(context,25),
                      left: width(context, 15),
                      child: InkWell(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: width(context, 75),
                          height: height(context, 45),
                          decoration: BoxDecoration(
                              color: tdWhiteColor,
                              borderRadius: BorderRadius.circular(8)
                          ),
                          child: Icon(Icons.home,
                            color: tdBlackColor,
                            size: width(context, 80),
                          ),
                        ),
                      )
                  ),
                  Positioned(
                      top:height(context,25),
                      right: width(context, 15),
                      child: InkWell(
                        onTap: (){
                          setState(() {
                            widget.produce!.isFavorite=!widget.produce!.isFavorite;
                          });
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: width(context, 75),
                          height: height(context, 45),
                          decoration: BoxDecoration(
                              color: tdWhiteColor,
                              borderRadius: BorderRadius.circular(8)
                          ),
                          child: Icon(Icons.favorite,
                            color:widget.produce!.isFavorite?tdPinkColor:tdBlackColor,
                            size: width(context, 80),
                          ),
                        ),
                      )
                  ),

                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                ...List.generate(widget.produce!.url.length, (index) => otherProduceImage(context, index))
              ],
            ),
            Container(
              //color: tdPinkColor,
              margin: EdgeInsets.all(width(context, 50)),
              child: Column(
                children:<Widget> [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(widget.produce!.name,style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold
                      ),),
                      Text("\$${widget.produce!.price}",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25
                        ),),
                    ],
                  ),
                  Text(widget.produce!.description,
                    style: TextStyle(
                      fontSize: 20
                    ),)
                ],
              ),
            ),
            //bottom button add to cart and basket page
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: (){

                  },
                  child: Card(
                      elevation: 25,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(70)
                      ),
                      child: custom_button(height(context, 15), width(context, 2), "Add to Cart", null, 25, tdPinkColor)

                  ),
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return ShopingCart(cart: produces,);
                    }));
                  },
                  child: Card(
                      shape:  RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)
                      ),
                      elevation: 25,
                      child: custom_button(height(context, 20), width(context, 20), null, const Icon(Icons.shopping_cart_outlined), 25, tdGreyColor)
                  ),
                ),
              ],
            )

          ],
        ) ,
      ),
    );
  }
  Widget otherProduceImage(BuildContext context, int index){
    return GestureDetector(
      onTap: (){
        setState(() {
          selectedImage =index;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(seconds: 1),
        margin:  EdgeInsets.only(right: width(context, 40),bottom: height(context, 40)),
        padding: const EdgeInsets.all(8),
        height: width(context, 10),
        width: width(context, 10),
        decoration: BoxDecoration(
            color: tdWhiteColor,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                color: tdPinkColor.withOpacity(selectedImage==index? 1:0)
            )
        ),
        child:Image.asset(widget.produce!.url[index]),
      ),
    );
  }

}/*
Row(
children: [
...List.generate(widget.produce!.url.length, (index) => otherProduceImage(context, index))
],
)

 Positioned(
                    top:height(context, 900),
                    left: 0,
                    width: width(context, 1.02),
                    height: height(context, 1.5),
                    child: Card(
                      elevation: 25,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(70)
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                            color: tdPinkColor,
                            image: DecorationImage(image: AssetImage(widget.produce!.url.first),
                                fit: BoxFit.fill
                            ),
                            borderRadius: BorderRadius.circular(70)
                        ),
                      ),
                    )
                ),*/