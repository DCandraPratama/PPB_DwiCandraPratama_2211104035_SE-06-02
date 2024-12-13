import 'package:get/get.dart';
import 'package:pertemuan_13/views/home_page.dart';
import 'package:pertemuan_13/views/add_note_page.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: '/home',
      page: () => HomePage(),
    ),
    GetPage(
      name: '/add-note',
      page: () => AddNotePage(),
    ),
  ];
}
