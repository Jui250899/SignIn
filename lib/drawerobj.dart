import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class objDrawer extends StatelessWidget {
  const objDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children: [
          Text("Welcome to Home ",style: TextStyle(fontWeight: FontWeight.bold),)
        ],
      ),
    );
  }
}