import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {

    TableRow _tableRow = const TableRow(
        children: <Widget>[
          Padding(padding: EdgeInsets.all(8.0),
            child: Text('Sr no'),
          ),
          Padding(padding: EdgeInsets.all(8.0),
            child: Text('Subject'),
          ),
          Padding(padding: EdgeInsets.all(8.0),
            child: Text('Total lecture taken'),
          ),
          Padding(padding: EdgeInsets.all(8.0),
            child: Text('Total lectures attended'),
          ),
          Padding(padding: EdgeInsets.all(8.0),
            child: Text('Percentage',style: TextStyle(fontSize: 13),),
          ),
        ]
    );

    TableRow _tableRow1 = const TableRow(
        children: <Widget>[
          Padding(padding: EdgeInsets.all(8.0),
            child: Text('01'),
          ),
          Padding(padding: EdgeInsets.all(8.0),
            child: Text('SEO LAB'),
          ),
          Padding(padding: EdgeInsets.all(8.0),
            child: Text(' '),
          ),
          Padding(padding: EdgeInsets.all(8.0),
            child: Text(' '),
          ),
          Padding(padding: EdgeInsets.all(8.0),
            child: Text(' '),
          ),
        ]
    );

    TableRow _tableRow2 = const TableRow(
        children: <Widget>[
          Padding(padding: EdgeInsets.all(8.0),
            child: Text('02'),
          ),
          Padding(padding: EdgeInsets.all(8.0),
            child: Text('3D MODELLING LAB'),
          ),
          Padding(padding: EdgeInsets.all(8.0),
            child: Text(' '),
          ),
          Padding(padding: EdgeInsets.all(8.0),
            child: Text(' '),
          ),
          Padding(padding: EdgeInsets.all(8.0),
            child: Text(' '),
          ),
        ]
    );

    TableRow _tableRow3 = const TableRow(
        children: <Widget>[
          Padding(padding: EdgeInsets.all(8.0),
            child: Text('03'),
          ),
          Padding(padding: EdgeInsets.all(8.0),
            child: Text('MULTI-MEDIA TECHNOLOGY LAB'),
          ),
          Padding(padding: EdgeInsets.all(8.0),
            child: Text(' '),
          ),
          Padding(padding: EdgeInsets.all(8.0),
            child: Text(' '),
          ),
          Padding(padding: EdgeInsets.all(8.0),
            child: Text(' '),
          ),
        ]
    );

    TableRow _tableRow4 = const TableRow(
        children: <Widget>[
          Padding(padding: EdgeInsets.all(8.0),
            child: Text('Total :-'),
          ),
        ]
    );


    return Scaffold(
      appBar: AppBar(
        title: Text('Face Recognization'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 150,
              width: double.infinity,
              child: Row(
                children: [
                  SizedBox(width: 1),
                  Container(
                    width: 100,
                    height: 100,
                    child: CircleAvatar(
                      child: Image.asset('assets/images/user2.png',scale: 15,),
                    ),
                  ),
                  SizedBox(width: 20,),
                  Column(
                    children: [
                      SizedBox(height: 30),
                      Container(
                          width: 290,
                          height: 30,
                          child: Text('NAME: SMITI KANOLKAR',style: TextStyle(fontSize: 20),)
                      ),
                      Container(
                          width: 290,
                          height: 30,
                          child: Text('ROLL NO.: B-21-1316',style: TextStyle(fontSize: 20),)
                      ),
                      Container(
                          width: 290,
                          height: 30,
                          child: Text('STD : TYBCA',style: TextStyle(fontSize: 20),)
                      ),
                    ],
                  )
                ],
              ),
            ),
            Divider(color: Colors.black,thickness: 2,),
            SizedBox(height: 50,),
            Text('ATTENDANCE REPORT',style: TextStyle(fontSize: 30),),
            SizedBox(height: 50,),
            Center(
              child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20,right: 20),
                      child: Table(
                          border: TableBorder.all(),
                          children:<TableRow>[
                            _tableRow,
                            _tableRow1,
                            _tableRow2,
                            _tableRow3,
                          ]
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 20,left: 242),
                      child: Table(
                        border: TableBorder.all(),
                        children:<TableRow>[
                          _tableRow4,
                        ],
                      ),
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}