import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
//import 'petList.dart';

class EditPetsForm extends StatefulWidget {
  //EditPetsForm(String name);

  @override
  _EditPetsFormState createState() => _EditPetsFormState();
}

class _EditPetsFormState extends State<EditPetsForm> {
  final formKey = GlobalKey<FormState>();
  // ignore: avoid_init_to_null
  String nameString = null,
      // ignore: avoid_init_to_null
      ageString = null,
      // ignore: avoid_init_to_null
      noteString = null,
      // ignore: avoid_init_to_null
      photoString = null;
  File file;

  List petsDetail = [];
  bool isLoading = false;
  void initState() {
    //Get State
    super.initState();
    this.fetchPetsDetail(null);
  }

  @override
  Widget build(BuildContext context) {
    final todo = ModalRoute.of(context).settings.arguments;
    fetchPetsDetail(todo);
    //print(dataPets?.name);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow.shade600,
        title: Text('Pet Family'),
      ),
      body: showForm(),
    );
  }

  Widget getbody() {
    return ListView.builder(
        itemCount: petsDetail.length,
        itemBuilder: (context, index) {
          return getListForm(petsDetail[index]);
        });
  }

  // ignore: missing_return
  Widget getListForm(item) {
    var name = item['name'];
    var age = item['age'];
    var photo = item['photo'];
    var note = item['note'];
    //var id = item['id_pet'];
    nameString = name;
    ageString = age;
    photoString = photo;
    noteString = note;
  }

  //API Get data detail pets and fetch
  fetchPetsDetail(todo) async {
    //print(todo);
    // String _id = id;
    var response = await http
        .get(Uri.http('127.0.0.1:8000', '/user_get_detail_pets/' + '$todo'));
    if (response.statusCode == 200) {
      var itemsPets = json.decode(response.body)['data'];

      //print(itemsPets);
      setState(() {
        petsDetail = itemsPets;
      });
      //var id = null;
    } else {
      setState(() {
        petsDetail = [];
      });
    }
    //print(userAccountFromJson(response.body));
  }

  //End fetch

  //Widget Input form
  Widget nameText(name) {
    return TextFormField(
      decoration: InputDecoration(
        icon: Icon(Icons.pets, color: Colors.blue.shade800),
        labelText: 'Displays Name',
        labelStyle: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
        helperText: 'Please input your name pets',
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Please Fill Your Name Pets';
        } else {
          return null;
        }
      },
      onSaved: (String value) {
        nameString = value.trim();
      },
    );
  }

  Widget ageText(age) {
    return TextFormField(
      decoration: InputDecoration(
        icon: Icon(Icons.calendar_today, color: Colors.blue.shade800),
        labelText: age,
        labelStyle: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
        helperText: 'Please input your age pets',
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Please Fill Your Age Pets';
        } else {
          return null;
        }
      },
      onSaved: (String value) {
        ageString = value.trim();
      },
    );
  }

//Brow image
  Widget cameraButton() {
    return IconButton(
        icon: Icon(
          Icons.photo_camera,
          size: 36.0,
          color: Colors.blue.shade600,
        ),
        onPressed: () {
          chooseImage(ImageSource.camera);
        });
  }

//End Brow image
//Brow image gallery
  Widget galleryButton() {
    return IconButton(
        icon: Icon(
          Icons.photo_album,
          size: 36.0,
          color: Colors.blue.shade600,
        ),
        onPressed: () {
          print('object');
          chooseImage(ImageSource.gallery);
        });
  }

  Future chooseImage(ImageSource imageSource) async {
    try {
      // ignore: invalid_use_of_visible_for_testing_member
      // var object = await ImagePicker.pickImage(
      //   source: imageSource,
      //   maxWidth: 800.0,
      //   maxHeight: 800.0,
      // );
      setState(() {
        //file = object;
      });
    } catch (e) {}
  }

//End Brow image
//Input file
  Widget uploadButton() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          // ignore: deprecated_member_use
          child: RaisedButton.icon(
              color: Colors.blue.shade600,
              onPressed: () {
                print('you click me');
                if (file == null) {
                  showAlertImage(
                      'Non Choose Photo Pets', 'Please select photo');
                }
              },
              icon: Icon(Icons.photo_camera),
              label: Text('Upload Image')),
        )
      ],
    );
  }

  Future showAlertImage(String title, String meeage) async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Text(meeage),
            actions: [
              // ignore: deprecated_member_use
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'))
            ],
          );
        });
  }

//End input file
  Widget photoText(photo) {
    return TextFormField(
      decoration: InputDecoration(
        icon: Icon(Icons.photo_camera, color: Colors.blue.shade800),
        labelText: 'Displays Photo',
        labelStyle: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
        helperText: 'Please input your Photo pets',
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Please Fill Your Photo Pets';
        } else {
          return null;
        }
      },
      onSaved: (String value) {
        photoString = value.trim();
      },
    );
  }

  Widget noteText(note) {
    return TextFormField(
      decoration: InputDecoration(
        icon: Icon(Icons.note, color: Colors.blue.shade800),
        labelText: 'Displays Note',
        labelStyle: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
        helperText: 'Please input your Note pets',
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Please Fill Your Note Pets';
        } else {
          return null;
        }
      },
      onSaved: (String value) {
        noteString = value.trim();
      },
    );
  }

  //Show form
  Widget showForm() {
    return Scaffold(
      body: Form(
          key: formKey,
          child: Center(
            child: ListView(
              padding: EdgeInsets.all(30.0),
              children: [
                nameText(nameString),
                ageText(ageString),
                photoText(photoString),
                noteText(noteString),
              ],
            ),
          )),
    );
  }
}
