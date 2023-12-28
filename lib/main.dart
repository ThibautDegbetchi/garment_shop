import 'package:flutter/material.dart';
import 'package:garment_shop/screen/home.dart';

import 'components/color.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: '',
      home: Scaffold(
        bottomNavigationBar: bottomNavBar(context),
        body: pages[currentIndex] ,
      ),
      debugShowCheckedModeBanner: false,
    );
  }


  Widget bottomNavBar(BuildContext context){
    return BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (int index){
          setState(() {
            currentIndex= index;
            });
        },
        elevation: 2,
        selectedItemColor: tdPinkColor,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          )
        ]);
  }
}