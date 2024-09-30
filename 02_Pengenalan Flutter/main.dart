import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Biodata Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BiodataPage(),
    );
  }
}


class BiodataPage extends StatelessWidget {
  const BiodataPage({super.key});

  @override
  Widget build(BuildContext context) {
    var elevation = 0;
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Biodata'),
        centerTitle: true,
        backgroundColor: Colors.purple
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: CircleAvatar(
                radius: 80,
                backgroundImage: NetworkImage('https://via.placeholder.com/150'),
              ),
            ),
            SizedBox(height: 20),
            Card(
              child: ListTile(
                leading: Icon(Icons.person),
                title: Text('Nama'),
                subtitle: Text('Dwi Candra Pratama'),
                
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.cake),
                title: Text('Tanggal Lahir'),
                subtitle: Text('February 13, 2004'),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.location_on),
                title: Text('Alamat'),
                subtitle: Text('Sekarang Purwokerto aja'),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.school),
                title: Text('Pendidikan'),
                subtitle: Text('Rekayasa Perangkat Lunak'),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.work),
                title: Text('Pekerjaan'),
                subtitle: Text('Software Developer'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}