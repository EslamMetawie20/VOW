import 'package:flutter/material.dart';
import 'package:vow2/search_page/menu/menu.dart';
import 'package:vow2/search_page/personal_page/personal.dart';
import 'package:vow2/search_page/search/search.dart';

import '../design/vow_appbar.dart';

class Browsing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BrowsingPage(),
    );
  }
}

class BrowsingPage extends StatefulWidget {
  @override
  _BrowsingPageState createState() => _BrowsingPageState();
}

class _BrowsingPageState extends State<BrowsingPage> {
  int _selectedIndex = 0;// Index for the middle icon (Search)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:MyAppBar(
        context: context,
        actions: [
          IconButton(
              onPressed: ()
              {
               /* Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => chat()),
                );*/
              }, icon: Icon(Icons.chat,color: Colors.white,))
        ],
      ),
      body: Center(
        child: _getPage(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Menu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Personal Page',
          ),
        ],currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: Colors.white, // Set the background color to purple
        selectedItemColor: Colors.pink, // Set the selected item color
        unselectedItemColor: Colors.grey,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _getPage(int index) {
    switch (index) {
      case 0:
      // Personal Page
        return Menu();
      case 1:
      // Search
        return search();
      case 2:
      // Menu
        return Personal();
      default:
        return Center(
          child: Text('Invalid Page'),
        );
    }
  }
}
