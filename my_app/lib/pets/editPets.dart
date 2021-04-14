import 'package:flutter/material.dart';
import 'petList.dart';

class EditPetsForm extends StatefulWidget {
  @override
  _EditPetsFormState createState() => _EditPetsFormState();
}

class _EditPetsFormState extends State<EditPetsForm> {
  @override
  Widget build(BuildContext context) {
    final Todo dataPets = ModalRoute.of(context).settings.arguments;
    print(dataPets?.name);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow.shade600,
        title: Text('Pet Family'),
      ),
      body: ListView(
        children: [
          //Text(dataPets.name)
        ],
      ),
    );
  }
}
