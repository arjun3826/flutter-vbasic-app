// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ImagePicker picker = ImagePicker();
  String userPhotoPath = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/pexels-evie-shaffer-4004375.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.only(top: 80.0, left: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () async {
                      final XFile? image =
                          await picker.pickImage(source: ImageSource.gallery);
                      print(image?.path);
                      setState(() {
                        userPhotoPath = image!.path;
                      });
                    },
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        CircleAvatar(
                          radius: 60,
                          backgroundColor: Colors.green,
                          backgroundImage: ((userPhotoPath.isEmpty)
                                  ? AssetImage("images/buss1.jpg")
                                  : NetworkImage(userPhotoPath.toString()))
                              as ImageProvider,
                        ),
                        Positioned(
                          child: CircleAvatar(
                            backgroundColor: Colors.black45,
                            radius: 15,
                            child: Icon(
                              userPhotoPath.isEmpty ? Icons.upload : Icons.edit,
                              color: Colors.white,
                              size: 14,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Mr.Arjun",
                        style: TextStyle(
                          fontSize: 35,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "Designation",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      )
                    ],
                  )
                ],
              ),
              GestureDetector(
                child: Padding(
                  padding: EdgeInsets.only(left: 30, top: 50),
                  child: Column(
                    children: [
                      getProfileTile(Icons.computer, "My Computer", () {
                        print("My computer pressed");
                      }),
                      getProfileTile(Icons.location_pin, "Location", () {
                        print("My Location pressed");
                      }),
                      getProfileTile(Icons.email, "Message", () {}),
                      getProfileTile(Icons.phone, "Phone", () {}),
                      getProfileTile(Icons.school, "Education", () {}),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  "About Me this my first website so we want do somebody not fare fo r me do your best in the world so we want so your can not beat me sow knoow +",
                  style: TextStyle(fontSize: 22, color: Colors.white),
                ),
              ),
              Text(
                "Created by Mr. Arjun",
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }

  getProfileTile(IconData icon, String title, VoidCallback onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                icon,
                size: 40,
                color: Colors.white,
              ),
              SizedBox(
                width: 40,
              ),
              Text(title, style: TextStyle(fontSize: 20, color: Colors.white)),
            ],
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}
