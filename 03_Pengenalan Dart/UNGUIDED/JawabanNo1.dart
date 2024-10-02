import 'dart:io';

String nilaiHuruf(int nilai) {
  if (nilai > 70) {
    return "Nilai A";
  } else if (nilai > 40 && nilai <= 70) {
    return "Nilai B";
  } else if (nilai > 0 && nilai <= 40) {
    return "Nilai C";
  } else {
    return "";
  }
}

void main() {
  print("Masukkan nilai: ");
  String? input = stdin.readLineSync();
  if (input != null) {
    int nilai = int.parse(input);
    String hasil = nilaiHuruf(nilai);
    if (hasil.isNotEmpty) {
      print("$nilai merupakan $hasil");
    } else {
      print(""); // Mengembalikan teks kosong jika tidak memenuhi semua kondisi
    }
  } else {
    print("Input tidak valid");
  }
}