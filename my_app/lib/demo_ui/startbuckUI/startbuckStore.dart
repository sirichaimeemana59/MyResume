import 'package:flutter/material.dart';

class StartBuckStore extends StatefulWidget {
  @override
  _StartBuckStoreState createState() => _StartBuckStoreState();
}

class _StartBuckStoreState extends State<StartBuckStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Text('Store'),
      bottomNavigationBar: Container(
        //padding: EdgeInsets.only(right: 8),
        width: MediaQuery.of(context).size.width,
        height: 55,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // MenuNavigation(),
          ],
        ),
      ),
    );
  }
}
