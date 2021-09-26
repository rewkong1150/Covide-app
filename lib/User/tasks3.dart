import 'package:GoogleMaps/map.dart';
import 'package:GoogleMaps/models/task.dart';
import 'package:GoogleMaps/screen/check%20location.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Tasks3 extends StatelessWidget{
  final tasksList= Task3.genrateTasks();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: GridView.builder(
        itemCount: tasksList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10
        ), itemBuilder:(context,index)=>
        tasksList[index].isLast ?_buildAddTask():_buildTask3(context,tasksList[index])
        ),
    );
  }
Widget _buildAddTask() {
  return Text('Add Task');
}
Widget _buildTask3(BuildContext context,Task3 task ,){
  return GestureDetector(
    onTap:() {
      Navigator.of(context).push(
        MaterialPageRoute(builder: 
        (context)=>MapsPage(task))
      );
    },
  child:Container(
    padding: EdgeInsets.all(15),
    decoration: BoxDecoration(
      color: task.bgColor,
      borderRadius: BorderRadius.circular(20)
      
    ),
    child:Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(task.iconData,
        color: task.iconColor,
        size: 35,),
        SizedBox(height: 30),
        Text(task.title,style: TextStyle(
          fontWeight: FontWeight.bold
        ),)
      ],
    ),
  ));
}


}
