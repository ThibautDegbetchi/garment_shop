import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:garment_shop/model/produceModel.dart';

import '../components/color.dart';
import '../helper/mediaqueryhelper.dart';

class CardProduce extends StatefulWidget {

  CardProduce({Key? key, this.produce}):super(key: key);
  Produce? produce;

  @override
  State<CardProduce> createState() => _CardProduceState();
}

class _CardProduceState extends State<CardProduce> {
  int number=1;
  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.only(top:height(context, 20),left:height(context, 20),right: height(context, 20) ),
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
                          image: AssetImage(widget.produce!.url),
                          fit: BoxFit.fill,
                        )
                    ),
                  ),
                  SizedBox(width: width(context, 50),),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.produce!.name,style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                      ),),
                      Text("\$${widget.produce!.price}",style: const TextStyle(
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
                      setState(() {
                        widget.produce!.isFavorite=value!;
                      });
                    },
                    value: widget.produce!.isFavorite,
                    checkColor: tdWhiteColor,
                    activeColor: tdPinkColor,
                  ),
                  Container(
                    margin: EdgeInsets.only(right: width(context, 30)),
                    height: height(context, 40),
                    width: width(context, 15),
                    decoration: BoxDecoration(
                      //color: tdBlackColor,
                        borderRadius: BorderRadius.circular(5)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: (){
                            setState(() {
                              number+=1;
                            });
                          },
                          child: Icon(Icons.add,
                            size: width(context, 50),),
                        ),
                        Text("$number",style: TextStyle(
                          fontWeight: FontWeight.bold
                        ),),
                        InkWell(
                          onTap: (){
                            setState(() {
                              if(number==0){
                                print('Le nombre de produit ne doit pas etre inférieure à 0');
                              }else
                                number-=1;
                            });
                          },
                          child: Icon(Icons.remove,
                            size: width(context, 50),),
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
}
