import 'package:flutter/material.dart';
import 'package:vow2/hall_data/hall_data.dart';
import 'package:vow2/search_page/menu/ImageViewerPage.dart';
import 'package:vow2/search_page/personal_page/fav/favorites.dart';
import 'package:vow2/variable/variable_file.dart';

class hall_in_menu extends StatefulWidget {
  final Hotel hotel;

  hall_in_menu({required this.hotel});

  @override
  _HotelCardState createState() => _HotelCardState();
}

class _HotelCardState extends State<hall_in_menu> {
  Icon iconNotSaved = Icon(Icons.add, color: Colors.black);
  Icon iconSaved = Icon(Icons.check, color: Colors.black);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  '${widget.hotel.name}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                    color: Colors.blue,
                  ),
                ),
                Spacer(),
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
              ],
            ),
            Row(
              children: [
                Row(
                  children: [
                    ...List.generate(
                      widget.hotel.stars.floor(),
                          (index) => Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 28,
                      ),
                    ),
                    ...List.generate(
                      (widget.hotel.rating - widget.hotel.stars).abs() >= 0.5
                          ? 1
                          : 0,
                          (index) => Icon(
                        Icons.star_half,
                        color: Colors.yellow,
                        size: 28,
                      ),
                    ),
                    ...List.generate(
                      (5 - widget.hotel.rating).toInt(),
                          (index) => Icon(
                        Icons.star_border,
                        color: Colors.grey,
                        size: 28,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Text(
                  '${widget.hotel.rating}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.blue,
                  ),
                ),
                SizedBox(
                  width: 5,
                )
              ],
            ),
            Text(
              ' the price : \$${widget.hotel.price.toStringAsFixed(2)} ',
              style: TextStyle(
                fontSize: 25,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ImageViewerPage(imagePaths: widget.hotel.imagePaths),
                  ),
                );
              },
              child: Row(
                children: [
                  Text(
                    "View images",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          for (int index = 0;
                          index < widget.hotel.imagePaths.length;
                          index++)
                            Visibility(
                              visible: widget.hotel.imagePaths[index].isNotEmpty &&
                                  index != 3,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 4),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Material(
                                    elevation: (index == 4) ? 4.0 : 0.0,
                                    child: Image.asset(
                                      widget.hotel.imagePaths[index],
                                      height: 50,
                                      width: 50,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                  },
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Address: ${widget.hotel.address}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
                Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.share),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Text(
                    "Description : ",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    ' ${widget.hotel.description} ',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
