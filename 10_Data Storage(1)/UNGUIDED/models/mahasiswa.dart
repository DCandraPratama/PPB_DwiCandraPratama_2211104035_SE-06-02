class Mahasiswa {
  final int? id;
  final String nama;
  final String nim;
  final String alamat;
  final String hobi;

  Mahasiswa({this.id, required this.nama, required this.nim, required this.alamat, required this.hobi});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nama': nama,
      'nim': nim,
      'alamat': alamat,
      'hobi': hobi,
    };
  }

  factory Mahasiswa.fromMap(Map<String, dynamic> map) {
    return Mahasiswa(
      id: map['id'],
      nama: map['nama'],
      nim: map['nim'],
      alamat: map['alamat'],
      hobi: map['hobi'],
    );
  }
}