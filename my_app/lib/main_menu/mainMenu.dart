import 'package:flutter/material.dart';
import 'package:my_app/pets/petList.dart';

class MainMenu extends StatefulWidget {
  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  //Explicit
  String user_name = null;
  Widget showCurrentWidget = PetControler();
  //EndExplicit
  //Method
  Widget showListMenuSales() {
    return ListTile(
      leading: Icon(Icons.pets, color: Colors.blue.shade600),
      title: Text('ระบบสินค้า'),
      onTap: () {
        //print('object');
        MaterialPageRoute materialPageRoute =
            MaterialPageRoute(builder: (BuildContext context) => MainMenu());
        Navigator.of(context).push(materialPageRoute);

        //Navigator.of(context).pop();
      },
    );
  }

  Widget showListMenuPets() {
    return ListTile(
      leading: Icon(Icons.pets, size: 36.0, color: Colors.blue.shade600),
      title: Text('ระบบบันทึกข้อมูลสัตว์เลี้ยง'),
      onTap: () {
        MaterialPageRoute materialPageRoute = MaterialPageRoute(
            builder: (BuildContext context) => PetControler());
        Navigator.of(context).push(materialPageRoute);
        // Navigator.of(context).pop();
      },
    );
  }

  Widget showName(String user_name) {
    return Text(
      'Name Customer : $user_name',
      style: TextStyle(
          color: Colors.blue.shade600,
          fontWeight: FontWeight.bold,
          fontSize: 20),
    );
  }

  Widget showImageProfile() {
    return Container(
      width: 80.0,
      height: 80.0,
      child: Image.asset('images/dog.png'),
    );
  }

  Widget showHead(String user_name) {
    return DrawerHeader(
      child: Column(
        children: [
          showImageProfile(),
          SizedBox(
            height: 8.0,
          ),
          showName(user_name),
        ],
      ),
    );
  }

  Widget showDrawer(String user_name) {
    return Drawer(
        child: ListView(
      children: [
        showHead(user_name),
        showListMenuPets(),
        showListMenuSales(),
      ],
    ));
  }

  //End Method
  @override
  Widget build(BuildContext context) {
    final user_name = ModalRoute.of(context).settings.arguments;
    showName(user_name);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow.shade900,
        title: Text('Menu'),
        actions: [],
      ),
      //สร้าง Object ให้อยู่ใน View
      body: SafeArea(
          child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('images/PetBackground.png'),
          fit: BoxFit.cover,
        )),
        child: Center(
          //     //set วัตถุให้อยู่กึ่งกลาง
          child: Column(
            mainAxisSize: MainAxisSize.min, //ปรับวัตถให้อยู่กึ่งกลางหน้าจอ
            children: [],
          ),
        ),
      )),
      drawer: showDrawer(user_name),
      // end Column
    );
  }

  Widget menuPetsCard() {
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
                    borderRadius: BorderRadius.circular(40 / 2),
                    // ignore: missing_required_param
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('images/dog.png'),
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
                      child: Text("ระบบบันทึกข้อมูลสัตว์เลี้ยง"),
                    ),
                    ButtonBar(
                      children: [
                        // ignore: deprecated_member_use
                        FlatButton(
                          //child: Text('Edit'),
                          onPressed: () async {
                            var materialPageRoute = MaterialPageRoute(
                                builder: (context) => PetControler());
                            Navigator.push(context, materialPageRoute);
                          },
                          child: null,
                        ),
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

  Widget menuSalesCard() {
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
                    borderRadius: BorderRadius.circular(40 / 2),
                    // ignore: missing_required_param
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('images/dog.png'),
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
                      child: Text("ระบบขายสินค้า"),
                    ),
                    ButtonBar(
                      children: [
                        // ignore: deprecated_member_use
                        FlatButton(
                          //child: Text('Edit'),
                          onPressed: () async {
                            print('object');
                            var materialPageRoute = MaterialPageRoute(
                                builder: (context) => PetControler());
                            Navigator.push(context, materialPageRoute);
                          },
                          child: null,
                        ),
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
}
