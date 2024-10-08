import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rekomendasi Wisata',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const WisataPage(),
    );
  }
}

class WisataPage extends StatelessWidget {
  const WisataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rekomendasi Wisata"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
        backgroundColor: Colors.orangeAccent,
        leading: IconButton(onPressed: (){},
        icon: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
          )
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          )
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "Wisata Guci Bumijawa Tegal ",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0), // Sudut border radius pada gambar
              child: Image.network(
                'https://th.bing.com/th/id/R.60b8f9095bddc670c714bbd4a7e34a0e?rik=6c3IWOWvALDlIA&riu=http%3a%2f%2f2.bp.blogspot.com%2f-1B5n16NHMdI%2fUzzlxDCDzoI%2fAAAAAAAAASg%2ftbm2SzET_OI%2fs1600%2fwisata-guci.jpg&ehk=JydTyeCLgNfqpNe0jiVJSMnDXtrca8ZHN3hd7n5IDDY%3d&risl=&pid=ImgRaw&r=0',
                width: 300,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Guci adalah sebuah objek wisata pemandian air panas yang terletak di lereng Gunung Slamet, Kabupaten Tegal, Jawa Tengah. Tempat ini terkenal dengan pemandian air panasnya yang alami dan pemandangan alam yang indah.",
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Tambahkan aksi ketika tombol ditekan
                print("Tombol Kunjungi Tempat ditekan");
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orangeAccent, // Warna latar belakang tombol
                foregroundColor: Colors.black, // Warna teks pada tombol
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12), // Ukuran padding
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                ),
              ),
              // Teks tombol 
              // Bentuk sudut tombol
              child: const Text("Kunjungi Tempat"),

            ),
          ],
        ),
      ),
    );
  }
}