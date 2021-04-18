import 'package:flutter/material.dart';
import 'package:my_app/pets/petList.dart';

class MainMenu extends StatefulWidget {
  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow.shade600,
        title: Text('Menu'),
        actions: [],
      ),
      body: Center(
        child: ListView(
          children: [
            menuPetsCard(),
            menuSalesCard(),
          ],
        ),
      ),
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
