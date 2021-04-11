//import 'dart:convert';

import 'package:flutter/material.dart';
//import 'package:http/http.dart' as http;
//import 'package:my_app/cleass_model/userModel.dart';
//import 'package:dio/dio.dart';

class UserList extends StatefulWidget {
  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  void getUser() async {
    //var dio = Dio();
    //final response = await Dio().get('127.0.0.1:8000/mobile_user_list');
    //print(response.data.length);
    print("test");
  }

  @override
  Widget build(BuildContext context) {
    getUser();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow.shade600,
        title: Text('User'),
      ),
      body: SafeArea(
        child: Row(),
        // child: FutureBuilder<UserModel>(
        //   future: getUser(),
        //   builder: (context, snapshot) {
        //     if (snapshot.hasData) {
        //       // final user = snapshot.data;

        //       return Text("Name");
        //     } else if (snapshot.hasError) {
        //       return Text(snapshot.error.toString());
        //     }
        //     return CircularProgressIndicator();
        //   },
        // ),
      ),
    );
  }
}

// Future<UserModel> getUser() async {
//   //final url = 'http://127.0.0.1:8000/mobile_user_list';
//   final response =
//       await http.get(Uri.https('127.0.0.1:8000', '/mobile_user_list'));

//   if (response.statusCode == 200) {
//     String jsonUser = jsonDecode(response.body);
//     return UserModel.formJson(jsonUser);
//   } else {
//     throw Exception();
//   }
// }
