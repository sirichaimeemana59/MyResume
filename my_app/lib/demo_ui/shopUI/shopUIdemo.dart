import 'package:flutter/material.dart';
import 'package:my_app/cleass_model/shopModel.dart';

class ShopUIDemo extends StatefulWidget {
  @override
  _ShopUIDemoState createState() => _ShopUIDemoState();
}

class _ShopUIDemoState extends State<ShopUIDemo> {
  //กลุ่มข้อมูล
  List<ShopModel> shopList = [
    ShopModel("เขียง", "เอกมัย 2", "08:00", "18:00", "k.jpeg"),
    ShopModel("ตู้กับข้าว", "เอกมัย 3", "08:00", "18:00", "t.jpeg"),
    ShopModel("ร้านอาหาร สะพานควาย", "เอกมัย 4", "08:00", "18:00", "3.jpeg"),
    ShopModel("ร้านอาหาร ยศเส", "เอกมัย 5", "08:00", "18:00", "5.jpeg"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shop'),
        backgroundColor: Colors.red.shade900,
        elevation: 0,
      ),
      body: shopGridView(),
      // body: ListView.builder(
      //     itemCount: shopList.length,
      //     itemBuilder: (BuildContext context, int index) {
      //       ShopModel shop = shopList[index];
      //       return ListTile(
      //         title: Text("ร้าน : ${shop.name}"),
      //         subtitle: Text("ที่อยู่ : ${shop.address}"),
      //         //trailing: Text("ที่อยู่ : ${shop.address}"),
      //       );
      //     }),
    );
  }

  Widget shopGridView() {
    return MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemCount: shopList.length,
            itemBuilder: (BuildContext context, int index) {
              ShopModel shop = shopList[index];
              return Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                elevation: 7.0,
                child: Container(
                  width: 500,
                  color: Colors.grey.shade300,
                  child: Column(
                    children: [
                      Container(
                        width: 200,
                        height: 150,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: new AssetImage("images/${shop.image}"),
                            fit: BoxFit.fitHeight,
                          ),
                          //borderRadius: BorderRadius.circular(30.0),
                          color: Colors.red.shade100,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        "ร้าน : ${shop.name}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                        ),
                      ),
                      Text(
                        "เปิด : ${shop.timeOn} ปิด : ${shop.timeClosed}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }));
  }

  // Widget shopGridView() => GridView.extent(
  //     maxCrossAxisExtent: 150,
  //     padding: const EdgeInsets.all(4),
  //     mainAxisSpacing: 4,
  //     crossAxisSpacing: 4,
  //     children: _buildGridShopList(shopList.length, shopList.length));
  // List<Container> _buildGridShopList(int count, int index) => List.generate(
  //     count,
  //     (i) => Container(
  //           child: Center(
  //             child: Stack(
  //               children: [
  //                 Image.asset('images/dog.png'),
  //                 Text(
  //                   "ร้าน : ${null}",
  //                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
  //                   textAlign: TextAlign.center,
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ));
}
