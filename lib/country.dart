import 'package:flutter/material.dart';
import 'hotel.dart';
import 'restaurant.dart';
class Country{
  String _name;
  double _price;
  List<Hotel>_hotels;
  List<Restaurant>_restaurants;
  String _flag;
  String _text;
  Color _flagColor;
  Country(this._name, this._price, this._flag, this._flagColor, this._text, this._hotels, this._restaurants);
  String get name=>_name;
  String get flag=>_flag;
  double get price=>_price;
  String get text=>_text;
  Color get color=>_flagColor;
  List<Hotel> get hotels=>_hotels;
  List<Restaurant> get restaurants=>_restaurants;





  @override
  String toString(){
    return'Ticket For $name Costs: $price\$';
  }
  double updatePrice(int country, int hotel){
    return countries[country].price+countries[country].hotels[hotel].price;
  }

}
String turkeyText="Discover the enchanting beauty of Turkey, a captivating destination where ancient history and vibrant culture thrive. Immerse yourself in the bustling streets of Istanbul, where majestic landmarks like Hagia Sophia and the Blue Mosque leave you in awe. Explore the surreal landscapes of Cappadocia, with its fairy chimneys and hot air balloon rides. Uncover the ancient ruins of Ephesus and stroll along the breathtaking Turquoise Coast. Indulge in the tantalizing flavors of Turkish cuisine and experience the warm hospitality of the locals. Let our travel agency guide you through the wonders of Turkey and create unforgettable memories.";
String austriaText="Welcome to Austria, a country of breathtaking Alpine landscapes, rich history, and cultural elegance. Explore the charming streets of Vienna, the capital city, where imperial palaces, grand opera houses, and vibrant coffee houses create an atmosphere of refined charm. Immerse yourself in the musical heritage of Mozart and Strauss, attending classical concerts in world-renowned venues. Venture into the picturesque countryside and discover the stunning beauty of the Austrian Alps, where you can indulge in outdoor activities like skiing, hiking, and mountain biking. Visit the enchanting city of Salzburg, birthplace of Mozart, with its baroque architecture and captivating old town. Experience the warm hospitality of the Austrian people and savor delicious culinary delights, including famous pastries such as Sachertorte and apple strudel. Let our travel agency guide you through the wonders of Austria, where every moment is infused with beauty and cultural richness.";
String baliText="Welcome to Bali, a tropical paradise that captivates the senses with its stunning natural beauty and vibrant cultural heritage. Discover pristine white-sand beaches with crystal-clear turquoise waters, where you can relax and soak up the sun or try thrilling water sports like surfing and snorkeling. Immerse yourself in the spiritual atmosphere of ancient temples, such as the magnificent Uluwatu Temple perched atop dramatic cliffs. Explore the lush rice terraces of Ubud, a haven for artists and nature enthusiasts. Indulge in the aromatic flavors of Balinese cuisine, known for its rich spices and fresh ingredients. Experience the warm hospitality of the locals as you participate in traditional ceremonies and witness captivating cultural performances. Let our travel agency guide you through the wonders of Bali, where every moment is filled with serenity, adventure, and unforgettable experiences.";
String italyText="Benvenuti to Italy, a country renowned for its rich history, breathtaking landscapes, and exquisite cuisine. Explore the enchanting city of Rome, where ancient treasures like the Colosseum and the Roman Forum transport you back in time. Wander through the romantic canals of Venice, taking in the beauty of its iconic gondolas and Renaissance architecture. Immerse yourself in the artistic wonders of Florence, home to Michelangelo's David and the magnificent Duomo. Discover the charm of the Amalfi Coast, with its picturesque coastal villages and stunning views of the Mediterranean Sea. Indulge in the flavors of Italian cuisine, from authentic pizzas in Naples to gelato in Florence. Experience the warmth of Italian hospitality as you sip on fine wines in Tuscany or stroll through the vineyards of the Piedmont region. Let our travel agency guide you through the wonders of Italy, where every corner reveals a new chapter of history, culture, and beauty.";
String maldivesText="Welcome to the Maldives, a tropical paradise that embodies sheer luxury and natural beauty. Picture yourself surrounded by pristine white-sand beaches, crystal-clear turquoise waters, and vibrant coral reefs teeming with marine life. Immerse yourself in ultimate relaxation at luxurious overwater villas, where you can wake up to breathtaking ocean views and indulge in private infinity pools. Dive into the mesmerizing world beneath the waves, exploring vibrant coral gardens and swimming alongside majestic manta rays and colorful tropical fish. Unwind on secluded islands, where palm-fringed beaches invite you to bask in the sun and enjoy the gentle ocean breeze. Experience world-class spa treatments, delectable cuisine, and impeccable hospitality. Let our travel agency guide you to the Maldives, where you can escape to a tranquil haven of paradise, creating cherished memories that will last a lifetime.";
String greeceText="Kalos orisate to Greece, a land of ancient wonders, sun-drenched islands, and rich cultural heritage. Explore the iconic city of Athens, where the Acropolis stands majestically, offering a glimpse into the birthplace of democracy. Discover the enchanting Greek islands, such as Santorini with its breathtaking sunsets and pristine white-washed villages, or Mykonos with its vibrant nightlife and stunning beaches. Immerse yourself in the mythological tales of ancient ruins like the Temple of Apollo in Delphi or the Palace of Knossos in Crete. Indulge in the tantalizing flavors of Greek cuisine, from fresh seafood to savory moussaka and sweet baklava. Experience the warmth of Greek hospitality as you wander through charming villages and interact with friendly locals. Let our travel agency guide you through the treasures of Greece, where every step unveils a piece of history, scenic beauty, and unforgettable moments.";

Color austriaColor=Color.fromRGBO(198, 12, 48, 1);
Color baliColor=Color.fromRGBO(232, 93, 4,1);
Color greeceColor=Color.fromRGBO(0, 56, 168, 1);
Color italyColor=Color.fromRGBO(0, 146, 70, 1);
Color turkeyColor=Color.fromRGBO(227, 10, 23, 1);
Color maldivesColor=Color.fromRGBO(0, 122, 61, 1);

List<Country>countries=[
  Country('Austria', 600, 'images/austriaFlag.png', austriaColor, austriaText, austriaHotels, austriaRestaurants),
  Country('Bali', 800, 'images/baliFlag.png', baliColor, baliText, baliHotels, baliRestaurants),
  Country('Greece', 650, 'images/greeceFlag.png', greeceColor, greeceText, greeceHotels, greeceRestaurants),
  Country('Italy', 520, 'images/italyFlag.png', italyColor, italyText, italyHotels, italyRestaurants),
  Country('Turkey', 350, 'images/turkeyFlag.png', turkeyColor, turkeyText,turkeyHotels, turkeyRestaurants),
  Country('Maldives', 870, 'images/maldivesFlag.png', maldivesColor, maldivesText, maldivesHotels, maldivesRestaurants)
];
