// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:profile_app/Utils/utils.dart';
import 'package:profile_app/Utils/widget_to_image.dart';
import 'package:profile_app/screens/share_page.dart';

class ProfilePage extends StatefulWidget {
  String name, phone, email;
  ProfilePage(
      {this.name = "Joud",
      this.phone = "0598770066",
      this.email = "Jeem.jamask@gmail.com"});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Color themeColor = Colors.blue;

  void changeColor({required Color color}) {
    setState(() {
      themeColor = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    Uint8List? imageBytes;
    WidgetToImage? imageWidget;
    GlobalKey? globalKey;

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
            ProfileWidget(widget: widget, themeColor: themeColor),
            SizedBox(height: 15.0),

            //  Reem
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 15)),
              onPressed: () async {
                //  1

                final imageBytes = await Utils.capture(globalKey!);
                print('globalKey: $globalKey');
                print('imageBytes: $imageBytes');
                print('imageWidget: $imageWidget');

                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => SharePage(
                    imageBytes: imageBytes!,
                    imageWidget: imageWidget!,
                  ),
                ));
              },
              child: const Text(
                'Share My Profile',
                style: TextStyle(fontSize: 18),
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
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({
    Key? key,
    required this.widget,
    required this.themeColor,
  }) : super(key: key);

  final ProfilePage widget;
  final Color themeColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 85.0,
          backgroundImage: AssetImage('images/dash.jpg'),
        ),
        const SizedBox(height: 10.0),
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
              Text(
                widget.name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
              ),
              SizedBox(height: 15.0),
              Container(
                margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.phone,
                      size: 20.0,
                      color: themeColor,
                    ),
                    Text(
                      widget.phone,
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.email,
                      size: 20.0,
                      color: themeColor,
                    ),
                    Text(
                      widget.email,
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

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