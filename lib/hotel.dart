class Hotel{
  String _name;
  double _price;
  String _image;
  int _rating;
  Hotel(this._name, this._price, this._rating, this._image);
  String get name=>_name;
  String get image=>_image;
  double get price=>_price;
  int get rating=>_rating;
  @override
  String toString(){
    return 'A Week In '+name+' , of $rating stars rating, Cost: $price\$';
  }
}
List<Hotel>maldivesHotels=[
  Hotel('Rashu Hiyaa', 250, 3, 'images/maldivesRashuHiyaa3.jpg'),
  Hotel('Meeru Maldives Resort Island',550, 4, 'images/maldivesMeeruMaldivesResortIsland4.jpg'),
  Hotel('Atmosphere kanifushi', 900, 5, 'images/maldivesAtmosphereKanifushi5.jpg')
];
List<Hotel>turkeyHotels=[
  Hotel("La Kumsal Hotel", 70, 3, 'images/turkeyLaKumsalHotel3.jpg'),
  Hotel("Lara Barut Collection", 140, 5, 'images/turkeyLaraBarutCollection5.jpg'),
  Hotel("Tuvana Hotel", 110, 4, 'images/turkeyTuvanaHotel4.jpg')
];
List<Hotel>italyHotels=[
  Hotel("Hotel Santa Maria", 100, 3, 'images/italyHotelSantaMaria3.jpg'),
  Hotel("Dharma Boutique Hotel&Spa", 150, 4, 'images/italyDharmaBoutiqueHotel&Spa4.jpg'),
  Hotel("Mazzaro Sea Palace", 210, 5, 'images/italyMazzaroSeaPalace5.jpg')
];
List<Hotel>baliHotels=[
  Hotel("Adiwana Unagi Suites", 210, 4, 'images/baliAdiwanaUnagiSuites4.jpg'),
  Hotel("Eastin Ashta Resort Canggu", 115, 3, 'images/baliEastinAshtaResortCanggu3.jpg'),
  Hotel("Padma Resort Ubud", 3400, 5, 'images/baliPadmaResortUbud5.jpg')
];
List<Hotel>austriaHotels=[
  Hotel("Der Wilhelmshof", 190, 4, 'images/austriaDerWilhelmshof4.jpg'),
  Hotel("Falkensteiner Schlosshotel Velden", 330, 5, 'images/austriaFalkensteinerSchlosshotelVelden5.jpg'),
  Hotel("Hotel Pension Bloberger Hof", 150, 3, 'images/austriaHotelPensionBlobergerHof3.jpg')
];
List<Hotel>greeceHotels=[
  Hotel("Canaves Epitome", 300, 5, 'images/greeceCanavesEpitome5.jpg'),
  Hotel("Porto Veneziano Hotel", 155, 3, 'images/greecePortoVenezianoHotel3.jpg'),
  Hotel("The Athens Gate Hotel", 210, 4, 'images/greeceTheAthensGateHotel4.jpg')
];