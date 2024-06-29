class DataAnak {
  final int id; // Tambahkan ID untuk mengidentifikasi unik setiap anak
  final String namaAnak;
  final DateTime dob;
  final String gender;
  final String parentName;
  final String parentContact;

  DataAnak({
    required this.id, // Tambahkan parameter ID di konstruktor
    required this.namaAnak,
    required this.dob,
    required this.gender,
    required this.parentName,
    required this.parentContact,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'namaAnak': namaAnak,
      'dob': dob.toIso8601String(),
      'gender': gender,
      'parentName': parentName,
      'parentContact': parentContact,
    };
  }

  factory DataAnak.fromMap(Map<String, dynamic> map) {
    return DataAnak(
      id: map['id'],
      namaAnak: map['namaAnak'],
      dob: DateTime.parse(map['dob']),
      gender: map['gender'],
      parentName: map['parentName'],
      parentContact: map['parentContact'],
    );
  }
}

final List<DataAnak> childrenData = [
  DataAnak(
    id: 1,
    namaAnak: 'Razor Satya Darmawan',
    dob: DateTime(2018, 7, 12),
    gender: 'Male',
    parentName: 'Lisa Puspita Dewi',
    parentContact: '123-456-7890',
  ),
  DataAnak(
    id: 2,
    namaAnak: 'Qiqi Saraswati',
    dob: DateTime(2017, 6, 21),
    gender: 'Female',
    parentName: 'Ganyu Indra Kencana',
    parentContact: '123-555-7890',
  ),
  DataAnak(
    id: 3,
    namaAnak: 'Xiao Jaya Kusuma',
    dob: DateTime(2019, 3, 14),
    gender: 'Male',
    parentName: 'Zhongli Kusuma',
    parentContact: '123-777-7890',
  ),
  DataAnak(
    id: 4,
    namaAnak: 'Diona Anggaraeni',
    dob: DateTime(2020, 5, 22),
    gender: 'Female',
    parentName: 'Kaeya Bagaskara',
    parentContact: '123-888-7890',
  ),
  DataAnak(
    id: 5,
    namaAnak: 'Sayu Rahayu',
    dob: DateTime(2016, 11, 8),
    gender: 'Female',
    parentName: 'Ayato Dharma Wirawan',
    parentContact: '123-999-7890',
  ),
];
