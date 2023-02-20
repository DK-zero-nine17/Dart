import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:flutter_smallproject/main.dart';

class TestApp extends StatelessWidget {
  TestApp({super.key});
  int _couter = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: _MyWidgetOfME(couter: _couter),
    );
  }
}

class _MyWidgetOfME extends StatefulWidget {
  _MyWidgetOfME({
    Key? key,
    required int couter,
  })  : _couter = couter,
        super(key: key);

  int _couter = 0;

  @override
  State<_MyWidgetOfME> createState() => _MyWidgetOfMEState();
}

class _MyWidgetOfMEState extends State<_MyWidgetOfME> {
  int demSO = 0;
  int _gioitinh = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Demo Tesst App',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.yellow,
        leading: Builder(
          builder: (context) => IconButton(
              onPressed: Scaffold.of(context).openDrawer,
              icon: Icon(
                Icons.menu,
                color: Colors.black,
              )),
        ),
      ),
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            widget._couter++;
            print(widget._couter);
          });
          var snackBar = SnackBar(
            content: Text('I have ${widget._couter}'),
            duration: Duration(microseconds: 500),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(height: 40),
        color: Colors.yellow,
        shape: const CircularNotchedRectangle(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      drawer: Drawer(
          child: ElevatedButton(
        onPressed: () {},
        child: Text('Information.'),
      )),
      body: Container(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Hello everyone. I count ${widget._couter}.',
            style: TextStyle(fontSize: 30),
          ),
          Container(
            child: Column(
              children: [
                RadioListTile(
                    title: Text('Male'),
                    subtitle: Text('is a boy'),
                    secondary: Icon(Icons.male),
                    tileColor: Color.fromARGB(77, 24, 99, 122),
                    shape: Border(
                        bottom: BorderSide(width: 4, color: Colors.black)),
                    value: 0,
                    groupValue: _gioitinh,
                    onChanged: ((value) {
                      setGioiTinh(value);
                    })),
                RadioListTile(
                    title: Text('FeMale'),
                    subtitle: Text('is a girl'),
                    secondary: Icon(Icons.female),
                    tileColor: Color.fromARGB(77, 24, 99, 122),
                    shape: Border(
                        bottom: BorderSide(width: 4, color: Colors.black)),
                    value: 1,
                    groupValue: _gioitinh,
                    onChanged: ((value) {
                      setGioiTinh(value);
                    })),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'User Name',
                        hintText: 'Enter Your Name',
                        hoverColor: Colors.black,
                        icon: Icon(
                          Icons.person,
                          size: 30,
                        )),
                  ),
                ),
              ],
            ),
          ),
          Wrap(
            children: [
              for (int i = 0; i < 5; i++) MyContainerVuong(),
            ],
          ),
          // GridView(
          //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //       crossAxisCount: 3, crossAxisSpacing: 10, mainAxisSpacing: 10),
          //   scrollDirection: Axis.vertical,
          //   physics: ClampingScrollPhysics(),
          //   children: [
          //     for (int i = 0; i < 10; i++) MyContainerVuong(),
          //   ],
          // )
        ],
      )),
    );
  }

  Container MyContainerVuong() {
    return Container(
      height: 100,
      width: 100,
      color: Colors.blue,
      margin: EdgeInsets.all(4),
    );
  }

  void setGioiTinh(int? value) {
    return setState(() {
      _gioitinh = int.parse(value.toString());
    });
  }
}
