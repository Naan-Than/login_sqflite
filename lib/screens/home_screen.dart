import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
      initDb();
  }

  initDb() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.getString("name");
    prefs.getString("email");
    prefs.getString("password");
    prefs.getString("mobile");
    prefs.getString("address");
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("d"),
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
