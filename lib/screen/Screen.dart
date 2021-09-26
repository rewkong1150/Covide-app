import 'package:GoogleMaps/User/tasks2.dart';
import 'package:GoogleMaps/User/tasks3.dart';
import 'package:GoogleMaps/models/go_hospital.dart';
import 'package:GoogleMaps/User/tasks.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  get size => null;

  get onPressed => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            Container(
              height: 45,
              width: 45,
              margin: EdgeInsets.only(left: 15),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset("assets/images/logo.png"),
              ),
            ),
            SizedBox(width: 10),
            Text(
              'Hi,Rewkong',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 26,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
        actions: [
          Icon(
            Icons.more_vert,
            color: Colors.black,
            size: 40,
          )
        ],
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Hospital(),
        Container(
          padding: EdgeInsets.all(15),
          child: Text(
            'Tasks',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: Tasks(),
        ),
        Expanded(child: Tasks2()
        ,),
        Expanded(child: Tasks3(),)
      ]),
      bottomNavigationBar: _buildBottomNavigationBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 0,
        backgroundColor: Colors.black,
        onPressed: (){},
        child:Icon(Icons.add,
        size: 35,
        )
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 10,
            )
          ]),
      child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          child: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                label: 'Home',
                icon:Icon(Icons.home_rounded,
                size:30)),
              BottomNavigationBarItem(
                label: 'Person',
                icon:Icon(Icons.person_rounded,
                size:30)),
            ],
          ),
      ),
    );
  }
  
  icon(IconData homeRounded, size) {}
}
