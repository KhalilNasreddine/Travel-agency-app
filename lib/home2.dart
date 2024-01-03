import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'country.dart';
import 'login.dart';
import 'home3.dart';
class Home2 extends StatefulWidget {
  const Home2({required this.username ,super.key});
  final String username;
  @override
  State<Home2> createState() => _Home2State();
}

class _Home2State extends State<Home2> {

  @override

  Widget build(BuildContext context) {
    String u=widget.username;
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBar(actions: [
            IconButton(onPressed: () {
              setState(() {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LogIn()),
                );
                //Navigator.of(context).pop();
              });

            }, icon: const Icon(Icons.logout))
          ],
            title: const Text(
              'What\'s Beyond The Sun? ✈', style: TextStyle(fontSize: 20),),
            backgroundColor: Color.fromRGBO(255, 134, 25, 1),
            centerTitle: true,
          ),
        ),
        body: ListView.builder(
            itemCount: countries.length,
            itemBuilder: (context, index) {
              /*return Column(
                children: [
                  GestureDetector(child:
                  Container(

                    child: Column(
                      children: [
                        Text(countries[index].toString(),
                          style: TextStyle(fontSize: 25),),
                        Image.asset(
                          countries[index].flag, height: 350, width: 350,),
                      ],
                    ),
                  ),
                    onTap: () {
                      setState(() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Home3(position: index),
                          ),
                        );
                      });
                    },
                  ),
                ],t
              );*/
              return Column(
                children:[Card(
                  child: Column(
                    children: [

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          countries[index].name,
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Image.asset(countries[index].flag, height: 250, width: 250),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          countries[index].toString(),
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Home3(position: index, username: u  )),

                          );
                          // Handle button press for Card 1
                        },
                        child: Text('Choose Country'),
                      ),
                      SizedBox(height: 10,)
                    ],
                  ),
                ),
                  SizedBox(height: 15,)],);

            }
        )
    );
  }}