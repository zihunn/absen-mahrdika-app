class krsModel {
  String? message;
  String? dosen;
  String? statusKrs;
  String? mulaiKrs;
  String? selesaiKrs;
  bool? availKrs;
  String? totalSks;
  List<Data>? data;

  krsModel(
      {this.message,
      this.dosen,
      this.statusKrs,
      this.mulaiKrs,
      this.selesaiKrs,
      this.availKrs,
      this.totalSks,
      this.data});

  krsModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    dosen = json['dosen'];
    statusKrs = json['status_krs'];
    mulaiKrs = json['mulai_krs'];
    selesaiKrs = json['selesai_krs'];
    availKrs = json['avail_krs'];
    totalSks = json['total_sks'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['dosen'] = dosen;
    data['status_krs'] = statusKrs;
    data['mulai_krs'] = mulaiKrs;
    data['selesai_krs'] = selesaiKrs;
    data['avail_krs'] = availKrs;
    data['total_sks'] = totalSks;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? krsId;
  int? jadwalId;
  String? nama;
  int? sks;
  String? jamMulai;
  String? jamSelesai;
  String? dosen;
  int? semester;

  Data(
      {this.krsId,
      this.jadwalId,
      this.nama,
      this.sks,
      this.jamMulai,
      this.jamSelesai,
      this.dosen,
      this.semester});

  Data.fromJson(Map<String, dynamic> json) {
    krsId = json['krs_id'];
    jadwalId = json['jadwal_id'];
    nama = json['Nama'];
    sks = json['Sks'];
    jamMulai = json['jam_mulai'];
    jamSelesai = json['jam_selesai'];
    dosen = json['dosen'];
    semester = json['semester'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['krs_id'] = krsId;
    data['jadwal_id'] = jadwalId;
    data['Nama'] = nama;
    data['Sks'] = sks;
    data['jam_mulai'] = jamMulai;
    data['jam_selesai'] = jamSelesai;
    data['dosen'] = dosen;
    data['semester'] = semester;
    return data;
  }
}
