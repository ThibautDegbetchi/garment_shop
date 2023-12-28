import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../components/color.dart';

class CreateProfil extends StatefulWidget {
  const CreateProfil({super.key});

  @override
  State<CreateProfil> createState() => _CreateProfilState();
}

class _CreateProfilState extends State<CreateProfil> {
  final TextEditingController nomcontroller= TextEditingController();
  final cle =GlobalKey<FormState>();
  bool choix=false;
  bool choixx=false;
  bool a=true;
  bool b=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Créer un Profil',style: TextStyle(
            color:Colors.black
        ),),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(MediaQuery.of(context).size.height/25),
        alignment: Alignment.center,
        child: Container(
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  myAlert();
                },
                child: CircleAvatar(
                  backgroundColor: Colors.grey,
                  radius: 50,
                  child: Stack(
                    children: [
                      Positioned(
                        top: MediaQuery.of(context).size.height/10,
                        left: MediaQuery.of(context).size.width/18,
                        child: Container(padding: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                                color: Colors.blue[900],
                                borderRadius: BorderRadius.all(Radius.circular(20))
                            ),
                            child: Icon(Icons.edit,color: Colors.white,size: 19,)),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              //if image not null show the image
              //if image null show text
              image != null
                  ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.file(
                    //to show image, you type like this.
                    File(image!.path),
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width,
                    height: 300,
                  ),
                ),
              )
                  : Text(
                "",
                style: TextStyle(fontSize: 20),
              ),
              Form(
                key: cle,
                child: Container(
                    padding:EdgeInsets.all(10),
                    margin: EdgeInsets.only(top: 10),
                    decoration:const BoxDecoration(

                        borderRadius: BorderRadius.all(Radius.circular(100))
                    ),
                    child: TextFormField(
                      controller: nomcontroller,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 2,
                                style: BorderStyle.solid
                            ),
                            borderRadius:  BorderRadius.all(Radius.circular(100))
                        ),
                        // enabledBorder: ,
                        labelText: 'Nom du profile',
                        hintText: '',
                        labelStyle: TextStyle(
                            color: Colors.black,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.normal,
                            fontSize: 14
                        ),
                      ),
                      textAlign: TextAlign.start,
                      showCursor: true,
                      validator: (value){
                        return(!value!.endsWith('@gmail.com')|| value=='')?'Mail invalide':null;
                      },
                    )),),
              Container(
                  padding: EdgeInsets.only(left: 5,right: 5),
                  margin: EdgeInsets.only(left: 5,right: 5),
                  child: InkWell(
                    onTap: (){
                      setState(() {
                        choix=a;
                        a=!a;
                      });
                    },
                    child: Row(

                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Regarger en groupe'),
                          Switch(value: choix,
                              onChanged: (bool? i){
                                setState(() {
                                  choix=i!;
                                });
                              })
                        ]),
                  )
              ),
              Container(
                  padding: EdgeInsets.only(left: 5,right: 5),
                  margin: EdgeInsets.only(left: 5,right: 5),
                  child: InkWell(
                    onTap: (){
                      setState(() {
                        choixx=b;
                        b=!b;
                      });
                    },
                    child: Row(

                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Profile d\'enfant'),
                          Switch(value: choixx,
                              onChanged: (bool? i){
                                setState(() {
                                  choixx=i!;
                                });
                              })
                        ]),
                  )
              ),
              ElevatedButton(onPressed: (){
                (!cle.currentState!.validate())? Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                  return pages[0];
                })): null;
              }, style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.purple[900])
              ),
                  child:Text('Valider')
              ),
              TextButton(onPressed: (){}, child: Text('Avec un code pin',style: TextStyle(
                  color: Colors.blue[900]
              ),))
            ],
          ),
        ),
      ),
    );
  }


  XFile? image;

  final ImagePicker picker = ImagePicker();

  //we can upload image from camera or from gallery based on parameter
  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);

    setState(() {
      image = img;
    });
  }

  //show popup dialog
  void myAlert() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: Text('Please choose media to select'),
            content: Container(
              height: MediaQuery.of(context).size.height / 6,
              child: Column(
                children: [
                  ElevatedButton(
                    //if user click this button, user can upload image from gallery
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.gallery);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.image),
                        Text('From Gallery'),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    //if user click this button. user can upload image from camera
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.camera);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.camera),
                        Text('From Camera'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}