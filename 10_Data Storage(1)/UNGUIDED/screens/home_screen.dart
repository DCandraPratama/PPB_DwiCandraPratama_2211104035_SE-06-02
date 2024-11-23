import 'package:flutter/material.dart';
import 'package:praktikum_10/database/db_helper.dart';
import 'package:praktikum_10/models/mahasiswa.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Mahasiswa> mahasiswaList = [];

  @override
  void initState() {
    super.initState();
    _loadMahasiswa();
  }

  Future<void> _loadMahasiswa() async {
    final data = await DatabaseHelper.instance.getMahasiswa();
    setState(() {
      mahasiswaList = data.map((e) => Mahasiswa.fromMap(e)).toList();
    });
  }

  void _navigateToAddMahasiswa() async {
    await Navigator.pushNamed(context, '/add');
    _loadMahasiswa();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('SQLite Biodata Mahasiswa'),
        backgroundColor: Colors.pinkAccent[400],
      ),
      body: ListView.builder(
        itemCount: mahasiswaList.length,
        itemBuilder: (context, index) {
          final mahasiswa = mahasiswaList[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      mahasiswa.nama,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text('NIM     : ${mahasiswa.nim}'),
                    Text('Alamat  : ${mahasiswa.alamat}'),
                    Text('Hobi    : ${mahasiswa.hobi}'),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateToAddMahasiswa,
        backgroundColor: Colors.pinkAccent[400],
        child: Icon(Icons.add),
      ),
    );
  }
}
