import 'package:flutter/material.dart';
import 'package:vow2/hall_data/hall_data.dart';
import 'package:vow2/search_page/menu/hall_in_menu.dart';
import 'package:vow2/search_page/personal_page/fav/favorites.dart';
import 'package:vow2/variable/variable_file.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: HotelList(
          hotels: getHotels(),
        ),
      ),
    );
  }
}

class HotelList extends StatelessWidget {
  final List<Hotel> hotels;

  HotelList({required this.hotels});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: hotels.length,
      itemExtent: 170,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(right: 10, left: 10),
          child: Column(
            children: [
              HotelDetailsCard(hotel: hotels[index]),
            ],
          ),
        );
      },
    );
  }
}
class HotelDetailsCard extends StatefulWidget {
  final Hotel hotel;

  HotelDetailsCard({required this.hotel});

  @override
  _HotelDetailsCardState createState() => _HotelDetailsCardState();
}

class _HotelDetailsCardState extends State<HotelDetailsCard> {


  Icon iconNotSaved = Icon(Icons.add, color: Colors.black);
  Icon iconSaved = Icon(Icons.check, color: Colors.black);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => hall_in_menu(hotel: widget.hotel),
            ),
          );
        },
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        widget.hotel.imagePaths[0],
                        height: 130,
                        width: 130,
                        fit: BoxFit.cover,
                      ),
                    ),
                  SizedBox(width: 10),
                  Expanded(
                    flex:4,
                    child: Container(
                      width: 300, // Set the desired width
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.hotel.name,
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              Icon(Icons.location_on),
                              SizedBox(width: 5),
                              Flexible(
                                child: Text(
                                  widget.hotel.address,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.blue, // لون الخلفية
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: EdgeInsets.all(10), // هامش داخلي
                            child: Text(
                              "Rating: ${widget.hotel.rating}",
                              style: TextStyle(fontSize: 15, color: Colors.white,),
                              maxLines: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Spacer(),
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              isSaved = !isSaved;
                              if (isSaved) {
                                Favorites.addToFavorites(widget.hotel);
                              } else {
                                Favorites.removeFromFavorites(widget.hotel);
                              }
                              final snackBarMessage =
                              isSaved ? 'Added to the Favorites' : 'Removed from the history';
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(snackBarMessage),
                                  duration: Duration(seconds: 1),
                                ),
                              );
                            });
                          },
                          icon: Icon(
                            Icons.favorite,
                            color: widget.hotel.isSaved ? Colors.red : Colors.grey,
                            size: 25,
                          ),
                        ),
                        Text(
                          widget.hotel.price.toString()+" £",
                          style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
