import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:login/Utility.dart';

import '../DatabaseHelper.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final dbHelper = DatabaseHelper();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isChecked = false;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
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
        child: SafeArea(
          child: Form(
            key: formKey,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 58,),
                  Padding(
                    padding: const EdgeInsets.only(top: 28.0),
                    child: Text(
                      Utility.signInText,
                      style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple),
                    ),
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 32,
                        ),
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
                        const SizedBox(height: 24),
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
                        Row(
                          children: [
                            Checkbox(
                              shape:const CircleBorder(),
                              checkColor: Colors.white,
                              value: isChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked = value!;
                                });
                              },
                            ),
                            const Text(
                              "Remember me",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black54),
                            ),
                            const Spacer(),
                            const Text(
                              "Forgot password",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.purple),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        Utility.customButton(Utility.signInText, () {
                          _query();
                        }, Colors.purple),
                        const SizedBox(
                          height: 18,
                        ),
                        RichText(
                            text: TextSpan(
                                text: "or  ",
                                style: const TextStyle(color: Colors.purple, fontSize: 16),
                                children: [
                                  TextSpan(
                                    text: "Register a new account",
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.pushNamed(context, "/");
                                      },
                                    style: const TextStyle(color: Colors.grey, fontSize: 16,fontWeight: FontWeight.bold),
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

  void _query() async {
    final isHave = await dbHelper.login(email.text, password.text);
    if(isHave > 0) {
      // Navigate to home
      Navigator.pushNamed(context, "/home");
    } else {
      // Throw error

    }
  }

}
