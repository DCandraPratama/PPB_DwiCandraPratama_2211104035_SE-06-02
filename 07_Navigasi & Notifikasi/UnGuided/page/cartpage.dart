import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Keranjang Belanja')),
      body: Center(
        child: Text('Belum Ada Produk Di Keranjang'),
      ),
    );
  }
}