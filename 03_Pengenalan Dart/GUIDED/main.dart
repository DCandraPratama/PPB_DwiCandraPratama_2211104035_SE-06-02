// Tipe Data Variabel dengan var (Type Annotation)
void main() {
 // Menggunakan var
 var name = "Candra"; // Tipe data String
 var age = 20; // Tipe data Integer

 print("Nama: $name, Usia: $age");
}//Output: Nama: Candra, Usia: 20

Tipe Data Variabel dengan var (Multiple Variable)
void main() {
 // Multiple variable
 String firstName, lastName; // Tipe data String
 firstName = "Dwi Candra ";
 lastName = "Pratama";
 print("Nama Lengkap: $firstName $lastName");
}//Output: Nama Lengkap: Dwi Candra  Pratama



// //IF-ELSE Statement
void main() {
 var openHours = 8;
 var closedHours = 21;
 var now = 17;
 if (now > openHours && now < closedHours) {
 print("Hello, kita sekarang Buka");
 } else {
 print("Sorry, kita sekarang tutup");
 }//Output:Hello, kita sekarang Buka
}



// // SWITCH-CASE Statement
void main() {
 var Nilai = 'b'; // Misalkan 1 = Senin, 2 = Selasa, dst.
 switch (Nilai) {
   case 'a':
     print("Sangat Baik");
     break;
   case 'b':
     print("Baik");
     break;
   case 'c':
     print("Cukup Baik");
     break;
   default:
     print("Nilai Tidak Tersedia");
 }//Output:Baik
}




// // FOR Loop
 void main() {
 for (var i = 0; i < 5; i++) {
  print("Looping$i");
 }
}//Output: Looping 0, Looping 1, Looping 2, Looping 3, Looping 4

// // WHILE Loop
 void main() {
 var i = 0;
 while (i < 5) {
  print("Looping$i");
  i++;
 }
}//Output: Looping 0, Looping 1, Looping 2, Looping 3, Looping 4

void main() {
 int i = 1; // Inisialisasi variabel
 // While loop untuk mencetak angka 1 sampai 5
 while (i <= 5) {
 print('Angka: $i');
 i++; // Increment untuk menghindari loop tak berujung
 }
}



// //List

//Fixed Length Lis
void main() {
 // Membuat fixed-length list dengan panjang 3
 List<int> fixedList = List.filled(3, 0); // List dengan 3 elemen, 
   // yang semua elemennya diisi dengan nilai 0
 
 // Mengubah elemen dalam list
 fixedList[0] = 10;
 fixedList[1] = 20;
 fixedList[2] = 30;
 print('Fixed Length List: $fixedList'); // Output: [10, 20, 0, 0, 0]
 //OutPut Fixed Length List: [10, 20, 30]
 
 // Menambah atau menghapus elemen tidak diperbolehkan
 // fixedList.add(30); // Ini akan menimbulkan error
 // fixedList.removeAt(0); // Ini juga akan menimbulkan error
}

// Growable List
void main() {
  // Membuat growable list (panjangnya bisa berubah)
  List<int> growableList = [];
  // Menambahkan elemen baru ke dalam list
  growableList.add(10);
  growableList.add(20);
  growableList.add(30);

  print(growableList);
  // Menambahkan lebih banyak elemen
  growableList.add(50);
  growableList.add(80);
  growableList.add(90);

  print(growableList);

  growableList.remove(20);

  print(growableList);
} // Output: [10, 30, 40, 50]



// Fungsi
void cetakPesan(String pesan) {
  print(pesan);
}
int perkalian(int a, int b) {
  return a * b;
}
void main() {
  int hasil = perkalian(5, 4);
  print('hasil perkalian fungsi: $hasil');

  cetakPesan('Halo, guys!');
} //OutPut: hasil perkalian fungsi: 20
//Halo, guys!



// //Menambahkan Parameter
void greet(String name, int age) {
 print('Halo $name, you are $age years old.');
}
void main() {
 greet('Candra', 20); 
}//OutPut: Halo Candra, you are 20 years old.
