import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class StartBuckStore extends StatefulWidget {
  @override
  _StartBuckStoreState createState() => _StartBuckStoreState();
}

class _StartBuckStoreState extends State<StartBuckStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            cardprofileDetail(),
          ],
        ),
      ),
    ));
  }

  Widget cardprofileDetail() {
    return Container(
        padding: EdgeInsets.only(left: 8, top: 70, bottom: 14, right: 8),
        color: HexColor('#FFD602'),
        width: MediaQuery.of(context).size.width,
        height: 200,
        child: Stack(
          children: [
            Column(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //crossAxisAlignment: CrossAxisAlignment.end,
              //children: [
              //Row(
              children: [
                imageProfile(),
                SizedBox(
                  height: 20,
                ),
                topSlideMenu(),
                Text('data'),
              ],
            ),
          ],
          //],
          //),
        ));
  }

  Widget imageProfile() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 43,
          height: 43,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/dog.png"),
              fit: BoxFit.cover,
            ),
            color: Colors.black,
            borderRadius: BorderRadius.circular(22),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'ร้านค้าเจริญเล็งพาณิชย์ \n(เล็ง)',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '123456 สมาชิกค้าส่ง',
              style: TextStyle(
                fontSize: 10,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        // SizedBox(
        //   width: 8,
        // ),
        Row(
          // mainAxisAlignment: MainAxisAlignment.start,
          //crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            //textProfileDetail(),
            pointProfile(),
          ],
        )
      ],
    );
  }

  Widget textProfileDetail() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'ร้านค้าเจริญเล็งพาณิชย์ \n(เล็ง)',
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '123456 สมาชิกค้าส่ง',
            style: TextStyle(
              fontSize: 10,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget pointProfile() {
    return Container(
      width: 150,
      height: 56,
      padding: EdgeInsets.only(left: 20, right: 8, top: 9),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          pointDetail(),
          Icon(
            Icons.arrow_forward_ios,
            color: HexColor('#EF5765'),
          )
        ],
      ),
    );
  }

  Widget pointDetail() {
    return Container(
      child: Column(
        children: [
          Text(
            '1,567.68',
            style: TextStyle(
              fontSize: 16,
              color: HexColor('#EF5765'),
            ),
          ),
          Text('คะแนนสะสม'),
        ],
      ),
    );
  }

  Widget topSlideMenu() {
    return Container(
      width: MediaQuery.of(context).size.width * 9,
      height: 120,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 1,
            offset: Offset(0.1, 10),
          )
        ],
      ),
      child: Expanded(
          child: Row(
        children: [
          Text('data'),
        ],
      )),
    );
  }
}
