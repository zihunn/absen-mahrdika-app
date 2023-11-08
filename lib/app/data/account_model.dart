// // ignore_for_file: no_leading_underscores_for_local_identifiers

// class AutoGenerate {
//   AutoGenerate({
//     required this.account,
//   });
//   late final Account account;

//   AutoGenerate.fromJson(Map<String, dynamic> json) {
//     account = Account.fromJson(json['account']);
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['account'] = account.toJson();
//     return _data;
//   }
// }

// class Account {
//   Account({
//     required this.id,
//     required this.nama,
//     required this.npm,
//     required this.email,
//     required this.deviceId,
//     required this.tanggalLahir,
//     required this.noHp,
//     this.image,
//     required this.sks,
//     required this.hadir,
//     required this.izin,
//     required this.sakit,
//     required this.alpa,
//     required this.jenisKelamin,
//     required this.prodiId,
//     required this.prodiEn,
//     required this.prodiID,
//     required this.programID,
//     required this.tahunId,
//     this.emailVerifiedAt,
//   });
//   late final int id;
//   late final String nama;
//   late final String npm;
//   late final String email;
//   late final String deviceId;
//   late final String tanggalLahir;
//   late final String noHp;
//   // ignore: prefer_void_to_null
//   late final Null image;
//   late final int sks;
//   late final int hadir;
//   late final int izin;
//   late final int sakit;
//   late final int alpa;
//   late final String jenisKelamin;
//   late final String prodiId;
//   late final String prodiEn;
//   late final String prodiID;
//   late final String programID;
//   late final String tahunId;
//   // ignore: prefer_void_to_null
//   late final Null emailVerifiedAt;

//   Account.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     nama = json['nama'];
//     npm = json['npm'];
//     email = json['email'];
//     deviceId = json['device_id'];
//     tanggalLahir = json['tanggal_lahir'];
//     noHp = json['no_hp'];
//     image = null;
//     sks = json['sks'];
//     hadir = json['hadir'];
//     izin = json['izin'];
//     sakit = json['sakit'];
//     alpa = json['alpa'];
//     jenisKelamin = json['jenis_kelamin'];
//     prodiId = json['prodi_id'];
//     prodiEn = json['prodi_en'];
//     prodiID = json['prodiID'];
//     programID = json['programID'];
//     tahunId = json['tahun_id'];
//     emailVerifiedAt = null;
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['id'] = id;
//     _data['nama'] = nama;
//     _data['npm'] = npm;
//     _data['email'] = email;
//     _data['device_id'] = deviceId;
//     _data['tanggal_lahir'] = tanggalLahir;
//     _data['no_hp'] = noHp;
//     _data['image'] = image;
//     _data['sks'] = sks;
//     _data['hadir'] = hadir;
//     _data['izin'] = izin;
//     _data['sakit'] = sakit;
//     _data['alpa'] = alpa;
//     _data['jenis_kelamin'] = jenisKelamin;
//     _data['prodi_id'] = prodiId;
//     _data['prodi_en'] = prodiEn;
//     _data['prodiID'] = prodiID;
//     _data['programID'] = programID;
//     _data['tahun_id'] = tahunId;
//     _data['email_verified_at'] = emailVerifiedAt;
//     return _data;
//   }
// }
