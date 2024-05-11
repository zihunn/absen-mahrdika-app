class DetailPresensiMhsw {
  String? message;
  int? value;
  List<Data>? data;

  DetailPresensiMhsw({this.message, this.value, this.data});

  DetailPresensiMhsw.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    value = json['value'];
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
    data['value'] = value;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? presensiMhswID;
  int? jadwalID;
  int? kRSID;
  int? presensiID;
  String? mhswID;
  String? jenisPresensiID;
  int? nilai;
  String? nA;

  Data(
      {this.presensiMhswID,
      this.jadwalID,
      this.kRSID,
      this.presensiID,
      this.mhswID,
      this.jenisPresensiID,
      this.nilai,
      this.nA});

  Data.fromJson(Map<String, dynamic> json) {
    presensiMhswID = json['PresensiMhswID'];
    jadwalID = json['JadwalID'];
    kRSID = json['KRSID'];
    presensiID = json['PresensiID'];
    mhswID = json['MhswID'];
    jenisPresensiID = json['JenisPresensiID'];
    nilai = json['Nilai'];
    nA = json['NA'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['PresensiMhswID'] = presensiMhswID;
    data['JadwalID'] = jadwalID;
    data['KRSID'] = kRSID;
    data['PresensiID'] = presensiID;
    data['MhswID'] = mhswID;
    data['JenisPresensiID'] = jenisPresensiID;
    data['Nilai'] = nilai;
    data['NA'] = nA;
    return data;
  }
}
