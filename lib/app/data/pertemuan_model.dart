class PertemuanModel {
  String? message;
  bool? status;
  int? total;
  List<Data>? data;

  PertemuanModel({this.message, this.status, this.total, this.data});

  PertemuanModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
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
    data['status'] = status;
    data['total'] = total;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? presensiID;
  int? honorDosenID;
  String? tahunID;
  int? jadwalID;
  int? pertemuan;
  String? dosenID;
  String? tanggal;
  String? jamMulai;
  String? jamSelesai;
  String? hitung;
  String? catatan;
  int? sKSHonor;
  int? tunjanganSKS;
  int? tunjanganTransport;
  int? tunjanganTetap;
  String? nA;
  String? loginBuat;
  String? tanggalBuat;
  String? loginEdit;
  String? tanggalEdit;

  Data(
      {this.presensiID,
      this.honorDosenID,
      this.tahunID,
      this.jadwalID,
      this.pertemuan,
      this.dosenID,
      this.tanggal,
      this.jamMulai,
      this.jamSelesai,
      this.hitung,
      this.catatan,
      this.sKSHonor,
      this.tunjanganSKS,
      this.tunjanganTransport,
      this.tunjanganTetap,
      this.nA,
      this.loginBuat,
      this.tanggalBuat,
      this.loginEdit,
      this.tanggalEdit});

  Data.fromJson(Map<String, dynamic> json) {
    presensiID = json['PresensiID'];
    honorDosenID = json['HonorDosenID'];
    tahunID = json['TahunID'];
    jadwalID = json['JadwalID'];
    pertemuan = json['Pertemuan'];
    dosenID = json['DosenID'];
    tanggal = json['Tanggal'];
    jamMulai = json['JamMulai'];
    jamSelesai = json['JamSelesai'];
    hitung = json['Hitung'];
    catatan = json['Catatan'];
    sKSHonor = json['SKSHonor'];
    tunjanganSKS = json['TunjanganSKS'];
    tunjanganTransport = json['TunjanganTransport'];
    tunjanganTetap = json['TunjanganTetap'];
    nA = json['NA'];
    loginBuat = json['LoginBuat'];
    tanggalBuat = json['TanggalBuat'];
    loginEdit = json['LoginEdit'];
    tanggalEdit = json['TanggalEdit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['PresensiID'] = presensiID;
    data['HonorDosenID'] = honorDosenID;
    data['TahunID'] = tahunID;
    data['JadwalID'] = jadwalID;
    data['Pertemuan'] = pertemuan;
    data['DosenID'] = dosenID;
    data['Tanggal'] = tanggal;
    data['JamMulai'] = jamMulai;
    data['JamSelesai'] = jamSelesai;
    data['Hitung'] = hitung;
    data['Catatan'] = catatan;
    data['SKSHonor'] = sKSHonor;
    data['TunjanganSKS'] = tunjanganSKS;
    data['TunjanganTransport'] = tunjanganTransport;
    data['TunjanganTetap'] = tunjanganTetap;
    data['NA'] = nA;
    data['LoginBuat'] = loginBuat;
    data['TanggalBuat'] = tanggalBuat;
    data['LoginEdit'] = loginEdit;
    data['TanggalEdit'] = tanggalEdit;
    return data;
  }
}
