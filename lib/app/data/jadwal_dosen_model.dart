class jadwalDosenModel {
  String? message;
  int? total;
  bool? status;
  List<Data>? data;

  jadwalDosenModel({this.message, this.total, this.status, this.data});

  jadwalDosenModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    total = json['total'];
    status = json['status'];
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
    data['total'] = total;
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? jadwalId;
  String? tahunId;
  String? prodi;
  String? program;
  int? mkId;
  String? mkKode;
  String? namaMk;
  String? hari;
  String? jamMulai;
  String? jamSelesai;
  int? sKS;
  String? tanggalMulai;
  String? tanggalSelesai;
  String? dosen;
  int? semester;
  int? totalPertemuan;

  Data(
      {this.jadwalId,
      this.tahunId,
      this.prodi,
      this.program,
      this.mkId,
      this.mkKode,
      this.namaMk,
      this.hari,
      this.jamMulai,
      this.jamSelesai,
      this.sKS,
      this.tanggalMulai,
      this.tanggalSelesai,
      this.dosen,
      this.semester,
      this.totalPertemuan,
      });

  Data.fromJson(Map<String, dynamic> json) {
    jadwalId = json['Jadwal_id'];
    tahunId = json['Tahun_id'];
    prodi = json['Prodi'];
    program = json['Program'];
    mkId = json['Mk_id'];
    mkKode = json['Mk_kode'];
    namaMk = json['Nama_mk'];
    hari = json['Hari'];
    jamMulai = json['Jam_mulai'];
    jamSelesai = json['Jam_selesai'];
    sKS = json['SKS'];
    tanggalMulai = json['Tanggal_mulai'];
    tanggalSelesai = json['Tanggal_selesai'];
    dosen = json['dosen'];
    semester = json['Semester'];
    totalPertemuan = json['total_presensi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Jadwal_id'] = jadwalId;
    data['Tahun_id'] = tahunId;
    data['Prodi'] = prodi;
    data['Program'] = program;
    data['Mk_id'] = mkId;
    data['Mk_kode'] = mkKode;
    data['Nama_mk'] = namaMk;
    data['Hari'] = hari;
    data['Jam_mulai'] = jamMulai;
    data['Jam_selesai'] = jamSelesai;
    data['SKS'] = sKS;
    data['Tanggal_mulai'] = tanggalMulai;
    data['Tanggal_selesai'] = tanggalSelesai;
    data['dosen'] = dosen;
    data['Semester'] = semester;
    data['total_presensi'] = totalPertemuan;
    return data;
  }
}
