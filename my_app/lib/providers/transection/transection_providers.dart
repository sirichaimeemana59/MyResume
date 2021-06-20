//Create Provider
import 'package:flutter/foundation.dart';
import 'package:my_app/modelProviders/model_providers.dart';

//ChangeNotifier แจ้งเตือนเมื่อมีการเปลี่ยนแปลงข้อมูล
class TransectionProvider with ChangeNotifier {
  //ตัวอย่างข้อมูล
  List<Transection> transections = [
    Transection(title: 'หนังสือ', amount: 100, date: DateTime.now()),
    Transection(title: 'กาเกง', amount: 200, date: DateTime.now()),
    Transection(title: 'เสื้อผ้า', amount: 300, date: DateTime.now()),
    Transection(title: 'ถุงเท้า', amount: 50, date: DateTime.now()),
    Transection(title: 'รองเท้า', amount: 450, date: DateTime.now()),
  ];

  //สร้าง function เพื่อให้บริการดึวข้อมูลไปใช้งาน
  //ส่งออกไปเป็น List
  List<Transection> getTransection() {
    return transections;
  }

  //สร้าง function เพื่อให้บริการเพิ่มข้อมูลไปใน List

  addTransection(Transection statement) {
    transections.add(statement);
  }
}
