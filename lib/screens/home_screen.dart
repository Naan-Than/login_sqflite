import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class HomeScreen extends StatefulWidget {

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late String name;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initDb();

  }

  initDb() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString("name")!;
    });
     }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("data"),
        backgroundColor: Colors.purpleAccent,
      ),
      body: Column(
        children: [
          Text(name),
        ],
      ),
    );
  }
}
