class Produce{
  final String name;
  final double price;
  final String url;
  bool isFavorite;
  Produce( this.name, this.price, this.url,this.isFavorite);
}

  List<Produce> produces=[
    Produce("phone1", 25,'assets/image1.png',false ),
    Produce("Morant picture", 50,'assets/Morant.jpg',false),
    Produce("phone2", 25,'assets/image2.png' ,false),
    Produce("phone3", 25,'assets/image3.png' ,false),
    Produce("phone4", 25,'assets/image4.png' ,false),
    Produce("Morant picture", 25,'assets/Morant.jpg' ,false),
    Produce("phone1", 25,'assets/image1.png' ,false),
    Produce("Morant picture", 50,'assets/Morant.jpg' ,true),
    Produce("phone2", 25,'assets/image2.png' ,true),
    Produce("phone3", 25,'assets/image3.png' ,true),
    Produce("phone4", 25,'assets/image4.png' ,true),
    Produce("Morant picture", 25,'assets/Morant.jpg' ,true),

  ];