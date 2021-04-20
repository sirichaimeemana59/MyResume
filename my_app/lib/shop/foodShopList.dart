import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FoodShopList extends StatefulWidget {
  @override
  _FoodShopListState createState() => _FoodShopListState();
}

class _FoodShopListState extends State<FoodShopList> {
  //Valiable
  List foodList = [];
  //End Valiable
  //setState
  void initState() {
    super.initState();
    this.fetchFoodList(null);
  }

  //End setState
  //Connect API
  fetchFoodList(id) async {
    var response = await http.get(
      Uri.http('127.0.0.1:8000', '/user_list_food_shop/' + "$id"),
    );
    //print(response.body);
    if (response.statusCode == 200) {
      var status = json.decode(response.body)['status'];
      var items = json.decode(response.body)['food'];
      //print('id' + status);
      if (status == 0) {
        //print('object');
        if (mounted)
          setState(() {
            foodList = [];
          });
      } else {
        if (mounted)
          setState(() {
            foodList = items;
          });
      }
    } else {
      setState(() {
        foodList = [];
      });
    }
  }

  //End Connect
  //List View
  Widget getbody() {
    return ListView.builder(
        itemCount: foodList.length,
        itemBuilder: (context, index) {
          return getCard(foodList[index]);
        });
  }

  Widget getCard(item) {
    var nameTH = item['name_th'];
    //var nameEN = item['name_en'];
    var price = item['price'].toString();
    var detailTH = item['detail_th'];
    //var detailEN = item['detail_en'];
    //var id = item['id'];
    //var idFood = item['id_food'];
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListTile(
          title: Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                    //color: Colors.blue.shade400,
                    //image: DecorationImage(image: photo),
                    borderRadius: BorderRadius.circular(60 / 2),
                    // ignore: missing_required_param
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('images/fastFood.png'),
                      //image: NetworkImage(
                      //'https://pupuphooray.com/wp-content/uploads/2019/03/dog-icon.png'),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 140,
                      child: Text("Food Name : " + nameTH),
                    ),
                    SizedBox(height: 8.0),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 140,
                      child: Text("Detail : " + detailTH),
                    ),
                    SizedBox(height: 8.0),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 140,
                      child: Text("Price : " + price),
                    ),
                    SizedBox(height: 8.0),
                    ButtonBar(
                      children: [
                        // ignore: deprecated_member_use
                        FlatButton(
                            child: Text('Edit'),
                            onPressed: () async {
                              // String id = id.toString();
                              //var response = await http.get(Uri.http(
                              //'127.0.0.1:8000',
                              //'/user_get_detail_pets/' + '$_id'));
                              //var name = 'toet';

                              //var itemsPets =
                              //json.decode(response.body)['data'];
                              //print(itemsPets['name']);
                              //var materialPageRoute = MaterialPageRoute(
                              //builder: (context) => EditPetsForm(),
                              //settings: RouteSettings(arguments: _id));
                              //Navigator.push(context, materialPageRoute);
                            }),
                        // ignore: deprecated_member_use
                        FlatButton(
                            child: Text('Delete'),
                            onPressed: () {
                              //deletePetsDetail(id);
                            })
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  //End view

  @override
  Widget build(BuildContext context) {
    final idShop = ModalRoute.of(context).settings.arguments;
    fetchFoodList(idShop.toString());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow.shade800,
        title: Text('foodShop'),
        actions: [],
      ),
      body: getbody(),
    );
  }
}
