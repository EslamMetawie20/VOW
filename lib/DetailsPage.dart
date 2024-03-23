import 'package:flutter/material.dart';
import 'WelcomePage.dart';
import 'design/vow_appbar.dart';

class DetailsPage extends StatefulWidget {
  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(context: context),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              RichText(
                text: TextSpan(
                  style: TextStyle(fontSize: 18.0, color: Colors.black),
                  children: [
                    TextSpan(text: "The application is designed as a wedding venue reservation system. It enables users to access comprehensive information about various event venues, facilitating online payments and communication with venue owners. By clicking the "),
                    TextSpan(
                      text: "(Book now)",
                      style: TextStyle(fontSize: 21.0, fontWeight: FontWeight.bold, decoration: TextDecoration.underline),
                    ),
                    TextSpan(text: " button, users can explore available venues and search for specific ones. The "),
                    TextSpan(
                      text: "(Owner)",
                      style: TextStyle(fontSize: 21.0, fontWeight: FontWeight.bold, decoration: TextDecoration.underline),
                    ),
                    TextSpan(text: " button indicates ownership of a venue or hotel, allowing users to publish and promote their own event spaces."),
                  ],
                ),
              ),

              SizedBox(height: 16.0),
              Directionality(
                textDirection: TextDirection.rtl,
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(fontSize: 18.0, color: Colors.black),
                    children: [
                      TextSpan(text: "تم تصميم التطبيق كنظام لحجز قاعات الفرح. يتيح للمستخدمين الوصول إلى معلومات شاملة حول مختلف أماكن الفعاليات، مما يسهل عمليات الدفع عبر الإنترنت والتواصل مع أصحاب القاعات. من خلال النقر على زر"),
                      TextSpan(
                        text: "(Book now)",
                        style: TextStyle(fontSize: 21.0, fontWeight: FontWeight.bold, decoration: TextDecoration.underline),
                      ),
                      TextSpan(text: " يمكن للمستخدمين استعراض القاعات المتاحة والبحث عن قاعة محددة. زر "),
                      TextSpan(
                        text: "(Owner)",
                        style: TextStyle(fontSize: 21.0, fontWeight: FontWeight.bold, decoration: TextDecoration.underline),
                      ),
                      TextSpan(text: "  يشير إلى امتلاك مكان أو فندق، مما يسمح للمستخدمين بنشر وترويج مساحات الفعاليات الخاصة بهم."),
                    ],
                  ),
                ),
              ),

              /* Directionality(
                textDirection: TextDirection.rtl,
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(fontSize: 16.0, color: Colors.black),
                    children: [
                      TextSpan(text: arabicText),
                      TextSpan(text: arabicText.substring(arabicText.indexOf("button") + 6)), // Continue the text after "button"
                    ],
                  ),
                ),
              ),*/

            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => WelcomePage()),
          );
        },
        child: Icon(Icons.keyboard_return),
      ),
    );
  }
}
