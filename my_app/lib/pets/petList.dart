import 'dart:convert';
import 'dart:async';
import 'dart:io';
//import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/cleass_model/petsModel.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_app/pets/editPets.dart';
//import 'package:image_cropper/image_cropper.dart';

class PetControler extends StatefulWidget {
  @override
  _PetControlerState createState() => _PetControlerState();
}

//Class todo return data to anther page
class Todo {
  final String name;
  final String age;
  final String photo;
  final String note;
  Todo(this.name, this.age, this.note, this.photo);
}
//End Class

class _PetControlerState extends State<PetControler> {
//Create valiable and form validate
  final formKey = GlobalKey<FormState>();
  String nameString, ageString, noteString, photoString;
  List pets = []; //สร้างไว้เพื่อรับข้อมูลรายการสัตว์
  List petsDetail = [];
  bool isLoading = false;

  //File
  File file;

  get index => null;
  //dynamic _pickImageError;
  //bool isVideo = false;
  //final ImagePicker _picker = ImagePicker();
  //Endfile
  void initState() {
    //Get State
    super.initState();
    this.fetchPets();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow.shade600,
        title: Text('Pet Family'),
        actions: [
          submitButton(),
        ],
      ),
      body: getbody(),
    );
  }

  Widget getbody() {
    return ListView.builder(
        itemCount: pets.length,
        itemBuilder: (context, index) {
          return getCard(pets[index]);
        });
  }

  Widget getCard(item) {
    var name = item['name'];
    var age = item['age'];
    var photo = item['photo'];
    var note = item['note'];
    var id = item['id_pet'];
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListTile(
          title: Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                    //color: Colors.blue.shade400,
                    //image: DecorationImage(image: photo),
                    borderRadius: BorderRadius.circular(60 / 2),
                    // ignore: missing_required_param
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('images/dog.png'),
                      //image: NetworkImage(
                      //'https://pupuphooray.com/wp-content/uploads/2019/03/dog-icon.png'),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 140,
                      child: Text("Name : " + name),
                    ),
                    SizedBox(height: 8.0),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 140,
                      child: Text("Age : " + age),
                    ),
                    SizedBox(height: 8.0),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 140,
                      child: Text("Photo : " + photo),
                    ),
                    SizedBox(height: 8.0),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 140,
                      child: Text("Note : " + note),
                    ),
                    ButtonBar(
                      children: [
                        // ignore: deprecated_member_use
                        FlatButton(
                            child: Text('Edit'),
                            onPressed: () async {
                              String _id = id.toString();
                              var response = await http.get(Uri.http(
                                  '127.0.0.1:8000',
                                  '/user_get_detail_pets/' + '$_id'));
                              var itemsPets =
                                  json.decode(response.body)['data'];
                              print(itemsPets);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => EditPetsForm(),
                                      settings: RouteSettings(
                                        arguments: [itemsPets[index]],
                                      )));
                            }),
                        // ignore: deprecated_member_use
                        FlatButton(
                            child: Text('Delete'),
                            onPressed: () {
                              deletePetsDetail(id);
                            })
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  //Button
  Widget submitButton() {
    return IconButton(
        icon: Icon(Icons.pets),
        onPressed: () async {
          //print('You Click save');
          formCreateAlertDialog(context);
          //if (formKey.currentState.validate()) {
          // formKey.currentState.save();
          //final String name = nameString;
          //final String email = emailString;
          ///final String password = passwordString;
          //print('name= $nameString, lname= $lnameString, phone= $phoneString,dob= $dobString, password= $passwordString');
          //createUser(name, email, password);

          // setState(() {
          //   _user = user;
          // });
          //}
        });
  }

  //Make popup step
//Popup Login Success
  formCreateAlertDialog(BuildContext context) async {
    //popupRegisterController registerController = popupRegisterController();
    return await showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              content: Form(
                key: formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    nameText(),
                    ageText(),
                    //cameraButton(),
                    //galleryButton(),
                    photoText(),
                    noteText(),
                  ],
                ),
              ),
              title: Center(child: Text('Create pets family')),
              //content: SingleChildScrollView(
              //scrollDirection: Axis.horizontal,
              //),
              actions: [
                MaterialButton(
                  elevation: 5.0,
                  child: Text('Cancel'),
                  onPressed: () {
                    MaterialPageRoute materialPageRoute = MaterialPageRoute(
                        builder: (BuildContext context) => PetControler());
                    Navigator.of(context).push(
                        materialPageRoute); //การสร้าง Route เพื่อเปิดหน้าใหม่
                  },
                ),
                MaterialButton(
                  elevation: 5.0,
                  child: Text('OK'),
                  onPressed: () async {
                    //print('You click me');
                    if (formKey.currentState.validate()) {
                      formKey.currentState.save();
                      final String name = nameString;
                      final String age = ageString;
                      final String photo = photoString;
                      final String note = noteString;
                      createPets(name, age, photo, note);
                      //print(nameString);
                    }
                  },
                )
              ],
            );
          });
        });
  }

//End Popup

//Widget Input form
  Widget nameText() {
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

  Widget ageText() {
    return TextFormField(
      decoration: InputDecoration(
        icon: Icon(Icons.calendar_today, color: Colors.blue.shade800),
        labelText: 'Displays Age',
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
  Widget photoText() {
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

  Widget noteText() {
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
                nameText(),
                ageText(),
                photoText(),
                noteText(),
              ],
            ),
          )),
    );
  }

  //API Create pets
  // ignore: missing_return
  Future<PestModel> createPets(
      //สร้าง Future เพื่อเรียก UserModel และส่งไปสรเาง User
      String name,
      String age,
      String photo,
      note) async {
    //final String apiCreateUser = "http://127.0.0.1:8000/user_create_user";

    var response = await http.post(
        Uri.http('127.0.0.1:8000', '/user_create_pets'),
        body: {"name": name, "age": age, "photo": photo, "note": note});
    if (response.statusCode == 200) {
      print('success');
      //contentPopup();
      //createAlertDialog(context);
      MaterialPageRoute materialPageRoute =
          MaterialPageRoute(builder: (BuildContext context) => PetControler());
      Navigator.of(context).push(materialPageRoute);
    } else {
      print('Error');
    }
  }

  //end API Create pets

  //API Get data and fetch
  fetchPets() async {
    var response = await http.get(Uri.http('127.0.0.1:8000', '/user_lit_pets'));
    if (response.statusCode == 200) {
      var items = json.decode(response.body);
      //print(items);
      setState(() {
        pets = items;
      });
    } else {
      setState(() {
        pets = [];
      });
    }
    //print(userAccountFromJson(response.body));
  }

  //End fetch

  //API Get data detail pets and fetch
  fetchPetsDetail(id) async {
    String _id = id.toString();
    //print(id);
    // String _id = id;
    var response = await http
        .get(Uri.http('127.0.0.1:8000', '/user_get_detail_pets/' + '$_id'));
    if (response.statusCode == 200) {
      var itemsPets = json.decode(response.body)['data'];

      //print(itemsPets.name);
      setState(() {
        //petsDetail = itemsPets;
      });

      MaterialPageRoute materialPageRoute = MaterialPageRoute(
          builder: (BuildContext context) => EditPetsForm(),
          settings: RouteSettings(arguments: itemsPets[context]));
      Navigator.of(context).push(materialPageRoute);

      //var id = null;
    } else {
      setState(() {
        petsDetail = [];
      });
    }
    //print(userAccountFromJson(response.body));
  }

  //End fetch
  //API delete data detail pets
  deletePetsDetail(id) async {
    String _id = id.toString();
    //print(id);
    // String _id = id;
    var response = await http
        .get(Uri.http('127.0.0.1:8000', '/user_delete_detail_pets/' + '$_id'));
    if (response.statusCode == 200) {
      MaterialPageRoute materialPageRoute =
          MaterialPageRoute(builder: (BuildContext context) => PetControler());
      Navigator.of(context).push(materialPageRoute);
    } else {
      setState(() {
        petsDetail = [];
      });
    }
    //print(userAccountFromJson(response.body));
  }

  //End fetch

}
