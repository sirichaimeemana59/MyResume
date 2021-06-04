import 'package:flutter/material.dart';
import 'package:my_app/demo_ui/startbuckUI/componentNavigation.dart';

class StartBuckCard extends StatefulWidget {
  @override
  _StartBuckCardState createState() => _StartBuckCardState();
}

class _StartBuckCardState extends State<StartBuckCard> {
  @override
  Widget build(BuildContext context) {
    //onClickMenu(1);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Text('Card'),
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
