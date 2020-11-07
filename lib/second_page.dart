import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {

  getMethod() async {
    String Url = 'http://10.0.2.2/flutter/getData.php';
    var res = await http.get(Uri.encodeFull(Url), headers: {"Accept":"application/json"});
    var responsBody = json.decode(res.body);
    print("***********************************************************");

    print(responsBody);
    print("***********************************************************");
    return responsBody;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Get Data from LocalHost'),
      ),
      body: FutureBuilder(
        future: getMethod(),
        // ignore: missing_return
        builder: (BuildContext context, AsyncSnapshot snapshot){
          List snap = snapshot.data;

            if(snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if(snapshot.hasError) {
              return Center(
                child: Text("Error fetching Data!"),
              );
            }

            return ListView.builder(
              itemCount: snap.length,
                itemBuilder:  (context, index) {
                return Column(
                  children: [
                    Text("Name: ${snap[index]['name']}"),
                    Text("Email: ${snap[index]['email']}"),
                    Text("Mobile: ${snap[index]['mobile ']}"),
                  ],

                );
                  /*ListTile(
                  title: Text("Name: ${snap[index]['name']}"),
                  subtitle:
                  :
                );*/
                }
            );
        },
      ),
    );
  }
}
