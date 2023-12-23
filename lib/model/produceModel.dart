class Produce{
  final String name, description;
  final double price;
  final List<String> url;
  bool isFavorite;
  Produce( this.name, this.price, this.url,this.isFavorite, this.description);
}

  List<Produce> produces=[
    Produce("Ballon de Basket Wilson",
        20,
        ['assets/basketbal1.jpg',
      'assets/basketball2.jpg',
      'assets/Basketball3.jpg',
      'assets/wilson-basketball2.jpg',],
        false,
        "Ballon de basket très résistant, agréable et confortable pour à l'usage." ),
    Produce("Morant picture",
        30,
        ['assets/Morant.jpg',
      'assets/Ja_Morant-8.jpg',
      'assets/Morant.webp',
      'assets/Morant_dunk.webp',
      'assets/Morant_dunk_drawer.jpg',
        'assets/morant-dunk-1.jpg'],
        false,
        "Joueur NBA,\nAll STAR des Grizzlies de Memphis avec un talent hors pair.\nAvec ses coéquipier ils éssaient encore d'ateindre les finals NBA."),
    Produce("Play Station 5",
        50,
        ['assets/ps5.jpg',
          'assets/ps5-slim.jpg',
          'assets/ps5-slim-meilleur-prix.jpg',
        ] ,
        false,
        "Console de Jeux vidéo la plus évoluée du moment offrant la possibilité de jouer à des jeux en ligne pour un plaisir éblouissant. "),
    Produce("Ballon de Basket Spalding",
        20,
        ['assets/ballon-spalding.jpg',],
        false,
        "Ballon de basket très résistant, agréable et confortable pour à l'usage."),
    Produce("Manette Play Station 5",
        15,
        ['assets/manetteps5_.webp',
      'assets/manetteps5_2.jpg',
      'assets/manetteps5_3.jpeg',
      'assets/manetteps5_5.webp',] ,
        false,
        "Outil de commande des joueur des ps5, facile à maîtriser, d'une atirance irresistible.\nVivze une belle expérience avec nos manette ps5."),
    Produce("Voiture de cours",
        50000,
        ['assets/voiture.jpg',
          'assets/Voiture2.jpg',] ,
        false,
        "Sentez-vous libre d'aller ou bon vous semble,comme vous le voulez et quand vous le voulez!"),


    /* Produce("Morant picture", 25,['assets/Morant.jpg'] ,false),
    Produce("phone1", 25,['assets/image1.png'] ,false),
    Produce("Morant picture", 50,['assets/Morant.jpg'] ,true),
    Produce("phone2", 25,['assets/image2.png'] ,true),
    Produce("phone3", 25,['assets/image3.png'] ,true),
    Produce("phone4", 25,['assets/image4.png'] ,true),
    Produce("Morant picture", 25,['assets/Morant.jpg'] ,true),*/

  ];