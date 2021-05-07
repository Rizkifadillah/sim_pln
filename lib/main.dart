import 'package:flutter/material.dart';
import 'package:simulasi_pemakaian_listrik/screen/bottom_nav_bar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SimPLi',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BottomNavScreen(),
    );
  }
}

