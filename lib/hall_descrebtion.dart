import 'package:flutter/material.dart';
import 'design/vow_appbar.dart';

class DescriptionPage extends StatelessWidget {
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: MyAppBar(context: context,),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            textDirection: TextDirection.rtl,
            children: [
              Text(
                'ادخل وصف للقاعة',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Container(
                height: 200, // Adjust the height as needed
                child: TextFormField(
                  controller: descriptionController,
                  maxLines: null, // Allows for multiple lines
                  decoration: InputDecoration(
                    hintText: 'اكتب الوصف هنا...',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // You can use the entered description as needed
                  String enteredDescription = descriptionController.text;
                  // Perform any actions needed with the entered description
                  // For example, you can print it to the console
                  print('Entered Description: $enteredDescription');

                  // You can navigate to the next page or perform any other actions
                  // For now, let's just show an alert dialog
                  showAlertDialog(context);
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.pinkAccent,
                ),
                child: Text(' التالي', style: TextStyle(fontSize: 25),),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('تم الإرسال بنجاح'),
          content: Text('تم استلام الوصف بنجاح.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('حسنًا'),
            ),
          ],
        );
      },
    );
  }
}