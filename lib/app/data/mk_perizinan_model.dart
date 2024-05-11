class MkPerizinanModel {
  String? message;
  List<Data>? data;
  bool? status;

  MkPerizinanModel({this.message, this.data, this.status});

  MkPerizinanModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    return data;
  }
}

class Data {
  int? id;
  String? nama;
  String? jamMulai;
  String? jamSelesai;
  String? dosen;
  int? krsId;
  List<DataPresensi>? dataPresensi;

  Data(
      {this.id,
      this.nama,
      this.jamMulai,
      this.jamSelesai,
      this.dosen,
      this.krsId,
      this.dataPresensi});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nama = json['nama'];
    jamMulai = json['jam_mulai'];
    jamSelesai = json['jam_selesai'];
    dosen = json['dosen'];
    krsId = json['krs_id'];
    if (json['data_presensi'] != null) {
      dataPresensi = <DataPresensi>[];
      json['data_presensi'].forEach((v) {
        dataPresensi!.add(new DataPresensi.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nama'] = this.nama;
    data['jam_mulai'] = this.jamMulai;
    data['jam_selesai'] = this.jamSelesai;
    data['dosen'] = this.dosen;
    data['krs_id'] = this.krsId;
    if (this.dataPresensi != null) {
      data['data_presensi'] =
          this.dataPresensi!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataPresensi {
  int? pertemuan;
  int? presensiId;

  DataPresensi({this.pertemuan, this.presensiId});

  DataPresensi.fromJson(Map<String, dynamic> json) {
    pertemuan = json['pertemuan'];
    presensiId = json['presensi_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pertemuan'] = this.pertemuan;
    data['presensi_id'] = this.presensiId;
    return data;
  }
}
