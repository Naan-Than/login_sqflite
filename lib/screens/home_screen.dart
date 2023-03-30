import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final SharedPreferences prefs = await SharedPreferences.getInstance();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("data"),
        backgroundColor: Colors.purpleAccent,
      ),
      body: Column(
        children: [
          Text("data"),
        ],
      ),
    );
  }
}
