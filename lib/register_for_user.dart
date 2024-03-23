import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:vow2/user_login.dart';

import 'design/vow_appbar.dart';

class RegisterForUserPage extends StatefulWidget {
  @override
  _RegisterForUserPageState createState() => _RegisterForUserPageState();
}

class _RegisterForUserPageState extends State<RegisterForUserPage> {
  TextEditingController NameController = TextEditingController();
  TextEditingController FamilyNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordControllersicher = TextEditingController();
  bool isPasswordVisible = false;
  bool isPasswordVisible2 = false;
  bool w=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(context: context,),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: NameController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'First name',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              TextFormField(
                controller: FamilyNameController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Last name',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'E-mail',
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              TextFormField(
                controller: passwordController,
                keyboardType: TextInputType.visiblePassword,
                obscureText: !isPasswordVisible,
                decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock),
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
              TextFormField(
                controller: passwordControllersicher,
                keyboardType: TextInputType.visiblePassword,
                obscureText: !isPasswordVisible2,
                decoration: InputDecoration(
                  labelText: 'Repeat the password',
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(
                      isPasswordVisible2
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),

                    onPressed: () {
                      setState(() {
                        isPasswordVisible2 = !isPasswordVisible2;
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
                  onPressed: () async {
                    // Check if any of the text fields is empty
                    if (NameController.text.isEmpty ||
                        FamilyNameController.text.isEmpty ||
                        emailController.text.isEmpty ||
                        passwordController.text.isEmpty ||
                        passwordControllersicher.text.isEmpty) {
                      // Show an error dialog
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Error"),
                            content: Text("you have fill all the fields"),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text("okey"),
                              ),
                            ],
                          );
                        },
                      );
                      return;
                    }

                    // Check if passwords match
                    if (passwordController.text != passwordControllersicher.text) {
                      // Passwords do not match, show an error dialog
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Error"),
                            content: Text("The passwords are not equal"),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text("okey"),
                              ),
                            ],
                          );
                        },
                      );
                      return;
                    }

                    // Passwords match, continue with registration logic
                    DatabaseHelper databaseHelper = DatabaseHelper();

                    Map<String, dynamic> user = {
                      'Name': NameController.text,
                      'FamilyName': FamilyNameController.text,
                      'email': emailController.text,
                      'password': passwordController.text,
                    };

                    await databaseHelper.insertUser(user);

                    print('User registered successfully');
                    print(NameController.text);
                    print(FamilyNameController.text);
                    print(emailController.text);
                    print(passwordController.text);
                    // TODO: Implement user registration logic here
                    // You can use fullNameController.text, emailController.text, and passwordController.text for registration
                  },
                  child: Text(
                    'Register',
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
                    'Do you have an account?',
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => user_login()),
                    );
                    },
                    child: Text(
                      'Log in now',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// A helper class for managing the SQLite database related to user registration.
class DatabaseHelper {
  // Static variables for database instance and table name.
  static Database? _database;
  static const String tableName = 'users';

  // Asynchronous getter for the database instance.
  Future<Database> get database async {
    // If the database instance is already initialized, return it.
    if (_database != null) {
      return _database!;
    }

    // If the database instance is null, instantiate and initialize it.
    _database = await initDatabase();
    return _database!;
  }

  // Asynchronously initializes the database by creating a table if it doesn't exist.
  Future<Database> initDatabase() async {
    // Define the path for the SQLite database file.
    String path = join(await getDatabasesPath(), 'app_database.db');

    // Open the database and execute a CREATE TABLE SQL statement if it's the first version.
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          '''
          CREATE TABLE $tableName (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            Name TEXT,
            FamilyName TEXT,
            email TEXT,
            password TEXT
          )
          ''',
        );
      },
    );
  }

  // Asynchronously inserts user details into the 'users' table.
  Future<void> insertUser(Map<String, dynamic> user) async {
    // Get the database instance.
    Database db = await database;

    // Insert the user details into the 'users' table.
    await db.insert(tableName, user);
  }

  static removeFromFavorites(int id) {}
}
