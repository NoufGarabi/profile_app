// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color themeColor = Colors.blue;

  void changeColor({required Color color}) {
    setState(() {
      themeColor = color;
    });
  }

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
                        '+966 55 123 456',
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
                  SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: themeColor,
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 15)),
                    onPressed: () => Navigator.pushNamed(context, 'share'),
                    child: Text(
                      'Share',
                      style: TextStyle(fontSize: 18),
                    ),
                  )
                ],
              ),
            ),
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
            )
          ],
        ),
      ),
    );
  }
}

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
