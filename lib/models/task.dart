import 'package:GoogleMaps/utility/my_style.dart';
import 'package:flutter/material.dart';

class Task{
  IconData iconData;
  String title;
  Color iconColor;
  Color bgColor;
  Color btnColor;
  num left;
  num done;
  bool isLast;
  Task({this.iconData, this.title, this.bgColor, this.iconColor,this.btnColor,this.left,this.done,this.isLast = false});
  static List<Task> genrateTasks(){
    return [
      Task(iconData: Icons.person_rounded,
        title: 'Personal',
        bgColor: kYellowDark,
        iconColor: kYellowLight,
        btnColor: kYellow,
        left: 3,
        done: 1,    
      ),
    ];
  }
}
class Task2{
  IconData iconData;
  String title;
  Color iconColor;
  Color bgColor;
  Color btnColor;
  num left;
  num done;
  bool isLast;
  Task2({this.iconData, this.title, this.bgColor, this.iconColor,this.btnColor,this.left,this.done,this.isLast = false});
  static List<Task2> genrateTasks(){
    return[Task2(iconData: Icons.send,
        title: 'Send Location',
        bgColor: kBlueLight,
        iconColor: kBlueDark,
        btnColor: kBlue,
        left: 3,
        done: 1,    
      ),];
  }
  }
  class Task3{
  IconData iconData;
  String title;
  Color iconColor;
  Color bgColor;
  Color btnColor;
  num left;
  num done;
  bool isLast;
  Task3({this.iconData, this.title, this.bgColor, this.iconColor,this.btnColor,this.left,this.done,this.isLast = false});
  static List<Task3> genrateTasks(){
    return[ Task3(iconData: Icons.maps_home_work_outlined,
        title: 'Check location',
        bgColor: kRedDark,
        iconColor: kRedLight,
        btnColor: kRed,
        left: 3,
        done: 1,    
      ),];
  }
  }
  class Task4{
  IconData iconData;
  String title;
  Color iconColor;
  Color bgColor;
  Color btnColor;
  num left;
  num done;
  bool isLast;
  Task4({this.iconData, this.title, this.bgColor, this.iconColor,this.btnColor,this.left,this.done,this.isLast = false});
  static List<Task4> genrateTasks(){
    return [Task4(iconData: Icons.coronavirus,
        title: 'News Covid 19',
        bgColor: kBlueDark,
        iconColor: kRedDark,
        btnColor: kYellow,
        left: 3,
        done: 1,    
      )];
  }
  }
  