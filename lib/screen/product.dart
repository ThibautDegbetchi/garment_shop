import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:garment_shop/helper/mediaqueryhelper.dart';

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
        title: Text("Produce Card"),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
        Container(
          height: height(context, 2),
          width: width(context, 1.5),
          child: Stack(
            children: <Widget>[
              Positioned(
                top:0,
                  left: 0,
                  width: width(context, 1.5),
                  height: height(context, 2),
                  child: Container(

                    width: width(context, 1.5),
                    height: height(context, 2),
                    decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage(widget.url),
                            fit: BoxFit.fitWidth
                        )
                    ),

                  )
              )
            ],
          ),
        )
        ],
      ),
    );
  }
}
