import 'package:flutter/material.dart';
import 'package:garment_shop/components/color.dart';
import 'package:garment_shop/helper/mediaqueryhelper.dart';
import 'package:garment_shop/screen/home.dart';

class ProductPage extends StatefulWidget {
  final String name;
  final  String url;
  final double  price;
  const ProductPage({super.key,required this.url,required this.name,required this.price});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Produce Card"),
        centerTitle: true,
      ),
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
                              Text(widget.name,style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold
                              ),),
                              Text("\$${widget.price}",
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
                      elevation: 50,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(70)
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(image: AssetImage(widget.url),
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
                      onTap: (){},
                      child: Container(
                        alignment: Alignment.center,
                        width: width(context, 75),
                        height: height(context, 45),
                        decoration: BoxDecoration(
                            color: tdWhiteColor,
                            borderRadius: BorderRadius.circular(8)
                        ),
                        child: Icon(Icons.favorite,
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
              Card(
                  elevation: 50,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(70)
                  ),
                  child: custom_button(height(context, 25), width(context, 2), "Buy now", null, 10, tdPinkColor)

              ),
              custom_button(height(context, 20), width(context, 20), null, const Icon(Icons.shopping_cart_outlined), 35, tdGreyColor)
            ],
          )

        ],
      ),
    );
  }
}
