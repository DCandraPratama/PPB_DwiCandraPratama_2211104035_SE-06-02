import 'dart:io';

bool isPrime(int number) {
  if (number <= 1) return false;
  for (int i = 2; i <= number / 2; i++) {
    if (number % i == 0) return false;
  }
  return true;
}

void main() {
  print('Masukkan sebuah bilangan bulat:');
  String? input = stdin.readLineSync();
  
  if (input != null) {
    try {
      int number = int.parse(input);
      if (isPrime(number)) {
        print('bilangan prima');
      } else {
        print('bukan bilangan prima');
      }
    } catch (e) {
      print('Input tidak valid. Mohon masukkan bilangan bulat.');
    }
  } else {
    print('Input tidak boleh kosong.');
  }
}