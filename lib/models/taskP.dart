import 'package:GoogleMaps/User/tasks.dart';
import 'package:GoogleMaps/User/tasks2.dart';
import 'package:GoogleMaps/models/task.dart';
import 'package:flutter/material.dart';
class Taskp extends StatelessWidget {
 Widget build(BuildContext context) {
   return Container(
       child:Column(children:[
         Tasks(),
         Tasks2()
       ],) ,
     );

 }   
}