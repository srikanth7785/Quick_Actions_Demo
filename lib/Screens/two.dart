import 'package:flutter/material.dart';

class Two extends StatefulWidget {
  @override
  _TwoState createState() => _TwoState();
}

class _TwoState extends State<Two> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Screen 2"),),
      body: Center(
        child: Text("This is Screen 2"),
      ),
    );
  }
}