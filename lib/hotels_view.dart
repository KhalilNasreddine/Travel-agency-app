import 'package:flutter/material.dart';
import 'buy.dart';
import 'country.dart';
class HotelsView extends StatefulWidget {
  final int position;
  final String username;
  HotelsView({required this.position, required this.username,Key? key}) : super(key: key);

  @override
  State<HotelsView> createState() => _HotelsViewState();
}

class _HotelsViewState extends State<HotelsView> {
  @override
  Widget build(BuildContext context) {
    int pos = widget.position;
    String u=widget.username;
    return Scaffold(
      appBar: AppBar(
        title: Text('Best Hotels In '+countries[pos].name, style: TextStyle(fontSize: 30),),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                colors: [
                  Colors.blueAccent,
                  Colors.blue,
                  Colors.lightBlue,
                  Colors.lightBlueAccent
                ]
            )
        ),
        child: ListView.builder(
          itemCount: countries[pos].hotels.length,
          itemBuilder: (context, index){
            return Column(
              children:[Card(
                child: Column(
                  children: [

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        countries[pos].hotels[index].name,
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Image.asset(countries[pos].hotels[index].image, height: 250, width: 250),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        countries[pos].hotels[index].toString(),
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  Buy(cPosition: pos, hPosition: index, username: u)),

                        );
                      },
                      child: Text('Choose Hotel'),
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
