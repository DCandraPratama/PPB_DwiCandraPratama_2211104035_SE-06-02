import 'package:flutter/material.dart';
import 'package:praktikum_10/database/db_helper.dart';
import 'package:praktikum_10/models/mahasiswa.dart';

class AddMahasiswaScreen extends StatelessWidget {
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _nimController = TextEditingController();
  final TextEditingController _alamatController = TextEditingController();
  final TextEditingController _hobiController = TextEditingController();

  void _saveMahasiswa(BuildContext context) async {
    final mahasiswa = Mahasiswa(
      nama: _namaController.text,
      nim: _nimController.text,
      alamat: _alamatController.text,
      hobi: _hobiController.text,
    );
    await DatabaseHelper.instance.insertMahasiswa(mahasiswa.toMap());
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Biodata Mahasiswa'),
        backgroundColor: Colors.pinkAccent[400], // Warna latar belakang AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _namaController,
              decoration: InputDecoration(labelText: 'Nama'),
            ),
            TextField(
              controller: _nimController,
              decoration: InputDecoration(labelText: 'NIM'),
            ),
            TextField(
              controller: _alamatController,
              decoration: InputDecoration(labelText: 'Alamat'),
            ),
            TextField(
              controller: _hobiController,
              decoration: InputDecoration(labelText: 'Hobi'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _saveMahasiswa(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pinkAccent[400], // Warna latar tombol
              ),
              child: Text(
                'Simpan',
                style: TextStyle(
                  color: Colors.white, // Warna teks agar terlihat jelas
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
