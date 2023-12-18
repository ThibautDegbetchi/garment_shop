import 'package:flutter/material.dart';
import 'package:garment_shop/components/color.dart';
import 'package:garment_shop/helper/mediaqueryhelper.dart';
import 'package:garment_shop/model/produceModel.dart';
import 'package:garment_shop/screen/basket.dart';
import 'package:garment_shop/screen/home.dart';

class ProductPage extends StatefulWidget {
  Produce? produce;
  ProductPage({super.key, this.produce,});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBGColor,
      /*appBar: AppBar(
        title: const Text("Produce Card"),
        centerTitle: true,
      ),*/
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: width(context, 100),right: width(context, 100)),
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
                Positioned(
                    top: height(context, 1.5),
                    //bottom: height(context, 1),
                    height: height(context, 0.9),
                    width: width(context, 1.03),
                    child: Container(
                      //color: tdPinkColor,
                      margin: EdgeInsets.only(left: width(context, 50),right: width(context, 50)),
                      child: Column(
                        children:<Widget> [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(widget.produce!.name,style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold
                              ),),
                              Text("\$${widget.produce!.price}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15
                                ),),
                            ],
                          ),
                          Text("BlablablablaBlablablablaBlablablablaBlablablablaBlablablablaBlablablablaBlablablablaBlablablablaBlablablablaBlablablablaBlablablablaBlablablablaBlablablablaBlablablabla")
                        ],
                      ),
                    )),
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
                            image: DecorationImage(image: AssetImage(widget.produce!.url),
                                fit: BoxFit.fill
                            ),
                            borderRadius: BorderRadius.circular(70)
                        ),
                      ),
                    )
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
    );
  }
}
