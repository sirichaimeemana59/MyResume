import 'package:flutter/material.dart';
import 'package:my_app/user/user.dart';
//import 'dart:convert' as convert;

import 'register.dart';
//import 'package:flutter/services.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
//Method

  Widget showLogo() {
    //สร้าง Widget เพื่อนำไปใช้ใน SafeArea
    return Container(
      width: 120.0,
      height: 120.0,
      child: Image.asset('images/resume.png'),
    );
  }

  Widget showAppName() {
    //สร้าง Widget เพื่อนำไปใช้ใน SafeArea
    return Text(
      'My Resume',
      style: TextStyle(
        fontSize: 30.0,
        color: Colors.blue.shade700,
        fontWeight: FontWeight.bold,
        fontFamily: 'Arvo',
      ),
    );
  }

  Widget singInButton() {
    // ignore: deprecated_member_use
    return RaisedButton(
      color: Colors.blue.shade800,
      child: Text('Sign In', style: TextStyle(color: Colors.white)),
      onPressed: () {},
    );
  }

  Widget registerButton() {
    // ignore: deprecated_member_use
    return RaisedButton(
      color: Colors.green.shade700,
      child: Text('Register', style: TextStyle(color: Colors.white)),
      onPressed: () {
        //print('You Click');

        MaterialPageRoute materialPageRoute =
            MaterialPageRoute(builder: (BuildContext context) => Register());
        Navigator.of(context)
            .push(materialPageRoute); //การสร้าง Route เพื่อเปิดหน้าใหม่
      },
    );
  }

  Widget apiTestButton() {
    return IconButton(
      icon: Icon(Icons.cloud_upload),
      onPressed: () {
        MaterialPageRoute materialPageRoute =
            MaterialPageRoute(builder: (BuildContext context) => UserList());
        Navigator.of(context)
            .push(materialPageRoute); //การสร้าง Route เพื่อเปิดหน้าใหม่
      },
    );
  }

  Widget showButton() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        singInButton(),
        SizedBox(
          width: 8.0,
        ),
        registerButton(),
        SizedBox(
          width: 8.0,
        ),
        apiTestButton()
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //สร้าง Object ให้อยู่ใน View
      body: SafeArea(
          //SafeArea เก็บวัตถุได้เพียง 1 ตัว และมีค่าเป็น child
          //child: showAppName(),
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
          //     //User Column เรียงวัตถุจากบนลงล่าง
          child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('images/background1.png'),
          fit: BoxFit.cover,
        )),
        child: Center(
          //     //set วัตถุให้อยู่กึ่งกลาง
          child: Column(
            mainAxisSize: MainAxisSize.min, //ปรับวัตถให้อยู่กึ่งกลางหน้าจอ
            children: [
              showAppName(),
              SizedBox(
                height: 8.0,
              ),
              showButton(),
            ],
          ),
        ),
      )),
      // end Column
      //User row เรียงวัตถุจาซ้ายไปขวา
      //     child: Row(
      //   children: [showAppName(), showAppName(), showAppName(), showAppName()],
      // )),
      // end row
    );
  }
}
