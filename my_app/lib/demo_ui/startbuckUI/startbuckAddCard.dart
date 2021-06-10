import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:get/get.dart';
import 'package:my_app/demo_ui/startbuckUI/componentNavigation.dart';

class StarBucksAddCard extends StatefulWidget {
  @override
  _StarBucksAddCardState createState() => _StarBucksAddCardState();
}

class _StarBucksAddCardState extends State<StarBucksAddCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //automaticallyImplyLeading: true,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            //padding: EdgeInsets.only(left: 20, right: 18),
            child: Column(
              children: [
                textAddCard(),
                outlineShadow(),
                SizedBox(
                  height: 40,
                ),
                getCard(),
              ],
            ),
          ),
        ),
      ),
      // bottomNavigationBar: Container(
      //   //padding: EdgeInsets.only(right: 8),
      //   width: MediaQuery.of(context).size.width,
      //   height: 55,
      //   color: Colors.white,
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //     children: [
      //       MenuNavigation(),
      //     ],
      //   ),
      // ),
      floatingActionButton: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton.extended(
              onPressed: () {
                // Add your onPressed code here!
              },
              label: Text(
                'addcardNew'.tr,
                style: TextStyle(color: Colors.white),
              ),
              //icon: Icon(Icons.thumb_up),
              backgroundColor: HexColor('#00BB82'),
            ),
          ],
        ),
      ),
    );
  }

  Widget textAddCard() {
    return Container(
      padding: EdgeInsets.only(left: 20),
      child: Row(
        children: [
          Text(
            'addcard'.tr,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
          ),
        ],
      ),
    );
  }

  Widget outlineShadow() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 8,
      decoration: BoxDecoration(
        //color: Colors.black,
        //boxShadow: BoxShadow.lerp(2, 2, 2),
        boxShadow: [
          BoxShadow(
              color: HexColor('#C0C0C0'),
              offset: Offset(0.0, 20.0),
              blurRadius: 3.0)
        ],
      ),
    );
  }

  Widget getCard() {
    return Container(
      decoration: BoxDecoration(
        // image: DecorationImage(
        //image: AssetImage("images/strcard.png"),
        //fit: BoxFit.fill,
        //),
        color: HexColor('#FFFFFF'),
        borderRadius: BorderRadius.circular(9),
        boxShadow: [
          BoxShadow(
              color: HexColor('#C0C0C0'),
              offset: Offset(1.0, 8.0),
              blurRadius: 5.0)
        ],
      ),
      //padding: EdgeInsets.all(20),
      height: 211,
      width: MediaQuery.of(context).size.width - 28,
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: HexColor('#F9F9F9'),
                  borderRadius: BorderRadius.circular(9),
                ),
                width: 80,
                height: 211,
              ),
              Row(
                children: [
                  Padding(padding: EdgeInsets.all(4)),
                  Row(
                    children: [
                      Image.asset(
                        'images/startbuck.png',
                        width: 60,
                        height: 60,
                      ),
                      Container(
                        width: 250,
                        padding: EdgeInsets.only(left: 30),
                        child: Column(
                          children: [
                            textNumberCard(),
                            textNumberCardCSC(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.only(
                  top: 162,
                ),
                child: outlineGold(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget outlineGold() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 30,
      decoration: BoxDecoration(
        color: HexColor('#D4BD80'),
        //boxShadow: BoxShadow.lerp(2, 2, 2),
      ),
    );
  }

  Widget textNumberCard() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'numberCard'.tr,
        labelStyle:
            TextStyle(color: HexColor('#E3E3E3'), fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget textNumberCardCSC() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'scs'.tr,
        labelStyle:
            TextStyle(color: HexColor('#E3E3E3'), fontWeight: FontWeight.bold),
      ),
    );
  }
}
