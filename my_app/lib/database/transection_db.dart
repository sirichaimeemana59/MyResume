import 'dart:io';

import 'package:my_app/modelProviders/model_providers.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class TransectionDB {
  //บริการเกี่ยวกับฐานข้อมูล

  String dbName;

  TransectionDB({this.dbName});

  Future<Database> openDatabase() async {
    //ตำแหน่งที่เก็บฐานข้อมูลของเครื่อง
    Directory appDirectory =
        await getApplicationDocumentsDirectory(); //หาตำแหน่งที่จัดเก็บข้อมูล

    String dbLocation = join(
        appDirectory.path, dbName); //ต่อ full path DB จาก appDirectory/dbName

//Create DB
    DatabaseFactory dbFactory = await databaseFactoryIo;
    //รวม DB กับ Path
    Database db = await dbFactory.openDatabase(dbLocation);
    return db;
  }

  //บันทึกข้อมูลลงในฐานข้อมูล Store
  Future<int> InsertData(Transections statement) async {
    //สร้าง Store
    var db = await this.openDatabase();
    var store = intMapStoreFactory.store("expense");

    //Insert data format Json
    var keyID = store.add(
      db,
      {
        "title": statement.title,
        "amount": statement.amount,
        "date": statement.date.toIso8601String(),
      },
    );
    db.close();
    return keyID;
  }

  Future<List<Transections>> loadAllData() async {
    var db = await this.openDatabase();
    var store = intMapStoreFactory.store("expense");
    var snapshotData = await store.find(
      db,
      finder: Finder(sortOrders: [
        SortOrder(Field.key,
            false), //เรียงข้อมูลจาก Key เรียงจากวันที่สร้างล่าสุดก่อนคือ False True คือ เรียงจากวันที่สร้างเก่าสุดก่อน
      ]),
    );

    // ignore: deprecated_member_use
    List transectionList = List<Transections>();
    for (var record in snapshotData) {
      // Loop Data to list
      transectionList.add(
        Transections(
          title: record["title"],
          amount: record["amount"],
          date: DateTime.parse(record["date"]),
        ),
      );
    }
    return transectionList;
  }

  Future<List<Transections>> findData(String index) async {
    var db = await this.openDatabase();
    var store = intMapStoreFactory.store("expense");
    var snapshotData = await store.find(
      db,
    );

    // ignore: deprecated_member_use
    List transectionList = List<Transections>();
    for (var record in snapshotData) {
      // Loop Data to list
      transectionList.add(
        Transections(
          title: record["title"],
          amount: record["amount"],
          date: DateTime.parse(record["date"]),
        ),
      );
    }
    return transectionList;
  }
}
