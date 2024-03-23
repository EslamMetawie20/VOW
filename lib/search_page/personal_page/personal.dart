import 'package:flutter/material.dart';
import 'package:vow2/user_login.dart';
import 'package:vow2/search_page/personal_page/fav/favorites.dart';

class Personal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Personal Picture
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('lib/hallphoto/eslam.jpeg'),
              ),
              SizedBox(height: 16.0), // User Private Data
              Text(
                'Eslam Metawie',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              Text('Email: user@example.com'),
              Text('Phone: +123456789'),

              // Saved Halls Button
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FavoritesPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.pinkAccent, // Change this to the desired background color
                  onPrimary: Colors.white, // Change this to the desired text color
                ),
                child: Text(
                  'Favorites',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
              ),

// Angebote Button
              SizedBox(height: 10.0),
              ElevatedButton(
                onPressed: () {
                  // Implement logic for Angebote button
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.pinkAccent, // Change this to the desired background color
                  onPrimary: Colors.white, // Change this to the desired text color
                ),
                child: Text(
                  'Offers',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 10.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => user_login()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.white, // Change this to the desired background color
                  onPrimary: Colors.red, // Change this to the desired text color
                ),
                child: Text('Log out',style: TextStyle(fontWeight: FontWeight.bold),),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
