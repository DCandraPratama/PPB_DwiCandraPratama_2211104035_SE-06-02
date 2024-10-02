void main() {
//   //penamaan variable menggunakan camelCase

//   String firstName = 'Praktikum';
//   var lastName = "PBB";
//   final cuaca = 'Cerah';

  var open = 8;
  var close = 17;
  var now = 10;

  if (now >= open && now < close) {
    print("toko buka");
  } else if (now == 13) {
    print("toko sedang istirahat");
  } else {
    print("toko tutup");
  }

//conditional ? true : false
var toko = now >= open ? "Toko buka" : "Toko sedang istirahat";
print('');

// Switch Case

  // var nilai = 'b';

  // switch (nilai) {
  //   case 'a':
  //     print('nilai sangat bagus');
  //     break;
  //   case 'b':
  //     print("nilai bagus");
  //     break;
  //   case 'c':
  //     print('nilai cukup');
  //     break;
  //   default:
  //     print('nilai tidak tersedia');
  // }
}

