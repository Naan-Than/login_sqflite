import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Utility.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController mobile = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initDb();
  }

  initDb() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      name.text = prefs.getString("name")!;
      email.text = prefs.getString("email")!;
      mobile.text = prefs.getString("mobile")!;
      address.text = prefs.getString("address")!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 18,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                "${Utility.welcomeText} ${name.text}",
                style: const TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple),
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            Utility.customTextField(Utility.fullNameText, Icons.person,
                TextInputType.text, Utility.fullNameText, name, (name) {},
                enable: false),
            const SizedBox(height: 22),
            Utility.customTextField(
                Utility.emailAddressText,
                Icons.mail,
                TextInputType.emailAddress,
                Utility.emailAddressText,
                email,
                (mail) {},
                enable: false),
            const SizedBox(
              height: 22,
            ),
            Utility.customTextField(Utility.mobileText, Icons.call,
                TextInputType.number, Utility.mobileText, mobile, (mbl) {},
                enable: false),
            const SizedBox(
              height: 22,
            ),
            Utility.customTextField(
                Utility.addressText,
                Icons.location_on,
                TextInputType.multiline,
                Utility.addressText,
                address,
                (address) {},
                maxLine: 4,
                mixLine: 2,
                enable: false),
            const SizedBox(
              height: 22,
            ),
            Utility.customButton("Exit", () {
              Navigator.pushNamed(context, "/login");
            }, Colors.red),
          ],
        ),
      ),
    );
  }
}
