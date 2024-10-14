import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wisata Banyumas',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
        scaffoldBackgroundColor: Colors.orange[50],
      ),
      home: WisataListPage(),
    );
  }
}

class WisataListPage extends StatelessWidget {
  final List<Map<String, String>> wisataList = [
    {
      'nama': 'Baturraden',
      'deskripsi':
          'Objek wisata alam di lereng Gunung Slamet dengan pemandangan indah, air terjun, dan berbagai wahana rekreasi.',
      'imageUrl':
          'https://1.bp.blogspot.com/-_zqY3NnvyRM/ViI8Fpkw9XI/AAAAAAAAHDw/ONOoPXfN15s/s1600/pintu%2Bmasuk%2Blokawsiata%2Bbaturaden%2Brawalo-ku.bogspot.com.jpg',
    },
    {
      'nama': 'Curug Cipendok',
      'deskripsi':
          'Air terjun spektakuler setinggi 92 meter yang dikelilingi hutan tropis yang rimbun.',
      'imageUrl':
          'https://i0.wp.com/upload.wikimedia.org/wikipedia/commons/c/cb/Curug_Cipendok%2C_Purwokerto%2C_2015-03-22.jpg',
    },
    {
      'nama': 'Telaga Sunyi',
      'deskripsi':
          'Danau tersembunyi di tengah hutan dengan air yang tenang dan pemandangan yang menenangkan.',
      'imageUrl':
          'https://th.bing.com/th/id/OIP.PqBOPdD4wwDRA3lw3NbE9gHaE8?rs=1&pid=ImgDetMain',
    },
    {
      'nama': 'Small World',
      'deskripsi':
          'Taman miniatur dengan replika bangunan terkenal dari seluruh dunia, cocok untuk edukasi dan foto-foto.',
      'imageUrl':
          'https://th.bing.com/th/id/OIP.F7hjRE6W5nWEFDl_LH98MgHaEn?rs=1&pid=ImgDetMain',
    },
    {
      'nama': 'Taman Andhang Pangrenan',
      'deskripsi':
          'Taman kota yang asri dengan berbagai fasilitas olahraga dan area bermain anak.',
      'imageUrl':
          'https://3.bp.blogspot.com/-KfqpvWH1anI/VMWbGUTMGxI/AAAAAAAAA6o/D1QFZmS0HYE/s1600/taman%2Bandhang-pangrenan-purwokerto%2B(2).jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wisata Banyumas'),
        centerTitle: true,
        backgroundColor: Colors.orange,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        )),
      ),
      body: Column(
        children: [
          SizedBox(height: 16), // Memberi jarak antara AppBar dan ListView
          Expanded(
            child: ListView.builder(
              itemCount: wisataList.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  color: Colors.orange[300],
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage:
                          NetworkImage(wisataList[index]['imageUrl']!),
                      backgroundColor: Colors.orange[100],
                    ),
                    title: Text(
                      wisataList[index]['nama']!,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    subtitle: Text(
                      wisataList[index]['deskripsi']!,
                      style: TextStyle(color: Colors.white70),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    trailing: Icon(Icons.arrow_forward_ios, color: Colors.white),
                    onTap: () {
                      // Implementasi untuk menampilkan detail wisata
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
