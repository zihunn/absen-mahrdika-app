class SearchModel {
  String? message;
  bool? status;
  int? total;
  List<Data>? data;

  SearchModel({this.message, this.status, this.total, this.data});

  SearchModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    total = json['total'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    data['total'] = this.total;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? nama;
  int? kRSID;
  int? jadwalID;

  Data({this.nama, this.kRSID, this.jadwalID});

  Data.fromJson(Map<String, dynamic> json) {
    nama = json['Nama'];
    kRSID = json['KRSID'];
    jadwalID = json['JadwalID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Nama'] = this.nama;
    data['KRSID'] = this.kRSID;
    data['JadwalID'] = this.jadwalID;
    return data;
  }
}
