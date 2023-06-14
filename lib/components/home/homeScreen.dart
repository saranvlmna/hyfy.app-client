import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:hyfy/components/utilitys/localStorage.dart';
import 'dart:convert';

import '../utilitys/constants.dart';

class HomeScreen extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<HomeScreen> {
  List<dynamic> user = [];
  String name = 'hyfy';
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(
        Uri.parse(ApiConstants.baseUrl + ApiConstants.getUserEndpoint),
        headers: <String, String>{
          "Content-Type": "application/json",
          "token": await getValue("token")
        });
    if (response.statusCode == 200) {
      setState(() {
        user = jsonDecode(response.body)['data'];
        name = jsonDecode(response.body)['data'][0]['name'];
        print(jsonDecode(response.body)['data'][0]['name']);
      });
    } else {
      print('Failed to fetch data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Text(
          'hey  ' + name,
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.w200, fontFamily: 'Ysabeau'),
          textAlign: TextAlign.start,
        ),
      )),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: HomeScreen(),
  ));
}
