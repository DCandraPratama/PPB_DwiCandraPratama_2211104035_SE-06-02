import 'package:flutter/material.dart';
import 'package:pertemuan6/my_package.dart';
import 'package:pertemuan6/my_tabbar.dart';

class MyNavBar extends StatefulWidget {
  const MyNavBar({super.key});

  @override
  State<MyNavBar> createState() => _MyNavBarState();
}

class _MyNavBarState extends State<MyNavBar> {
  int _selectedIndex = 0;

  void _onTappedItem(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> _pages = <Widget>[
    const MyTabbar(),
    const MyPackage(),
    const MyPackage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bottom Navigation Bar"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_max_rounded),
            label: 'My TabBar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.adb_rounded),
            label: 'My Package 1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_activity_rounded),
            label: 'My Package 2',
          ),
        ],
        selectedItemColor: Colors.yellow,
        currentIndex: _selectedIndex,
        onTap: _onTappedItem,
        selectedFontSize: 20,
      ),
    );
  }
}
