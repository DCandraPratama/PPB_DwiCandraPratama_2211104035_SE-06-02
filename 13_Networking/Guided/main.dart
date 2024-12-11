import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pertemuan_13/view%20model/counter_controler.dart';
import 'package:pertemuan_13/view/detail_page.dart';
import 'package:pertemuan_13/view/my_home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final CounterControler controller = Get.put(CounterControler());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
       getPages: [
        GetPage(
          name: '/', 
          page: () => MyHomePage(title: 'Belajar GetX'),
        ),
        GetPage(
          name: '/Detail', 
          page: () => DetailPage(),
        ),
       ],
    );
  }
}
