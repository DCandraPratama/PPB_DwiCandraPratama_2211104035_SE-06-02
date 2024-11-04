import 'package:flutter/material.dart';
import 'package:unguidednya/models/product.dart';
import 'package:unguidednya/page/detailpage.dart';

class HomePage extends StatelessWidget {
  final List<Product> products = [
    Product(
      id: '1',
      name: 'Sendok Abad 17',
      description: 'Sendok abad 17 Real!!',
      price: 12000,
      imageUrl:
          'https://down-id.img.susercontent.com/file/id-11134207-7r98x-m031zzt7z93z41',
    ),
    Product(
      id: '2',
      name: 'Kopi Lendot',
      description: 'Kopi Lendot',
      price: 75000,
      imageUrl:
          'https://down-id.img.susercontent.com/file/sg-11134201-23010-oi3y5nxlucmvc5',
    ),
    // Tambahkan lebih banyak produk jika diperlukan
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Daftar Produk Yang Tersedia')),
          backgroundColor: Colors.amber,
        ),
        body: Container(
          color: Colors.purpleAccent[100],
          child: ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return Card(
                elevation: 4,
                margin: const EdgeInsets.symmetric(vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPage(product: product),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            product.imageUrl,
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(width: 15),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product.name,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                product.description,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black54,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Rp${product.price}',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.blueAccent,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ));
  }
}
