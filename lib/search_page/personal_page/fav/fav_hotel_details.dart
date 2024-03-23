import 'package:flutter/material.dart';
import 'package:vow2/hall_data/hall_data.dart';
import 'package:vow2/search_page/menu/hall_in_menu.dart';

class FavHotelDetailsCard extends StatelessWidget {
  final Hotel hotel;
  final VoidCallback onRemove;

  FavHotelDetailsCard({required this.hotel, required this.onRemove});

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
              builder: (context) => hall_in_menu(hotel: hotel),
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
                      hotel.imagePaths[0],
                      height: 50,
                      width: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        hotel.name,
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Icon(Icons.location_on),
                          SizedBox(width: 5),
                          Text(
                            hotel.address,
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: onRemove,
                    icon: Icon(
                      Icons.favorite,
                      color: Colors.red,
                      size: 25,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  for (int i = 0; i < hotel.stars; i++)
                    Icon(Icons.star, color: Colors.yellow),
                ],
              ),
              SizedBox(height: 5),
              Text(
                "Rating : ${hotel.rating}",
                style: TextStyle(fontSize: 16),
                maxLines: 1,
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
