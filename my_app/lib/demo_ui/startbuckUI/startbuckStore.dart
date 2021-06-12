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
            Container(
              padding: EdgeInsets.only(top: 260),
              child: Column(
                children: [
                  contentNewsBox(),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 510),
              child: Column(
                children: [
                  contentBenefitBox(),
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

  Widget contentNewsBox() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(left: 12, top: 10, right: 12),
      height: 250,
      color: Colors.white,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('news_privilege'.tr),
              newsBoxSeeAll(),
            ],
          ),
        ],
      ),
    );
  }

  Widget newsBoxSeeAll() {
    return Container(
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'see_all'.tr,
                style: TextStyle(
                  color: HexColor('#53C6EB'),
                ),
              ),
              SizedBox(
                width: 4,
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: HexColor('#53C6EB'),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget contentBenefitBox() {
    return Container(
      width: MediaQuery.of(context).size.width,
      //padding: EdgeInsets.only(left: 12, top: 10, right: 12),
      height: 350,
      // color: Colors.black,
      child: Column(
        children: [
          benefitBox(),
          SizedBox(
            height: 15,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 250,
            //  color: Colors.red,
            child: Column(
              children: [
                getListBenefitMenu(),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget benefitBox() {
    return Container(
      padding: EdgeInsets.only(left: 12, top: 10, right: 12),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('benefit_recom'.tr),
              benefitBoxSeeAll(),
            ],
          )
        ],
      ),
    );
  }

  Widget benefitBoxSeeAll() {
    return Container(
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'see_all'.tr,
                style: TextStyle(
                  color: HexColor('#53C6EB'),
                ),
              ),
              SizedBox(
                width: 4,
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: HexColor('#53C6EB'),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget getListBenefitMenu() {
    return Container(
      child: Expanded(
        child: GridView.count(
          physics: ScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          crossAxisCount: 1,
          childAspectRatio: 2.0,
          children: List.generate(
            listMenuSlider.length,
            (index) {
              ListMenu menuslide = listMenuSlider[index];
              return Container(
                padding: EdgeInsets.only(left: 18, top: 18),
                width: 300,
                height: 300,
                //color: Colors.blue,
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Container(
                          width: 150,
                          height: 200,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(18),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade300,
                                blurRadius: 1,
                                offset: Offset(3, 2),
                              )
                            ],
                          ),
                          child: Container(
                            padding: EdgeInsets.only(top: 12),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  'images/dog.png',
                                  fit: BoxFit.cover,
                                  width: 100,
                                  height: 100,
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text('ชื่อสินค้า'),
                                Text('2,000'),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 15, left: 5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            width: 100,
                            height: 50,
                            decoration: BoxDecoration(
                              color: HexColor('#FFD602'),
                              borderRadius: BorderRadius.circular(18),
                              border: Border.all(color: Colors.black),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'trade_now'.tr,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
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
