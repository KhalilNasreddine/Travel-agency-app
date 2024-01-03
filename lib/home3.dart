import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'hotels_view.dart';
import 'restaurants_view.dart';
import 'country.dart';

class Home3 extends StatefulWidget {
  final int position;
  final String username;
  Home3({required this.position, required this.username,Key? key}) : super(key: key);

  @override
  State<Home3> createState() => _Home3State();
}

class _Home3State extends State<Home3> {
  late PageController _pageController;
  int _currentIndex = 1;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int pos = widget.position;
    String u=widget.username;
    return Scaffold(

      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: [
          HotelsView(position: pos, username: u),
          Homee(position: pos),
          RestaurantsView(position: pos)

        ],
      ),
      bottomNavigationBar: GNav(
        backgroundColor: Colors.transparent,
        color: Colors.orange,
        activeColor: Colors.blue,
        tabBackgroundColor: Colors.white70,
        onTabChange: (index) {
          setState(() {
            _currentIndex = index;
            _pageController.animateToPage(
              index,
              duration: Duration(milliseconds: 300),
              curve: Curves.ease,
            );
          });
        },
        gap: 3,
        selectedIndex: _currentIndex,
        tabs: [
          GButton(icon: Icons.hotel, text: 'Hotels'),
          GButton(icon: Icons.home, text: 'Home Page'),
          GButton(icon: Icons.restaurant, text: 'Restaurants'),
        ],
      ),
    );
  }
}

class Homee extends StatefulWidget {
  final int position;
  const Homee({required this.position, Key? key}) : super(key: key);

  @override
  State<Homee> createState() => _HomeeState();
}

class _HomeeState extends State<Homee> {
  @override
  Widget build(BuildContext context) {
    int pos=widget.position;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: countries[pos].color,
        title: Text(
          countries[pos].name,
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Image.asset(countries[pos].flag, height: 250, width: 250,),
          Text(countries[pos].text, style: TextStyle(fontSize: 20),)
        ],
      ),
    );
  }
}
