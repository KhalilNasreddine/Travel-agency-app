import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'buy.dart';
import 'country.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';

class RestaurantsView extends StatefulWidget {
  final int position;

  RestaurantsView({required this.position,Key? key}) : super(key: key);

  @override
  State<RestaurantsView> createState() => _RestaurantsViewState();
}

class _RestaurantsViewState extends State<RestaurantsView> {
  @override
  Widget build(BuildContext context) {
    int pos = widget.position;

    return Scaffold(
      appBar: AppBar(
        title: Text('Best Restaurants In '+countries[pos].name, style: TextStyle(fontSize: 30),),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                colors: [
                  Colors.deepOrange,
                  Colors.deepOrangeAccent,
                  Colors.orange,
                  Colors.orangeAccent
                ]
            )
        ),
        child: ListView.builder(
          itemCount: countries[pos].restaurants.length,
          itemBuilder: (context, index){
            return Column(
              children:[Card(
                child: Column(
                  children: [

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        countries[pos].restaurants[index].name,
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Image.asset(countries[pos].restaurants[index].image, height: 250, width: 250),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        countries[pos].restaurants[index].name,
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: 'MENU',
                              style: TextStyle(color: Colors.white),
                              recognizer: TapGestureRecognizer()..onTap =() async{
                                var url = countries[pos].restaurants[index].menu;
                                if (await canLaunch(url)) {
                                  await launch(url);
                                } else {
                                  throw 'Could not launch $url';
                                }
                              }

                          ),
                        ],
                      ),
                    ),


                    SizedBox(height: 10,)
                  ],
                ),
              ),
                SizedBox(height: 15,)],);



          },
        ),
      ),
    );
  }
}
