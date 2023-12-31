import 'package:ecommerce/Screens/card.dart';
import 'package:ecommerce/Screens/detail.dart';
import 'package:ecommerce/Screens/homepage.dart';
import 'package:ecommerce/Screens/listproduct.dart';
import 'package:ecommerce/Screens/login.dart';
import 'package:ecommerce/Screens/signup.dart';
import 'package:ecommerce/Screens/welcome.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Welcome(),
    );
  }
}

