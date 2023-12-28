import 'package:flutter/material.dart';
import 'package:garment_shop/components/color.dart';
import 'package:garment_shop/components/drawer.dart';
import 'package:garment_shop/helper/mediaqueryhelper.dart';
import 'package:garment_shop/model/produceModel.dart';
import 'package:garment_shop/screen/productCard/displayProduceHome.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';
import '../components/searchBar.dart';
import 'detailPage/detailImage.dart';

class HomePage extends StatefulWidget {
   HomePage({super.key,required this.title});
  String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List category=['All','Popular','Recent','Recommended'];
  int selectedIndex =0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Menu(),
      backgroundColor: tdBGColor,
      appBar: AppBar(
        backgroundColor: tdBGColor,
        title: Text(widget.title,style: TextStyle(color: tdBlackColor),),
        centerTitle: true,
        //leading: Icon(Icons.menu,color: tdBlackColor,),
        actions: [CircleAvatar(
          backgroundColor: tdGreyColor,
          child: Image.asset('assets/profile.png'),
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
                    margin: const EdgeInsets.only(top: 25),
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
                            child: RichText(text: const TextSpan(text: 'Big Sale',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25)),),
                        ),
                        Positioned(
                          top: 75,
                          left: width(context, 3),
                          child: RichText(text: const TextSpan(text: "Smart phone\ntrès maniable, facile d'utilisation",style: TextStyle(fontWeight: FontWeight.normal)),),
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
                         style: const TextStyle(
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
                  return InkWell(
                    onTap: (){
                      print('${produces[index].name} ${produces[index].price}${produces[index].url}${produces[index].isFavorite}',);
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>
                       ProductPage(produce: produces[index],)));
                    },
                    child: buildImageCard(index, produces[index].url[0] as String,produces[index].name,produces[index].price),
                  );
                },
                staggeredTileBuilder:(int index)=>const StaggeredTile.fit(1)
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




