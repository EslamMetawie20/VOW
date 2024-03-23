import 'package:flutter/material.dart';

import 'design/vow_appbar.dart';
import 'owner_new_hall.dart';

class owner1 extends StatefulWidget {
  @override
  _owner1State createState() => _owner1State();
}

class _owner1State extends State<owner1> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isPasswordVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(context: context,),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              onFieldSubmitted: (String value) {
                print(value);
              },
              onChanged: (String value) {
                print(value);
              },
              decoration: InputDecoration(
                labelText: 'البريد الإلكتروني',
                prefixIcon: Icon(
                  Icons.email,
                ),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            TextFormField(
              controller: passwordController,
              keyboardType: TextInputType.visiblePassword,
              obscureText: isPasswordVisible,
              onFieldSubmitted: (String value) {
                print(value);
              },
              onChanged: (String value) {
                print(value);
              },
              decoration: InputDecoration(
                labelText: 'كلمة السر',
                prefixIcon: Icon(
                  Icons.lock,
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      isPasswordVisible = !isPasswordVisible;
                    });
                  },
                ),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              width: double.infinity,
              color: Colors.pinkAccent,
              child: MaterialButton(

                onPressed: () {
                  if (validateInputs(context)) {
                    // تحقق من البيانات وقم بالتسجيل إذا كانت صحيحة
                    print(emailController.text);
                    print(passwordController.text);
                    // TODO: Implement authentication logic here
                    // You can use emailController.text and passwordController.text for authentication
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => owner_new_hall()),
                    );
                  }
                },
                child: Text(
                  'تسجيل الدخول',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'هل لديك حساب؟',
                ),
                TextButton(
                  onPressed: () {
                    // TODO: Navigate to the registration page
                  },
                  child: Text(
                    'التسجيل الأن',style: TextStyle(color: Colors.pinkAccent),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  bool validateInputs(BuildContext context) {
    // تحقق من إدخال البريد الإلكتروني وكلمة المرور
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      // عرض رسالة تنبيه إذا لم يتم إدخال كل البيانات المطلوبة
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('تنبيه'),
            content: Text('الرجاء إدخال البريد الإلكتروني وكلمة المرور.'),
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
      return false; // إعادة القيمة false للإشارة إلى أن هناك بيانات مفقودة
    }
    return true; // إعادة القيمة true إذا تم إدخال كل البيانات المطلوبة
  }
}
