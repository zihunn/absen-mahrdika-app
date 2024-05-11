class SerachDosenModel {
  String? message;
  bool? status;
  int? total;
  List<Data>? data;

  SerachDosenModel({this.message, this.status, this.total, this.data});

  SerachDosenModel.fromJson(Map<String, dynamic> json) {
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
  int? id;
  String? nama;
  String? dosenId;
  String? email;
  String? image;
  int? dosenUtama;

  Data(
      {this.id,
      this.nama,
      this.dosenId,
      this.email,
      this.image,
      this.dosenUtama});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'] ;
    nama = json['nama'];
    dosenId = json['dosen_id'];
    email = json['email'];
    image = json['image'];
    dosenUtama = json['dosen_utama'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nama'] = nama;
    data['dosen_id'] = dosenId;
    data['email'] = email;
    data['image'] = image;
    data['dosen_utama'] = dosenUtama;
    return data;
  }
}
