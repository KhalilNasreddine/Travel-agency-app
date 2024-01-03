class Restaurant{
  final String _name;
  final String _image;
  final String _menu;
  Restaurant(this._name, this._image, this._menu);
  String get name=>_name;
  String get image=>_image;
  String get menu=>_menu;
}
List<Restaurant> austriaRestaurants=[
  Restaurant("Blue Mustard", "images/austriaBlueMustard.jpg", "https://l.instagram.com/?u=http%3A%2F%2Fwww.bluemustard.at%2F%3Ffbclid%3DPAAabdy8NZYhbD7kGapqsNr0ktqqDty9rXTZIRSBkyUZ2iIu6psZ-8Vr1WQXQ_aem_AfTQ86LYDnBJ8lYCqcl_V_8W3crhjl-qPDfCAKEcRRxDyKgZye2_-qk5xdh8JRRuFPc&e=AT1kLddDwJvvsyS3-E5wnlMyEuaSliM-dKLptNHSqBGHdIvLccBGl4X3XI7XhjQRkfdt14V0tydYRix1aFohaoGopVNcK4IjyPCctBMKOnlMG8O0Wtg9LHtM0gG-8aLcxqo"),
  Restaurant("Cuisino Casino Restaurant", "images/austriaCuisinoCasinoRestaurant.jpg", "https://www.casinos.at/fileadmin/00_Casinos/11_Casinos/08_Salzburg/01_Gastronomie/menuekarte-sa-de-dezember-2023.pdf"),
  Restaurant("Imlauer Sky Bar Restaurant", "images/austriaImlauerSkyBarRestaurant.jpg", "https://imlauer.com/imlauer-sky-bar-restaurant/wp-content/uploads/sites/3/2023/10/Standardkarte-IMLAUER_ab-09.10.23.pdf")
];
List<Restaurant> baliRestaurants=[
  Restaurant("Cucina", "images/baliCucina.jph", "https://sofitelbalinusadua.com/wp-content/uploads/2022/08/Menu-CUCINA-Sofitel-Bali-Nusa-Dua-Beach-Resort.pdf"),
  Restaurant("Kayuputi", "images/baliKayuputi.jpg", "https://linktr.ee/Kayuputih.Family.Reflexology?fbclid=PAAabcWXkAkdDDM8bwDGLNYE6ubeCX8Gk4t5K4VieS8J_xgVutuIZ4Dg2BXU0_aem_ARumKMl0kAjiJ5kzL5PrI9Ww5zKYqwGhXGlRYyi-1sF02w9WB5cawe7_LXHSJSmV6so"),
  Restaurant("Kubu Restaurant", "images/baliKubuRestaurant.jpg", "https://kububalibaik.com/")
];
List<Restaurant> greeceRestaurants=[
  Restaurant("Nammos Restaurants", "images/greeceNammosRestaurants.jpg", "https://www.nammos.com/?fbclid=PAAaa84wOI115V3cWi-guTbO2WYVZCkurMiuBJdjp9ZcMz_W6BiGofQUR7sQ8_aem_ARv025H6_jZeFsnIj9lPcxBEbfcBSO88qcs9XUxICoE2IP3GmbQOvd8ir1bAgyJkb6g"),
  Restaurant("Varoulko Restaurant", "images/greeceVaroulkoRestaurant.jpg", "https://www.varoulko.gr/menu/"),
  Restaurant("Santoro", "images/greeceSantoro.jpg", "https://linktr.ee/Santororistorante?utm_source=linktree_profile_share&ltsid=98fd12ca-83f2-491e-beba-24d458711efc")
];
List<Restaurant> italyRestaurants=[
  Restaurant("Grotta Palazzese", "images/italyGrottaPalazzese.jpg", "https://www.grottapalazzese.it/wp-content/menu-grotta-palazzese.pdf"),
  Restaurant("Mistral Restaurant", "images/italyMistralRestaurant.jpg", "https://mistralbistro.com/reopening-menu/"),
  Restaurant("Monaco Hotel Restaurant", "images/italyMonacoHotel.jpg", "https://cdn2.me-qr.com/pdf/19382070.pdf?fbclid=PAAabCMUma2rKgAOkgQsBrniiSoXIooM95J6nQ3RpnrPs4vdmnsAJ_Xr0zJI_aem_AfRU4y-ELuHlJ8nmaNQZMV9RNBAxNKOdZeZqeMA-0Q9_D-1_GRNW5K2TtMRNr7HqpA")
];
List<Restaurant> maldivesRestaurants=[
  Restaurant("Azzuro Restaurant", "images/maldivesAzzuroRestaurant.jpg", "https://online.fliphtml5.com/tgffq/keip/#p=1"),
  Restaurant("Subsix Restaurant", "images/maldivesSubsixRestaurant.jpg", "https://www.niyama.com/uploads/minor/anantara/documents/niyama/restaurant/edge/edge_dining_menu_niyama_private_islands_maldives_july_2023.pdf"),
  Restaurant("Itha Undersea Restaurant", "images/maldivesIthaaUnderseaRestaurant.jpg", "https://drive.google.com/file/d/1Qm9trMirUUhdaABMB00_mqwgX3W9gBjc/view")
];
List<Restaurant> turkeyRestaurants=[
  Restaurant("Deniz Restaurant", "images/turkeyDenizRestaurant.jpg", "https://denizturkishrestaurant.ie/#ourmenu"),
  Restaurant("Mikla", "images/turekyMikla.jpg", "https://www.miklarestaurant.com/en"),
  Restaurant("Seki Restaurant", "images/turkeySekiRestaurant.jpg", "https://www.argosincappadocia.com/docs/newmenus/seki_aksam_yemek_eng_fiyatsız_QR_270923.pdf")
];