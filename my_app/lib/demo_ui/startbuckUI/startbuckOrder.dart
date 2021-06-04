import 'package:flutter/material.dart';
import 'package:my_app/demo_ui/startbuckUI/componentNavigation.dart';

class StartBuckOrder extends StatefulWidget {
  @override
  _StartBuckOrderState createState() => _StartBuckOrderState();
}

class _StartBuckOrderState extends State<StartBuckOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Text('Order'),
      bottomNavigationBar: Container(
        //padding: EdgeInsets.only(right: 8),
        width: MediaQuery.of(context).size.width,
        height: 55,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MenuNavigation(),
          ],
        ),
      ),
    );
  }
}
