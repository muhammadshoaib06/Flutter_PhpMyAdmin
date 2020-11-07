import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phpmyadmin/second_page.dart';
import 'package:http/http.dart' as http;

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController name = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController mobile = new TextEditingController();

  // ignore: missing_return
  Future<Map> sendData() async {
    final response =
        await http.post("http://10.0.2.2/flutter/insertdata.php", body: {
      "name": name.text,
      "email": email.text,
      "mobile": mobile.text,
    });

    var dataUser = json.decode(response.body);

    print(dataUser);

    return dataUser;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(20),
          padding: EdgeInsets.all(10),
          child: Center(
            child: Column(
              children: <Widget>[
                Text(
                  "Username",
                  style: TextStyle(fontSize: 18.0),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: name,
                  decoration: InputDecoration(hintText: 'name'),
                ),
                SizedBox(
                  height: 40,
                ),
                Text(
                  "Email",
                  style: TextStyle(fontSize: 18.0),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: email,
                  decoration: InputDecoration(hintText: 'Email'),
                ),
                SizedBox(
                  height: 40,
                ),
                Text(
                  "Mobile",
                  style: TextStyle(fontSize: 18.0),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: mobile,
                  decoration: InputDecoration(hintText: 'Mobile'),
                ),
                SizedBox(
                  height: 50,
                ),
                RaisedButton(
                  child: Text("Register"),
                  onPressed: () {
                    sendData();
                  },
                ),
                RaisedButton(
                  child: Text("Home Screen"),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SecondPage()));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
