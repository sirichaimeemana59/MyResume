import 'package:flutter/material.dart';

class HomeUIDesign extends StatefulWidget {
  @override
  _HomeUIDesignState createState() => _HomeUIDesignState();
}

class _HomeUIDesignState extends State<HomeUIDesign> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red.shade900,
          elevation: 0, //None Border Appbar
        ),
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.red.shade900,
            ),
            child: Center(
                child: ListView(
              children: [
                showLogo(),
                SizedBox(
                  height: 96,
                ),
                //Text("UI SIRICHAI"),
                showButton(),
                SizedBox(
                  height: 200,
                ),
                textHelp(),
              ],
            )),
          ),
        ));
  }

  Widget showButton() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          loginButton(),
          SizedBox(
            height: 34,
          ),
          Text(
            "ยังไม่มีบัญชี SIRICHAI ใช่หรือไม่?",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          SizedBox(
            height: 8,
          ),
          registerButton(),
        ],
      ),
    );
  }

  Widget loginButton() {
    return ButtonTheme(
        minWidth: 276,
        height: 52,
        // ignore: deprecated_member_use
        child: RaisedButton(
            color: Colors.red.shade900,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(26),
                side: BorderSide(color: Colors.white)),
            child: Text(
              "เข้าใช้งาน",
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            onPressed: () {}));
  }

  Widget registerButton() {
    return ButtonTheme(
        minWidth: 276,
        height: 52,
        // ignore: deprecated_member_use
        child: RaisedButton(
            color: Colors.yellow.shade600,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(26),
                side: BorderSide(color: Colors.yellow.shade600)),
            child: Text(
              "สมัครเข้าใช้งาน",
              style: TextStyle(color: Colors.red.shade900, fontSize: 25),
            ),
            onPressed: () {}));
  }

  Widget showLogo() {
    return Container(
      width: 250,
      height: 250,
      child: Image.asset("images/dog.png"),
    );
  }

  Widget textHelp() {
    return Container(
        padding: EdgeInsets.all(17),
        child: Row(
          children: [
            Text(
              "ต้องการความช่วยเหลือ คลิก",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            SizedBox(
              width: 145,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(7),
              child: Image.asset(
                "images/TH.png",
                width: 30,
                height: 21,
              ),
            ),
          ],
        ));
  }
}
