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
  bool isCheck=false;
  int  currentIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBGColor,
      appBar: AppBar(
        title: Text('widget.title'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context,index){
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
                                        image: AssetImage(widget.url),
                                        fit: BoxFit.fill,
                                      )
                                  ),
                                ),
                                SizedBox(width: width(context, 50),),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(widget.name,style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold
                                    ),),
                                    Text("\$${widget.price}",style: TextStyle(
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
                                  onChanged: (value){
                                    currentIndex=index;
                                      setState(() {
                                        if(currentIndex==index)
                                          isCheck=value!;
                                    });
                                  },
                                  value: isCheck,
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

            ),
      ),
          Expanded(
            flex: 0,
              child: Container(

              )
          )
          ]
      )
    );
  }
  bool setCheckState(int index,bool check){
    setState(() {
      if(currentIndex==index){
        isCheck=!check;
      }
    });
    return check;
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
                  Text(name,style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                  ),),
                  Text("\$$price",style: TextStyle(
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

