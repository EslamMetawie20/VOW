import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class search extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<search> {
  DateTime? selectedDate;
  TextEditingController _nameController = TextEditingController();
  TextEditingController _locationController = TextEditingController();
  TextEditingController _appointmentsController = TextEditingController();
  TextEditingController _averagePayController = TextEditingController();

  // Define a TextStyle for bold text
  final TextStyle boldTextStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _nameController,
                style: boldTextStyle,
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                  labelText: 'Hall name',
                  prefixIcon: Icon(
                    Icons.drive_file_rename_outline,
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _locationController,
                style: boldTextStyle,
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                  labelText: 'the Address',
                  prefixIcon: Icon(
                    Icons.location_on_outlined,
                  ),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: ElevatedButton(
                      onPressed: () {
                        // Open the map to choose location
                        // You can use a package like 'google_maps_flutter' for this
                        // Add the map integration code here
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.pinkAccent, // Change this to the desired background color
                        onPrimary: Colors.white, // Change this to the desired text color
                        alignment: AlignmentDirectional.centerEnd,
                      ),
                      child: Column(
                        children: [
                          Text(
                            'choose fro,',
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.right,
                          ),
                          Text(
                            'the Maps',
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.right,
                          ),
                        ],
                      ),
                    ),
                  ),

                    border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () async {
                        DateTime? picked = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2101),
                          initialDatePickerMode: DatePickerMode.day,
                        );
                        if (picked != null) {
                          setState(() {
                            selectedDate = picked;
                          });
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          border: Border.all(), // Use Border.all() for a simple border
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.calendar_today),
                            SizedBox(width: 10),
                            Text(
                              selectedDate != null
                                  ? DateFormat('yyyy-MM-dd').format(selectedDate!)
                                  : 'Appointment',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),


            SizedBox(height: 16),
              TextFormField(
                controller: _averagePayController,
                style: boldTextStyle,
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                  labelText: 'Price',
                  prefixIcon: Icon(
                    Icons.attach_money_outlined,
                  ),
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Your button press logic
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.pinkAccent, // Change this to the desired color
                  ),
                  child: Text(
                    'Search',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
