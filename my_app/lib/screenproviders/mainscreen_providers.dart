import 'package:flutter/material.dart';
import 'package:my_app/modelProviders/model_providers.dart';
import 'package:my_app/providers/transection/transection_providers.dart';
import 'package:my_app/screenproviders/formInsert_provider.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class MainScreenProviders extends StatefulWidget {
  @override
  _MainScreenProvidersState createState() => _MainScreenProvidersState();
}

class _MainScreenProvidersState extends State<MainScreenProviders> {
  void initState() {
    //ประกาศเมื่อต้องการให้ทำการตั้งแต่เริ่มต้น
    super.initState();
    Provider.of<TransectionProvider>(context, listen: false).initData();
  }

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        backgroundColor: Colors.blue,
        elevation: 0,
        actions: [
          MaterialButton(
            elevation: 5.0,
            child: Icon(Icons.add),
            onPressed: () {
              MaterialPageRoute materialPageRoute = MaterialPageRoute(
                  builder: (BuildContext context) => FormInsertProviders());
              Navigator.of(context).push(materialPageRoute);
            },
          )
        ],
      ),
      body: SafeArea(
        child: Container(
          child: Row(
            children: [
              consumerTransection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget consumerTransection() {
    return Consumer(
      //ประกาศ Consumer เพื่อรับค่า Provoider
      builder:
          (context, TransectionProvider transectionProvider, Widget child) {
        var count = transectionProvider.transections.length;
        if (count <= 0) {
          return Center(
            child: Text(
              "ไม่พบข้อมูล",
              style: TextStyle(fontSize: 35),
            ),
          );
        } else {
          return Expanded(
            child: ListView.builder(
                itemCount: transectionProvider.transections.length,
                itemBuilder: (context, index) {
                  Transections data = transectionProvider.transections[
                      index]; //เข้าถึงข้อมูล List จาก Model ทีละตัว
                  return Card(
                    margin: EdgeInsets.all(8),
                    child: Container(
                      padding: EdgeInsets.all(12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(data.title),
                              Text(data.amount.toString()),
                              Text(
                                DateFormat("dd/MM/yyyy").format(data.date),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              ButtonBar(
                                alignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  FlatButton(
                                    onPressed: () {
                                      //print(index);
                                      //getData(data.title.toString());
                                    },
                                    child: Column(
                                      children: [
                                        Icon(
                                          Icons.edit,
                                          color: Colors.amber.shade900,
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                }),
          );
        }
      },
    );
  }
}
