import 'package:flutter/material.dart';

import 'design/vow_appbar.dart';
import 'insert_photo.dart';

class owner_new_hall extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar:  MyAppBar(context: context,),
        body: ReservationForm(),
      ),
    );
  }
}

class ReservationForm extends StatefulWidget {
  @override
  _ReservationFormState createState() => _ReservationFormState();
}

class _ReservationFormState extends State<ReservationForm> {
  TextEditingController roomNameController = TextEditingController();
  TextEditingController roomLocationController = TextEditingController();
  TextEditingController seatCountController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  bool openAirSupport = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          textDirection: TextDirection.rtl, // تعيين اتجاه النص إلى اليمين
          children: [
            Text('أدخل بيانات الحجز:'),
            TextFormField(
              controller: roomNameController,
              decoration: InputDecoration(
                labelText: 'اسم القاعة',
                prefixIcon: Icon(Icons.drive_file_rename_outline),
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 16),
            TextFormField(
              controller: roomLocationController,
              decoration: InputDecoration(
                labelText: 'مكان القاعة',
                prefixIcon: Icon(Icons.location_on_outlined),
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 16),
            TextFormField(
              controller: seatCountController,
              decoration: InputDecoration(
                labelText: 'عدد الكراسي',
                prefixIcon: Icon(Icons.chair),
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),

            SizedBox(height: 16),
            TextFormField(
              controller: priceController,
              decoration: InputDecoration(
                labelText: 'السعر',
                prefixIcon: Icon(Icons.attach_money),
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            Row(
              children: [

                Checkbox(
                  value: openAirSupport,
                  onChanged: (value) {
                    setState(() {
                      openAirSupport = value ?? false;
                    });
                  },
                ),
                Text('هل تدعم open air؟'),
              ],
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => InsertPhoto()),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.pinkAccent, // Change this to the desired red color
              ),
              child: Text(' التالي'),
            ),

          ],
        ),
      ),
    );
  }

  void showAlertDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('تم الحجز بنجاح'),
          content: Text('تم استلام بيانات الحجز بنجاح.'),
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
