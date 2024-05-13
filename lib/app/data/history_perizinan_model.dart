class HistoryPerizinanModel {
  String? message;
  bool? status;
  int? totalData;
  List<Data>? data;

  HistoryPerizinanModel({this.message, this.status, this.totalData, this.data});

  HistoryPerizinanModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    totalData = json['total_data'];
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
    data['status'] = status;
    data['total_data'] = totalData;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  int? presensiId;
  int? jadwalId;
  String? hari;
  String? jamMulai;
  String? jamSelesai;
  String? namaMk;
  String? npm;
  String? namaMhsw;
  String? keterangan;
  String? kategori;
  String? file;
  String? disetujui;
  String? tanggal;

  Data(
      {this.id,
      this.presensiId,
      this.jadwalId,
      this.hari,
      this.jamMulai,
      this.jamSelesai,
      this.namaMk,
      this.npm,
      this.namaMhsw,
      this.keterangan,
      this.kategori,
      this.file,
      this.disetujui,
      this.tanggal});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    presensiId = json['presensi_id'];
    jadwalId = json['jadwal_id'];
    hari = json['hari'];
    jamMulai = json['jam_mulai'];
    jamSelesai = json['jam_selesai'];
    namaMk = json['nama_mk'];
    npm = json['npm'];
    namaMhsw = json['nama_mhsw'];
    keterangan = json['keterangan'];
    kategori = json['kategori'];
    file = json['file'];
    disetujui = json['disetujui'];
    tanggal = json['tanggal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['presensi_id'] = presensiId;
    data['jadwal_id'] = jadwalId;
    data['hari'] = hari;
    data['jam_mulai'] = jamMulai;
    data['jam_selesai'] = jamSelesai;
    data['nama_mk'] = namaMk;
    data['npm'] = npm;
    data['nama_mhsw'] = namaMhsw;
    data['keterangan'] = keterangan;
    data['kategori'] = kategori;
    data['file'] = file;
    data['disetujui'] = disetujui;
    data['tanggal'] = tanggal;
    return data;
  }
}
