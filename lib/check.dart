import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

Future<Covid> fetchData() async {
  var url = "covid19.th-stat.com";
  var response = await http.get(Uri.https(url, "api/open/today"));
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    // return Covid.fromJson(jsonDecode(response.body));
    return Covid.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class Covid {
  final int confirmed;
  final int deaths;
  final int newConfirmed;
  final int newDeaths;
  final String updateDate;

  Covid(
      {this.confirmed,
      this.deaths,
      this.newConfirmed,
      this.newDeaths,
      this.updateDate});

  factory Covid.fromJson(Map<String, dynamic> json) {
    return Covid(
       confirmed: json["Confirmed"] == null ? null : json["Confirmed"],
       deaths: json["Deaths"] == null ? null : json["Deaths"],
       newConfirmed: json["NewConfirmed"] == null ? null : json["NewConfirmed"],
      newDeaths: json["NewDeaths"] == null ? null : json["NewDeaths"],
       updateDate: json["UpdateDate"] == null ? null : json["UpdateDate"]
    );
  }
}
// Confirmed,Deaths,NewConfirmed,NewDeaths,UpdateDate

class Check extends StatefulWidget {
  @override
  _CheckcState createState() => _CheckcState();
}

class _CheckcState extends State<Check> {
  static Future<Covid> futureAlbum;
  @override
  void initState() {
    super.initState();
    futureAlbum = fetchData();
    print(futureAlbum);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Covid Report',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Covid Report'),
        ),
        body: Center(
          child: FutureBuilder<Covid>(
            future: futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children:[
                    Text("Confirmed: ${snapshot.data.confirmed.toString()}",style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                    Text("Deaths: ${snapshot.data.deaths.toString()}",style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                    Text("newConfirmed: ${snapshot.data.newConfirmed.toString()}",style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                    Text("newDeaths: ${snapshot.data.newDeaths.toString()}",style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                    Text("updateDate: ${snapshot.data.updateDate.toString()}",style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  ],
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              // By default, show a loading spinner.
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
  
}
  