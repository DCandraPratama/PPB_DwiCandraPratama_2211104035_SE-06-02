import 'package:flutter/material.dart';

class GridViewApp extends StatefulWidget {
  const GridViewApp({super.key});

  @override
  State<GridViewApp> createState() => _GridViewAppState();
}

class _GridViewAppState extends State<GridViewApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Praktikum 4'),
        backgroundColor: Colors.blueAccent[700],
      ),
      body: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        padding: EdgeInsets.all(12),
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: Text('GridView1'),
            color: Colors.amberAccent,
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Text('GridView2'),
            color: Colors.red,
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Text('GridView3'),
            color: Colors.green,
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Text('GridView4'),
            color: Colors.yellow,
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Text('GridView5'),
            color: const Color.fromARGB(255, 73, 54, 244),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Text('GridView5'),
            color: Colors.red,
          ),
        ],
      ),
    );
  }
}
