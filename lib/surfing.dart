import 'package:flutter/material.dart';

import 'design/vow_appbar.dart';

class SurfingGame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SurfingGameState(),
    );
  }
}

class SurfingGameState extends StatefulWidget {
  @override
  _SurfingGameState createState() => _SurfingGameState();
}

class _SurfingGameState extends State<SurfingGameState> {
  List<String> selectedImages = [];
  String displayText = "Welcome to My Game!";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(context: context,),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            displayText,
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Open a dialog or navigate to a new screen to select images
              // For simplicity, I'll add a sample image when the button is pressed
              setState(() {
                selectedImages.add("https://example.com/sample_image.jpg");
                displayText = "Image Added!";
              });
            },
            child: Text("Add Image"),
          ),
          SizedBox(height: 20),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              itemCount: selectedImages.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    // Handle image click if needed
                  },
                  child: Image.network(
                    selectedImages[index],
                    fit: BoxFit.cover,
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
