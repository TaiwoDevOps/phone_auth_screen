import 'package:flutter/material.dart';
import 'package:signup_phone_otp/phone_reg_screens%20/phone_number_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Phone Auth',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SignupPhoneScreen(),
    );
  }
}
