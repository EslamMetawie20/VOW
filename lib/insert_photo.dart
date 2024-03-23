import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'; // Add this import statement

import 'design/vow_appbar.dart';
import 'hall_descrebtion.dart';

class InsertPhoto extends StatefulWidget {
  @override
  _InsertPhotoState createState() => _InsertPhotoState();
}

class _InsertPhotoState extends State<InsertPhoto> {
  List<File> _images = [];

  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker(); // Create an instance of ImagePicker
    final pickedFile = await picker.getImage(source: source); // Use getImage method

    if (pickedFile != null) {
      setState(() {
        _images.add(File(pickedFile.path));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(context: context),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              itemCount: _images.length,
              itemBuilder: (context, index) {
                return Image.file(
                  _images[index],
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text(
                      "اختار الصورة",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            _pickImage(ImageSource.camera);
                            Navigator.pop(context);
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(Colors.pinkAccent),
                            fixedSize: MaterialStateProperty.all<Size>(Size(150, 50)),
                          ),
                          child: Text(
                            "الكاميرا",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                          ),
                        ),
                        SizedBox(height: 10,),
                        ElevatedButton(
                          onPressed: () {
                            _pickImage(ImageSource.gallery);
                            Navigator.pop(context);
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(Colors.pinkAccent),
                            fixedSize: MaterialStateProperty.all<Size>(Size(150, 50)),
                          ),
                          child: Text(
                            "معرض الصور",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                        ),
                      ],
                    ),
                    contentPadding: EdgeInsets.all(10.0),
                  );
                },
              );
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.pinkAccent),
            ),
            child: Text("اضافة صورة", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white)),
          ),

          SizedBox(height: 10,),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DescriptionPage()),
              );
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.pinkAccent),
              fixedSize: MaterialStateProperty.all<Size>(Size(150, 50)),
            ),
            child: Text(
              "التالي",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
