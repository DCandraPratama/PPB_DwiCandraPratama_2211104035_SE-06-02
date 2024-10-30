import 'package:flutter/material.dart';

class Detailpage extends StatelessWidget {
  const Detailpage({super.key, required this.data});

  final Widget data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Page'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent[400],
      ),
      body: Center(
        child: data,
      ),
    );
  }
}
