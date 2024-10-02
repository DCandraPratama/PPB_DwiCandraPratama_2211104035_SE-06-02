import 'dart:io';

void main() {
  print('Masukkan tinggi piramida: ');
  String? input = stdin.readLineSync();
  if (input != null) {
    int height = int.parse(input);
    printStarPyramid(height);
  } else {
    print('Input tidak valid');
  }
}

void printStarPyramid(int height) {
  for (int i = 1; i <= height; i++) {
    // Mencetak spasi
    for (int j = 1; j <= height - i; j++) {
      stdout.write(' ');
    }
    // Mencetak bintang
    for (int k = 1; k <= 2 * i - 1; k++) {
      stdout.write('*');
    }
    // Pindah ke baris baru
    print('');
  }
}