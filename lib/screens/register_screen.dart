import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:login/Utility.dart';

import '../DatabaseHelper.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final dbHelper = DatabaseHelper();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isChecked = false;
  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController mobile = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      initDb();
    });
  }

  initDb() async {
    // initialize the database
    await dbHelper.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Center(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              // decoration: const BoxDecoration(
              //   gradient: LinearGradient(
              //     begin: Alignment.topCenter,
              //     end: Alignment.bottomRight,
              //     stops: [0.0, 1.0,1.0],
              //     colors: [
              //       Colors.purpleAccent,
              //       Colors.white,
              //       Colors.purpleAccent,
              //     ],
              //   ),
              // ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 18,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      Utility.signUpText,
                      style: const TextStyle(
                          fontSize: 34,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 33, vertical: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 32,
                        ),
                        Utility.customTextField(
                            Utility.fullNameText,
                            Icons.person,
                            TextInputType.text,
                            Utility.fullNameText,
                            name, (name) {
                          if (name.isEmpty) {
                            return "Please Enter your Name";
                          } else {
                            return null;
                          }
                        }),
                        const SizedBox(height: 22),
                        Utility.customTextField(
                            Utility.emailAddressText,
                            Icons.mail,
                            TextInputType.emailAddress,
                            Utility.emailAddressText,
                            email, (mail) {
                          if (mail.isEmpty) {
                            return "Please Enter email";
                          } else {
                            return null;
                          }
                        }),
                        const SizedBox(height: 22),
                        Utility.customTextField(
                            Utility.passwordText,
                            Icons.lock,
                            TextInputType.text,
                            Utility.passwordText,
                            isPassword: true,
                            password, (pass) {
                          if (pass.isEmpty) {
                            return "Please Enter Password";
                          } else if (pass.lenth < 8) {
                            return "Password length is low";
                          }
                          return null;
                        }),
                        const SizedBox(
                          height: 22,
                        ),
                        Utility.customTextField(
                            Utility.mobileText,
                            Icons.call,
                            TextInputType.number,
                            Utility.mobileText,
                            mobile, (mbl) {
                          if (mbl.isEmpty) {
                            return "Please Enter Mobile Number";
                          } else {
                            return null;
                          }
                        }),
                        const SizedBox(
                          height: 22,
                        ),
                        Utility.customTextField(
                            Utility.addressText,
                            Icons.location_on,
                            TextInputType.multiline,
                            Utility.addressText,
                            address, (address) {
                          if (address.isEmpty) {
                            return "Please Enter Address";
                          } else {
                            return null;
                          }
                        }, maxLine: 4),
                        const SizedBox(
                          height: 20,
                        ),
                        Utility.customButton("Register account", () {
                          registerUser();
                        }, Colors.purple),
                        const SizedBox(
                          height: 18,
                        ),
                        RichText(
                            text: TextSpan(
                                text: "or  ",
                                style: const TextStyle(
                                    color: Colors.purpleAccent, fontSize: 16),
                                children: [
                              TextSpan(
                                text: "Sign in with your account",
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pushNamed(context, "/login");
                                  },
                                style: const TextStyle(
                                    color: Colors.black54,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ])),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  registerUser() async {
    // row to insert
    Map<String, dynamic> row = {
      DatabaseHelper.columnName: name.text,
      DatabaseHelper.columnEmail: email.text,
      DatabaseHelper.columnPassword: password.text,
      DatabaseHelper.columnMobile: mobile.text,
      DatabaseHelper.columnAddress: address.text,
    };
    final id = await dbHelper.insert(row);
    // Navigate to login
    Navigator.pushNamed(context, "/login");
  }
}
