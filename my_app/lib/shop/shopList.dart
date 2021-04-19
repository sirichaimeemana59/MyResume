import 'package:flutter/material.dart';

class ShopList extends StatefulWidget {
  @override
  _ShopListState createState() => _ShopListState();
}

class _ShopListState extends State<ShopList> {
  //Widget
  Widget getBody() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 4,
      itemBuilder: (BuildContext context, int index) {
        return showCardBox();
      },
    );
  }

  Widget showCardBox() {
    return Container(
      width: 6.0,
      height: 230.0,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(0)),
      ),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          //child: Expanded(
          child: GridView.count(
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            crossAxisCount: 2,
            primary: false,
            children: [
              Container(
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation: 4,
                  //child: Padding(
                  // padding: const EdgeInsets.all(18.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage('images/shop.png'),
                        height: 100,
                      ),
                      Text(
                        'SHOP NAME',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              //),
            ],
          ),
        ),
      ),
      //),
    );
  }

  //End Widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow.shade800,
        title: Text('SHOP'),
        actions: [],
      ),
      body: getBody(),
    );
  }
}
