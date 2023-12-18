import 'package:flutter/material.dart';
import 'package:garment_shop/components/color.dart';
import 'package:garment_shop/helper/mediaqueryhelper.dart';

class Menu extends StatelessWidget {
  Menu({Key? key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Drawer(
      backgroundColor: tdBGColor,
      elevation: 1,
      child: SingleChildScrollView(
        child: Column(
          children:<Widget> [
            buildHeader(context),
            buildMenuItems(context),
          ],
        ),
      ),
    );
  }

  Widget buildHeader(BuildContext context) =>Container(
    height: height(context, 4),
    color: tdBGColor,
    padding: EdgeInsets.only(
        top: height(context, 50)
    ),
    child: Image.asset('assets/profile.png',fit: BoxFit.fill,),
  ) ;

  Widget buildMenuItems(BuildContext context) => Column(
    children: [
      ListTile(
        leading: const Icon(Icons.person),
        title: const Text('Profil',
          style: TextStyle(
              fontSize: 15
          ),),
        onTap: (){

        },
      ),
      ListTile(
        leading: const Icon(Icons.settings),
        title: const Text('Setting',
          style: TextStyle(
              fontSize: 15
          ),),
        onTap: (){

        },
      ),
      ListTile(
        leading: const Icon(Icons.logout),
        title: const Text('LogOut',
          style: TextStyle(
              fontSize: 15
          ),),
        onTap: (){},
      )
    ],
  );
}
