import 'package:flutter/material.dart';
import 'package:vow2/user_login.dart';
import 'DetailsPage.dart';
import 'design/vow_appbar.dart';
import 'owner1.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white, // Change background color
        appBar: MyAppBar(context: context,),
        body:Container(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.only(top: 60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 250,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('lib/design/photo.png'),
                      fit: BoxFit.contain, // or BoxFit.cover based on your preference
                    ),
                  ),
                ),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.pinkAccent,
                    onPrimary: Colors.white,
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    fixedSize: Size(200, 60), // Hier die gewünschte Breite und Höhe angeben
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => user_login()),
                    );
                  },
                  child: Text(
                    "Book now",
                    style: TextStyle(fontSize: 35),
                    textAlign: TextAlign.center, // Text in der Mitte ausrichten
                  ),
                ),
                SizedBox(height: 10), // Increase spacing
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.pinkAccent,
                    onPrimary: Colors.white,
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    fixedSize: Size(200, 60), // Hier die gleiche Breite und Höhe wie oben angeben
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => owner1()),
                    );
                  },
                  child: Text(
                    "Owner",
                    style: TextStyle(fontSize: 35),
                  ),
                ),
              ],
            ),
          ),
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
              MaterialPageRoute(builder: (context) => DetailsPage()),
            );
          },
          child: Icon(Icons.question_mark),
        ),
      ),
    );
  }
}
