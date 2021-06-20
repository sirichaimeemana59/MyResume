import 'package:flutter/material.dart';
import 'package:my_app/modelProviders/model_providers.dart';
import 'package:my_app/providers/transection/transection_providers.dart';
import 'package:provider/provider.dart';

class MainScreenProviders extends StatefulWidget {
  @override
  _MainScreenProvidersState createState() => _MainScreenProvidersState();
}

class _MainScreenProvidersState extends State<MainScreenProviders> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        //ประกาศเรียกใช้ Provider
        ChangeNotifierProvider(create: (context) {
          return TransectionProvider();
        }), //รับค่า Provider ประกาศซ้ำเมื่อมีหลายตัว
      ],
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 0,
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
      ),
    );
  }

  Widget getListTransection() {
    return Container(
      child: Expanded(
        child: ListView.builder(
            itemCount: 4,
            itemBuilder: (context, index) {
              return Container(
                child: Card(
                  child: Row(
                    children: [
                      Text('data'),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }

  Widget consumerTransection() {
    return Consumer(
      //ประกาศ Consumer เพื่อรับค่า Provoider
      builder:
          (context, TransectionProvider transectionProvider, Widget child) {
        return Expanded(
          child: ListView.builder(
              itemCount: transectionProvider.transections.length,
              itemBuilder: (context, index) {
                Transection data = transectionProvider
                    .transections[index]; //เข้าถึงข้อมูล List จาก Model ทีละตัว
                return Container(
                  child: Card(
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Text(data.title),
                            Text(data.amount.toString()),
                            Text(data.date.toString()),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              }),
        );
      },
    );
  }
}
