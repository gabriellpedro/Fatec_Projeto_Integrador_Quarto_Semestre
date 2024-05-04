import 'package:flutter/material.dart';

class BottomNavigationPage extends StatefulWidget {
  const BottomNavigationPage({super.key});

  @override
  State<BottomNavigationPage> createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {
  int _selectIndex = 0;
  List<Widget> pages = [
    Container(
      color: Colors.red.shade100,
      alignment: Alignment.center,
      child: const Text('Favs'),
    ),
    Container(
      color: Colors.green.shade100,
      alignment: Alignment.center,
      child: const Text('Settings'),
    ),
    Container(
      color: Colors.deepPurple.shade100,
      alignment: Alignment.center,
      child: const Text('Home'),
    ),
    Container(
      color: Colors.pink.shade100,
      alignment: Alignment.center,
      child: const Text('User'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BottomNavigation'),
      ),
      body: Center(
        child: pages[_selectIndex],
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (index) {
          setState(() {
            _selectIndex = index;
          });
        },
        selectedIndex: _selectIndex,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.favorite_outlined),
            selectedIcon: Icon(Icons.favorite),
            label: 'Favs',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings_outlined),
            selectedIcon: Icon(Icons.feed),
            label: 'Settings',
          ),
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.verified_user_outlined),
            selectedIcon: Icon(Icons.verified_user),
            label: 'User',
          ),
        ],
      ),
    );
  }
}
