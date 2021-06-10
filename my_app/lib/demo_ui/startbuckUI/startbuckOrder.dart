import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:get/get.dart';
import 'package:my_app/demo_ui/startbuckUI/featuredPage.dart';
import 'package:my_app/demo_ui/startbuckUI/menuOrderPage.dart';
import 'package:my_app/demo_ui/startbuckUI/previousPage.dart';

class StartBuckOrder extends StatefulWidget {
  @override
  _StartBuckOrderState createState() => _StartBuckOrderState();
}

class _StartBuckOrderState extends State<StartBuckOrder> {
  final _MenuTabs = [
    new Tab(
      text: 'menu'.tr,
    ),
    new Tab(
      text: 'featured'.tr,
    ),
    new Tab(
      text: 'previous'.tr,
    ),
  ];

  final _MenuPage = [
    MenuOrderPage(),
    FeatureOrderPage(),
    PreviousOrderPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _MenuTabs.length,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            Container(
              padding: EdgeInsets.only(right: 0),
              child: ButtonTheme(
                // ignore: deprecated_member_use
                child: FlatButton(
                  onPressed: () {},
                  child: Icon(
                    Icons.search,
                    color: HexColor('#5E5E5E'),
                  ),
                ),
              ),
            )
          ],
        ),
        body: SafeArea(
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                textOrder(),
                TabBar(
                  indicatorColor: HexColor('#05B06C'),
                  labelColor: Colors.black,
                  labelStyle:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  tabs: _MenuTabs,
                ),
                Expanded(
                  child: TabBarView(
                    children: _MenuPage,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget textOrder() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(top: 8, left: 20, right: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'text_order'.tr,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
