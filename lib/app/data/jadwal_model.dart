// ignore_for_file: prefer_void_to_null

class jadwalModel {
  String? message;
  bool? success;
  int? total;
  List<Data>? data;

  jadwalModel({this.message, this.success, this.total, this.data});

  jadwalModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    success = json['success'];
    total = json['total'];
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
    data['success'] = success;
    data['total'] = total;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? npm;
  String? namaMhsw;
  String? matkul;
  String? hari;
  String? tahunId;
  String? jamMulai;
  String? jamSelesai;
  String? tanggalMulai;
  String? tanggalSelesai;
  String? dosen;
  String? dosenID;
  Null createdAt;
  Null updatedAt;

  Data(
      {this.id,
      this.npm,
      this.namaMhsw,
      this.matkul,
      this.hari,
      this.tahunId,
      this.jamMulai,
      this.jamSelesai,
      this.tanggalMulai,
      this.tanggalSelesai,
      this.dosen,
      this.dosenID,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    npm = json['npm'];
    namaMhsw = json['nama_mhsw'];
    matkul = json['matkul'];
    hari = json['hari'];
    tahunId = json['tahun_id'];
    jamMulai = json['jam_mulai'];
    jamSelesai = json['jam_selesai'];
    tanggalMulai = json['tanggal_mulai'];
    tanggalSelesai = json['tanggal_selesai'];
    dosen = json['dosen'];
    dosenID = json['dosenID'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['npm'] = npm;
    data['nama_mhsw'] = namaMhsw;
    data['matkul'] = matkul;
    data['hari'] = hari;
    data['tahun_id'] = tahunId;
    data['jam_mulai'] = jamMulai;
    data['jam_selesai'] = jamSelesai;
    data['tanggal_mulai'] = tanggalMulai;
    data['tanggal_selesai'] = tanggalSelesai;
    data['dosen'] = dosen;
    data['dosenID'] = dosenID;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
