import 'package:flutter/material.dart';

class Pageone extends StatefulWidget {
  const Pageone({super.key});

  @override
  State<Pageone> createState() => _PageoneState();
}

class _PageoneState extends State<Pageone> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Login Page'),
      ),
      body: Center(
        child: Container(
          child: const Text(
            'Login Sucessful',
            style: TextStyle(fontSize: 30, color: Colors.redAccent),
          ),
        ),
      ),
    ));
  }
}
