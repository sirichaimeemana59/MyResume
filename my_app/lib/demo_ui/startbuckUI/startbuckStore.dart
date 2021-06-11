import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:get/get.dart';

class StartBuckStore extends StatefulWidget {
  @override
  _StartBuckStoreState createState() => _StartBuckStoreState();
}

class ListMenu {
  String title;
  String icon;
  ListMenu(this.title, this.icon);
}

class _StartBuckStoreState extends State<StartBuckStore> {
  List<ListMenu> listMenuSlider = [
    ListMenu('news_menu'.tr, 'ac_unit'),
    ListMenu('promotion_menu'.tr, 'promotion'),
    ListMenu('benefit_ment'.tr, 'new'),
    ListMenu('gift_menu'.tr, 'new'),
    ListMenu('event_menu'.tr, 'new'),
    ListMenu('servey_menu'.tr, 'new'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        child: Stack(
          children: [
            Column(
              children: [
                cardprofileDetail(),
              ],
            ),
            Container(
              padding: EdgeInsets.only(left: 8, top: 120),
              child: Row(
                children: [
                  topSlideMenu(),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }

  Widget cardprofileDetail() {
    return Container(
      padding: EdgeInsets.only(left: 8, top: 28, bottom: 14, right: 8),
      color: HexColor('#FFD602'),
      width: MediaQuery.of(context).size.width,
      height: 170,
      child: Column(
        children: [
          imageProfile(),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
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
            'ร้านค้าเจริญเล็งพาณิชย์ (เล็ง)',
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width * 0.8,
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
      width: 120,
      height: 56,
      padding: EdgeInsets.only(left: 10, right: 8, top: 9),
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
      width: MediaQuery.of(context).size.width * 0.95,
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
      child: Column(
        children: [
          getListMenu(),
        ],
      ),
    );
  }

  Widget getListMenu() {
    return Container(
      child: Expanded(
        child: GridView.count(
          physics: ScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          crossAxisCount: 1,
          children: List.generate(
            listMenuSlider.length,
            (index) {
              ListMenu menuslide = listMenuSlider[index];
              return Container(
                padding: EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            color: HexColor('#C2DBF9'),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.ac_unit,
                                size: 40,
                                color: HexColor('#4ECAEB'),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          menuslide.title,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
