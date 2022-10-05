// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // ==========| Joud Code |==========
  Color themeColor = Colors.blue;

  void changeColor({required Color color}) {
    setState(() {
      themeColor = color;
    });
  }
  // ==================================

  // ==========| Nouf Code |==========
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themeColor,
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          children: [
            CircleAvatar(
              radius: 95.0,
              backgroundImage: AssetImage('images/dash.jpg'),
            ),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 50),
              child: Column(
                children: [
                  const Text(
                    "Nouf Algarabi",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                  ),
                  SizedBox(height: 20),
                  Card(
                    elevation: 0,
                    margin:
                        EdgeInsets.symmetric(vertical: 5.0, horizontal: 25.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.phone,
                        color: themeColor,
                      ),
                      title: Text(
                        '+966 565 123 456',
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                  ),
                  Card(
                    elevation: 0,
                    margin:
                        EdgeInsets.symmetric(vertical: 5.0, horizontal: 25.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.email,
                        color: themeColor,
                      ),
                      title: Text(
                        'Nouf@gmail.com',
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // =============================

            // ==========| Joud Code |==========
            Spacer(),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ColorButton(color: Colors.green, changeColor: changeColor),
                  ColorButton(
                      color: Colors.redAccent, changeColor: changeColor),
                  ColorButton(color: Colors.blue, changeColor: changeColor)
                ],
              ),
            ),
            // ==============================
          ],
        ),
      ),
    );
  }
}

// ==========| Joud Code |==========

//  Creating custom widget
class ColorButton extends StatelessWidget {
  final Color color;
  final void Function({required Color color}) changeColor;
  const ColorButton(
      {super.key, required this.color, required this.changeColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => changeColor(color: color),
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
// ===================================