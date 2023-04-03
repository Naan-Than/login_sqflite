import 'package:flutter/material.dart';

class Utility {
  static String emailAddressText = "Email Address";
  static String fullNameText = "Full Name";
  static String addressText = "Address";
  static String passwordText = "Password";
  static String mobileText = "Mobile";
  static String registerText = "Register";
  static String newAccountText = "New Account";
  static String signUpText = "Sign Up";
  static String signInText = "Sign In";
  static String welcomeText = "Welcome";

  static customTextField(name, icon, input, hint, controller, formValidator,
      {isPassword = false, maxLine = 1, mixLine = 1, enable = true}) {
    return TextFormField(
      keyboardType: input,
      enabled: enable,
      obscureText: isPassword,
      controller: controller,
      validator: formValidator,
      decoration: InputDecoration(
        fillColor: Colors.black54,
        focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
            borderSide: BorderSide(color: Colors.grey)),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Icon(
            icon,
            color: Colors.purple,
          ),
        ),
        labelStyle: const TextStyle(color: Colors.black, fontSize: 20),
        label: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            name,
            maxLines: maxLine,
          ),
        ),
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.grey, fontSize: 18),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
      ),
    );
  }

  static customButton(name, onPressed, color) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22), // <-- Radius
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 13),
        child: Text(
          name,
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
