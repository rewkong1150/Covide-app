import 'dart:html';

import 'package:flutter/foundation.dart';
import 'package:GoogleMaps/models/location.dart';

class LocationProvider with ChangeNotifier{
  List<Location> locatoin =[
   Location(lo: 0.566,la: 321651.5,date:DateTime.now()),
   Location(lo: 0.566,la: 321651.5,date:DateTime.now()),
   Location(lo: 0.566,la: 321651.5,date:DateTime.now()),
  ];

    get<Location>(){
      return locatoin;
    }
   void addLocation(Location map){
      locatoin.add(map);
    }
}