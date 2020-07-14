import 'package:flutter/material.dart';
import 'package:lifeline/screens/home_screen.dart';
import 'package:lifeline/screens/news.dart';
import 'package:lifeline/screens/screens.dart';


class BottomNavScreen extends StatefulWidget {
  @override
  _BottomNavScreenState createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  final List _screens = [
    HomeScreen(),
    StatsScreen(),
    Map(),
    News(),
    Scaffold(),
  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color.fromRGBO(10, 108, 158, 1),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Color.fromRGBO(10, 108, 158, 1),
        unselectedItemColor: Colors.white,
        items: [Icons.home, Icons.insert_chart, Icons.map, Icons.assignment, Icons.info]
                .asMap()
                .map((key,value) => MapEntry(
                    key,
                    BottomNavigationBarItem(
                      title: Text(''),
                      icon: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 6.0,
                          horizontal: 16.0,
                        ),
                        decoration: BoxDecoration(
                          color: _currentIndex == key
                            ? Colors.white
                            : Colors.transparent,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Icon(value),
                       ),
                    ),))
            .values
            .toList(),
      ),
    );
  }
}
