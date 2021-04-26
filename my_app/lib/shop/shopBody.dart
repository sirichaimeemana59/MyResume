import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_app/shop/categories.dart';
import 'package:http/http.dart' as http;

class ShopBody extends StatelessWidget {
  //Connect API
  fetchFoodData() async {
    var response = await http.get(
      Uri.http('127.0.0.1:8000', '/user_list_shop'),
    );

    if (response.statusCode == 200) {
      var items = json.decode(response.body)['shop'];
      var status = json.decode(response.body)['status'];
    }
  }
  //End Connect API

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
        ),
        SizedBox(
          height: 10,
        ),
        Categories(),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: GridView.builder(
            itemCount: 4,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 25,
              childAspectRatio: 0.75,
            ),
            itemBuilder: (context, index) => ItemCard(),
          ),
        )),
      ],
    );
  }
}

class ItemCard extends StatelessWidget {
  const ItemCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(10),
          //height: 180,
          //width: 160,
          decoration: BoxDecoration(
              color: Colors.blue.shade200,
              borderRadius: BorderRadius.circular(16)),
          child: Image.asset('images/dog.png'),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
            'Shop Name',
            style: TextStyle(color: Colors.blue.shade800),
          ),
        )
      ],
    );
  }
}
