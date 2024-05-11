class userModel {
  bool? success;
  String? message;
  Account? account;

  userModel({this.success, this.message, this.account});

  userModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    account =
        json['account'] != null ? Account.fromJson(json['account']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (account != null) {
      data['account'] = account!.toJson();
    }
    return data;
  }
}

class Account {
  int? id;
  String? nama;
  String? npm;
  String? role;
  String? dosenId;
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
  String? emailVerifiedAt;
  String? nidn;
  String? tempatLahir;
  String? gelarDepan;
  String? gelarBelakang;
  String? rememberToken;

  Account(
      {this.id,
      this.nama,
      this.npm,
      this.role,
      this.dosenId,
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
      this.nidn,
      this.tempatLahir,
      this.gelarDepan,
      this.gelarBelakang,
      this.rememberToken});

  Account.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nama = json['nama'];
    npm = json['npm'];
    role = json['role'];
    dosenId = json['dosen_id'];
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
    nidn = json['nidn'];
    tempatLahir = json['tempat_lahir'];
    gelarDepan = json['gelar_depan'];
    gelarBelakang = json['gelar_belakang'];
    rememberToken = json['remember_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nama'] = nama;
    data['npm'] = npm;
    data['role'] = role;
    data['dosen_id'] = dosenId;
    data['email'] = email;
    data['device_id'] = deviceId;
    data['tanggal_lahir'] = tanggalLahir;
    data['no_hp'] = noHp;
    data['image'] = image;
    data['sks'] = sks;
    data['hadir'] = hadir;
    data['izin'] = izin;
    data['sakit'] = sakit;
    data['alpa'] = alpa;
    data['jenis_kelamin'] = jenisKelamin;
    data['prodi_id'] = prodiId;
    data['prodi_en'] = prodiEn;
    data['prodiID'] = prodiID;
    data['programID'] = programID;
    data['tahun_id'] = tahunId;
    data['email_verified_at'] = emailVerifiedAt;
    data['nidn'] = nidn;
    data['tempat_lahir'] = tempatLahir;
    data['gelar_depan'] = gelarDepan;
    data['gelar_belakang'] = gelarBelakang;
    data['remember_token'] = rememberToken;
    return data;
  }
}
