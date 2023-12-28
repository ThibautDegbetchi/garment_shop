import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../components/color.dart';
import 'creerprofile.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile',style: TextStyle(color: Colors.black),),
        centerTitle: true,
        backgroundColor: tdBGColor,

      ),
      body: Container(
        margin: EdgeInsets.only(left: MediaQuery.of(context).size.width/15,right:  MediaQuery.of(context).size.width/15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Username',style: TextStyle(
                fontWeight: FontWeight.bold
            ),),
            SizedBox(height: MediaQuery.of(context).size.height/60,),
            ElevatedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                  return CreateProfil();
                }));
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.white)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.person_outline_rounded,color: Colors.purple,),
                  Text('Degbetchi Thibaut',style: TextStyle(
                      color: Colors.black
                  ),)
                ],
              ),),
            SizedBox(height: MediaQuery.of(context).size.height/60,),
            Text('Email ou Nº de Telephone',style: TextStyle(
                fontWeight: FontWeight.bold
            ),),
            SizedBox(height: MediaQuery.of(context).size.height/60,),
            ElevatedButton(
              onPressed: (){

              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.white)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.mail_outline_rounded,color: Colors.purple,),
                  Text('Thibautdegbetchi@gmail.com',style: TextStyle(
                      color: Colors.black
                  ),)
                ],
              ),),
            SizedBox(height: MediaQuery.of(context).size.height/60,),
            Text('Compte Associés',style: TextStyle(
                fontWeight: FontWeight.bold
            ),),
            SizedBox(height: MediaQuery.of(context).size.height/60,),
            ElevatedButton(
              onPressed: (){

              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.white)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.g_mobiledata_rounded,color: Colors.purple,),
                      Text('Google',style: TextStyle(
                          color: Colors.black
                      ),)
                    ],
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width*0.76,),
                  Icon(CupertinoIcons.link_circle,color: Colors.grey,),
                ],
              ),),
            SizedBox(height: MediaQuery.of(context).size.height/6,),
            Container(
              margin: EdgeInsets.only(left: MediaQuery.of(context).size.width/5),
              child: ElevatedButton(onPressed: () {},
                  style: ButtonStyle(
                      shape: MaterialStateProperty.resolveWith((states) => RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50)))),
                      backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.purple[900]),
                      minimumSize: MaterialStateProperty.resolveWith((states) => Size(MediaQuery.of(context).size.width/2, MediaQuery.of(context).size.height/15))
                  ),child:Text('Enregistrer')
              ),
            )
          ],
        ),
      ),
    );
  }
}