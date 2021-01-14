import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:punjabtourist/SignIn/SignIn.dart';

class DrawerScreen extends StatefulWidget {
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  PickedFile _image;
  final ImagePicker _picker = ImagePicker();

  void GetImage(ImageSource source) async {
    final pickedFile = await _picker.getImage(source: source);

    setState(() {
      _image = pickedFile;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      padding: EdgeInsets.only(top: 50, bottom: 70, left: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.topLeft,
                children: [
                  CircleAvatar(
                    backgroundImage: _image == null
                        ? AssetImage("assets/images/mine.jpg")
                        : FileImage(File(_image.path)),
                    radius: 50,
                  ),
                  Positioned(
                      bottom: 1,
                      right: 1,
                      child: InkWell(
                          onTap: () {
                            showModalBottomSheet(
                                context: context,
                                builder: ((builder) => BottomSheet(context)));
                          },
                          child: Icon(
                            Icons.camera_alt,
                            size: 28,
                          )))
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 7,
              ),
              Text(
                "Ruman ali",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: MediaQuery.of(context).size.height / 35),
              ),
            ],
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Profile'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.place_outlined),
            title: Text('Suggest place'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.image_sharp),
            title: Text('Contribute images'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.contacts),
            title: Text('Contact Us'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Log out'),
            onTap: () {
              _signOut();
            },
          ),
        ],
      ),
    );
  }

  Widget BottomSheet(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height / 5,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(children: [
          Text("choose profile photo",
              style: TextStyle(
                fontSize: 20.0,
              )),
          SizedBox(height: 20),
          Row(
            children: [
              FlatButton.icon(
                icon: Icon(Icons.camera),
                label: Text("Camera"),
                onPressed: () {
                  GetImage(ImageSource.camera);
                },
              ),
              FlatButton.icon(
                icon: Icon(Icons.image),
                label: Text("Gallery"),
                onPressed: () {
                  GetImage(ImageSource.gallery);
                },
              ),
            ],
          ),
        ]));
  }

  Future _signOut() async {
    User user = FirebaseAuth.instance.currentUser;
    FirebaseAuth.instance.signOut().then((value) => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return SignIn();
          }),
        ));
  }
}
