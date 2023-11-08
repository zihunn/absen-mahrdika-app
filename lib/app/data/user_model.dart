// ignore_for_file: camel_case_types, unnecessary_new, prefer_collection_literals, unnecessary_this, unnecessary_question_mark, prefer_void_to_null

class userModel {
  bool? success;
  String? message;
  Account? account;
  int? matkul;

  userModel({this.success, this.message, this.account, this.matkul});

  userModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    account =
        json['account'] != null ? new Account.fromJson(json['account']) : null;
    matkul = json['matkul'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.account != null) {
      data['account'] = this.account!.toJson();
    }
    data['matkul'] = this.matkul;
    return data;
  }
}

class Account {
  int? id;
  String? nama;
  String? npm;
  String? email;
  String? deviceId;
  String? tanggalLahir;
  String? noHp;
  String? image;
  int? sks;
  int? hadir;
  int? izin;
  int? sakit;
  int? alpa;
  String? jenisKelamin;
  String? prodiId;
  String? prodiEn;
  String? prodiID;
  String? programID;
  String? tahunId;
  Null? emailVerifiedAt;
  String? rememberToken;

  Account(
      {this.id,
      this.nama,
      this.npm,
      this.email,
      this.deviceId,
      this.tanggalLahir,
      this.noHp,
      this.image,
      this.sks,
      this.hadir,
      this.izin,
      this.sakit,
      this.alpa,
      this.jenisKelamin,
      this.prodiId,
      this.prodiEn,
      this.prodiID,
      this.programID,
      this.tahunId,
      this.emailVerifiedAt,
      this.rememberToken});

  Account.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nama = json['nama'];
    npm = json['npm'];
    email = json['email'];
    deviceId = json['device_id'];
    tanggalLahir = json['tanggal_lahir'];
    noHp = json['no_hp'];
    image = json['image'];
    sks = json['sks'];
    hadir = json['hadir'];
    izin = json['izin'];
    sakit = json['sakit'];
    alpa = json['alpa'];
    jenisKelamin = json['jenis_kelamin'];
    prodiId = json['prodi_id'];
    prodiEn = json['prodi_en'];
    prodiID = json['prodiID'];
    programID = json['programID'];
    tahunId = json['tahun_id'];
    emailVerifiedAt = json['email_verified_at'];
    rememberToken = json['remember_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nama'] = this.nama;
    data['npm'] = this.npm;
    data['email'] = this.email;
    data['device_id'] = this.deviceId;
    data['tanggal_lahir'] = this.tanggalLahir;
    data['no_hp'] = this.noHp;
    data['image'] = this.image;
    data['sks'] = this.sks;
    data['hadir'] = this.hadir;
    data['izin'] = this.izin;
    data['sakit'] = this.sakit;
    data['alpa'] = this.alpa;
    data['jenis_kelamin'] = this.jenisKelamin;
    data['prodi_id'] = this.prodiId;
    data['prodi_en'] = this.prodiEn;
    data['prodiID'] = this.prodiID;
    data['programID'] = this.programID;
    data['tahun_id'] = this.tahunId;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['remember_token'] = this.rememberToken;
    return data;
  }
}
