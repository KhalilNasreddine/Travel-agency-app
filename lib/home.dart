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
      body:
          Container(
            color: Color.fromRGBO(255, 255, 255, 1),
      child: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Center( child: Column(
          children: [

            const SizedBox(height: 20,),
            Image.asset('images/logo1.png', width: 350, height: 350,),
            const SizedBox(height:20),
            const Text("             Welcome To Your Application,\n"
                       "       We Are Here To Help You In Everything,\n"
                       "    You Just Have To Enter Using Your Account\n"
                       "And We'll Take Care Of You And Your Wanderlust", style: TextStyle(fontSize: 20),),
            SizedBox(height: 30,),
            /*IconButton(onPressed: (){}
                , icon: Icon(Icons.login),
            iconSize: 70,
            )*/
            Text("Already Have An Acount?"),
            Container(
              width: 150,
            height: 50,
            child: ElevatedButton.icon(onPressed: (){},
                //child: const Text("Log in", style: TextStyle(fontSize: 15),),
              label: Text("Sign In", style: TextStyle(fontSize: 25),),
              icon: Icon(Icons.login),

            ),
            ),
            const SizedBox(height: 20,),
            Text("I'm a new user"),
            Container(
              width: 150,
              height: 50,
              child: ElevatedButton.icon(onPressed: (){},
                //child: const Text("Log in", style: TextStyle(fontSize: 15),),
                label: Text("Sign up ", style: TextStyle(fontSize: 25),),
                icon: Icon(Icons.create),

              ),
            ),
          ]
        )
        ),
      ),),
    );
  }
}