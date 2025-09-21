import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider1/prov/bottom_nav_provider.dart';
import 'package:provider1/screens/counter_screen.dart';
import 'package:provider1/screens/favorite_app/favorite_screen.dart';
import 'package:provider1/screens/slider_screen.dart';

class BottonNavScreen extends StatelessWidget {
  List screens = [CounterScreen(), SliderScreen(), FavoriteScreen()];

  BottonNavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BottomNavProvider>(context);
    return Scaffold(
      body: screens[provider.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,
        currentIndex: provider.currentIndex,
        onTap: (index) {
          provider.changeIndex(index);
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.add), label: "Counter"),
          BottomNavigationBarItem(
            icon: Icon(Icons.slideshow_rounded),
            label: "Slider",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favorite App",
          ),
        ],
      ),
    );
  }
}
