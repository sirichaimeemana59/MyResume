import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:my_app/demo_ui/startbuckUI/startbuckCard.dart';
import 'package:my_app/demo_ui/startbuckUI/startbuckHome.dart';
import 'package:my_app/demo_ui/startbuckUI/startbuckOrder.dart';
import 'package:my_app/demo_ui/startbuckUI/startbuckStore.dart';

class MainButtonMenu extends StatefulWidget {
  @override
  _MainButtonMenuState createState() => _MainButtonMenuState();
}

class NavigaList {
  String title;
  String image;
  var route;
  NavigaList(this.title, this.image, this.route);
}

class _MainButtonMenuState extends State<MainButtonMenu>
    with TickerProviderStateMixin {
  TabController _tabController;
  List<NavigaList> navigaList = [
    NavigaList("home".tr, "star.png", StartBuckUI()),
    NavigaList("card".tr, "creditcard.png", StartBuckCard()),
    NavigaList("order".tr, "coffee.png", StartBuckOrder()),
    NavigaList("stores".tr, "store.png", StartBuckStore()),
  ];
  //State
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: 4);
    _tabController.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: navigaList.length,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: TabBarView(
          children: [
            StartBuckUI(),
            StartBuckCard(),
            StartBuckOrder(),
            StartBuckStore(),
          ],
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(1.0),
              spreadRadius: 7,
              blurRadius: 5,
              offset: Offset(0, 5),
            ),
          ], color: Colors.white),
          height: 55,
          width: MediaQuery.of(context).size.width,
          child: TabBar(
            controller: _tabController,
            indicatorColor: HexColor('#ffffff'),
            unselectedLabelColor: HexColor('#808080'),
            tabs: [
              Tab(
                child: Column(
                  children: [
                    ImageIcon(
                      AssetImage("images/star.png"),
                      //color: HexColor('#05B06C'),
                      color: _tabController.index == 0
                          ? HexColor('#05B06C')
                          : HexColor('#808080'),
                    ),
                    Text(
                      "home".tr,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
              Tab(
                child: Column(
                  children: [
                    ImageIcon(
                      AssetImage("images/creditcard.png"),
                      //color: HexColor('#05B06C'),
                      color: _tabController.index == 1
                          ? HexColor('#05B06C')
                          : HexColor('#808080'),
                    ),
                    Text(
                      "card".tr,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    )
                  ],
                ),
              ),
              Tab(
                child: Column(
                  children: [
                    ImageIcon(
                      AssetImage("images/coffee.png"),
                      //color: HexColor('#05B06C'),
                      color: _tabController.index == 2
                          ? HexColor('#05B06C')
                          : HexColor('#808080'),
                    ),
                    Text(
                      "order".tr,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    )
                  ],
                ),
              ),
              Tab(
                child: Column(
                  children: [
                    ImageIcon(
                      AssetImage("images/store.png"),
                      //color: HexColor('#05B06C'),
                      color: _tabController.index == 3
                          ? HexColor('#05B06C')
                          : HexColor('#808080'),
                    ),
                    Text(
                      "stores".tr,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getTextView() {
    return GridView.count(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: navigaList.length,
      children: List.generate(4, (index) {
        NavigaList navigation = navigaList[index];
        return Row(
          children: [
            Text('${navigation.image}'),
          ],
        );
      }),
    );
  }
}
