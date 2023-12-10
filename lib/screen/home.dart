import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:garment_shop/components/color.dart';
import 'package:garment_shop/helper/mediaqueryhelper.dart';
import 'package:garment_shop/produceModel.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

class HomePage extends StatefulWidget {
   HomePage({super.key,required this.title});
  String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List category=['All','Popular','Recent','Recommended'];
  int selectedIndex =0;
  List<String> pictures=['assets/image1.png','assets/Morant.jpg','assets/image3.png','assets/image4.png','assets/image1.png','assets/image2.png','assets/image3.png','assets/Morant.jpg','assets/image1.png','assets/image2.png','assets/image3.png','assets/Morant.jpg','assets/image1.png','assets/image2.png','assets/Morant.jpg','assets/image4.png'];
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
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          margin: const EdgeInsets.only(top: 10),
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
                    child: Stack(
                      children: [
                        Positioned(
                          top: 25,
                          left: width(context, 3),
                            child: RichText(text: TextSpan(text: 'Big Sale',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25)),),
                        ),
                        Positioned(
                          top: 75,
                          left: width(context, 3),
                          child: RichText(text: TextSpan(text: 'bla bla bla bla bla blabla bla bla v v \nvblabla blablablablablablabla',style: TextStyle(fontWeight: FontWeight.normal)),),
                        ),

                      ],
                    ),
                  ),
                  Positioned(
                    top: 10,
                    left: 2,
                    child: Image.asset('assets/image2.png',width: width(context, 3),height: height(context, 4),),)
                ],
              ),
             Container(

               margin: EdgeInsets.all(height(context, 50)),
               height: height(context, 25),
               width: width(context, 1.5),
               child: ListView.separated(
                   scrollDirection: Axis.horizontal,
                   //padding: EdgeInsets.all(width(context, 70)),
                   itemCount: category.length,
                   itemBuilder: (context,index){
                     final currentCategory=category[index];

                     return InkWell(
                       onTap: (){
                         setState(() {
                           selectedIndex = index;
                         });
                         print(currentCategory);
                       },
                       child: Container(
                         padding: EdgeInsets.all(height(context, 150)),
                         width: width(context, 10),
                         decoration: BoxDecoration(
                           color:selectedIndex==index?tdPinkColor:tdGreyColor,
                           borderRadius: BorderRadius.circular(10),
                         ),
                         child: Text(currentCategory,
                         textAlign: TextAlign.center,
                         style: TextStyle(
                           fontSize: 15,
                         ),),
                       )
                     );

                   }, separatorBuilder: (BuildContext context, int index) {
                     return SizedBox(width: width(context, 60),);
               },),
             ),
              StaggeredGridView.countBuilder(
                shrinkWrap: true,
                primary: false,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                crossAxisCount:2,
                  itemCount: produces.length,
                  //gridDelegate: gridDelegate,
                itemBuilder: (BuildContext context, int index) {
                  return buildImageCard(index, produces[index].url,produces[index].name,produces[index].price);
                },
                staggeredTileBuilder:(int index)=>StaggeredTile.fit(1)
                //index %4 ==0? StaggeredTile.count(2,2):StaggeredTile.count(1,1)
                /*StaggeredTile.count(2,index.isEven?2:1)*/,
              )
            ],
          ),
        ),
      ),
    );
  }

}
Widget buildImageCard(int index, String pictures,String produceName, int price) {
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10)
    ),
    child: Column(
      children: [
        Card(
          child: Image.asset(pictures),
        ),
        Text("$produceName",style: TextStyle(
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
    padding: EdgeInsets.only(top:5),
      width: w,
      height: h,
      decoration: BoxDecoration(
        color: c,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: icon != null? icon: Text(text!,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: h/2
        ),)
  );
}
