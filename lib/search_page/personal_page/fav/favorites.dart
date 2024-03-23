import 'package:flutter/material.dart';
import 'package:vow2/design/vow_appbar.dart';
import 'package:vow2/hall_data/hall_data.dart';
import 'package:vow2/search_page/menu/hall_in_menu.dart';
import 'package:vow2/search_page/personal_page/fav/fav_hotel_details.dart';

class FavoritesPage extends StatefulWidget {
  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  Favorites favorites = Favorites(); // Initialize favorites with an instance of Favorites

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(context: context,),
      body: Column(
        children: [
          Text(
            "Favorites",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.pinkAccent,
              fontWeight: FontWeight.bold,
              fontSize: 38,
            ),
          ),
          Favorites.favoriteHotels?.isEmpty ?? true
              ? Center(
            child: Text(
              "You don't have any favorite hotels yet.",
              style: TextStyle(fontSize: 18),
            ),
          )
              : Expanded(
            child: ListView.builder(
              itemCount: Favorites.favoriteHotels.length,
              itemBuilder: (context, index) {
                Hotel hotel = Favorites.favoriteHotels[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => hall_in_menu(hotel: hotel),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: FavHotelDetailsCard(
                      hotel: hotel,
                      onRemove: () {
                        setState(() {
                          Favorites.removeFromFavorites(hotel);
                        });
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),

    );
  }
}

class Favorites {
  static List<Hotel> favoriteHotels = [];

  static void addToFavorites(Hotel hotel) {
    if (!favoriteHotels.contains(hotel)) {
      favoriteHotels.add(hotel);
      hotel.isSaved = true;
    }
  }

  static void removeFromFavorites(Hotel hotel) {
    if (favoriteHotels.contains(hotel)) {
      favoriteHotels.remove(hotel);
      hotel.isSaved = false;
    }
  }
}
