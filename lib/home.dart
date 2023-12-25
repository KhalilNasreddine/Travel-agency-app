import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //String logo= 'assets/images/logo1.png';
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    if (MediaQuery.of(context).orientation == Orientation.landscape){
      screenWidth = screenWidth * 0.8;
    }
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBar(
          title: const Text('What\'s Beyond The Sun? ✈', style: TextStyle(fontSize: 20),),
          backgroundColor: Color.fromRGBO(255, 134, 25, 1),
          centerTitle: true,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Center( child: Column(
          children: [
            const SizedBox(height: 20,),
            Image.asset('images/logo1.png', width: 350, height: 350,),
            const SizedBox(height:40),
            IconButton(onPressed: (){}
                , icon: Icon(Icons.login),
            iconSize: 70,)
          ],
        )
        ),
      ),
    );
  }
}
