// void main() {
//  List<int> fixedList = List.filled(3, 0); // List dengan 3 elemen, 
 
//  // Mengubah elemen dalam list
//  fixedList[0] = 10;
//  fixedList[1] = 20;
//  fixedList[2] = 30;
//  print('Fixed Length List: $fixedList'); 
// }

// growableList = Lis.

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

}
