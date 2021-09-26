import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'models/task.dart';

final String jsonplaceholder = "http://jsonplaceholder.typicode.com/users/";
Future<Covid> fetchData() async {

    final response = await http.get(Uri.parse('https://covid19.ddc.moph.go.th/api/Cases/today-cases-all'));
  final jsonresponse = json.decode(response.body);
    // print(jsonDecode(response.body[0]));
    return Covid.fromJson(jsonresponse[0]);

}

class Covid {
  final String txn_date;
  final int new_case;
  final int total_case;
  final String update_date;

  Covid({this.txn_date, this.new_case, this.total_case, this.update_date});

  factory Covid.fromJson(Map<String, dynamic> json) {
    return Covid(
      txn_date: json["txn_date"] == null ? null : json["txn_date"],
      new_case: json["new_case"] == null ? null : json["new_case"],
      total_case: json["total_case"] == null ? null : json["total_case"],
      update_date: json["update_date"] == null ? null : json["update_date"],
    );
  }
}
 
class Check extends StatefulWidget {
   final Task task;
  Check(this.task);
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
                print(snapshot.data);
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("วันที่: ${snapshot.data.txn_date.toString()}",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                    Text("ผู้ป่วยใหม่: ${snapshot.data.new_case.toString()}",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                    Text("ผู้ป่วยสะสม ${snapshot.data.total_case.toString()}",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                    Text("อัพเดทวันที่: ${snapshot.data.update_date.toString()}",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
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
