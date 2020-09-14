import 'package:flutter/material.dart';
import 'package:flut101ep6/pages/vga.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PC Build',
      home: VgaPage(),
    );
  }
}
