import 'package:casa_frango/screen/home_screen.dart';
import 'package:casa_frango/screen/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'chicken house',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MyLogin(),
        '/home_screen': (context) => HomeScreen(),
      },
    );
  }
}
