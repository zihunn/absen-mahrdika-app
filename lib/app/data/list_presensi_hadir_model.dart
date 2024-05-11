class PresensiHadirModel {
  int? total;
  List<Data>? data;

  PresensiHadirModel({this.total, this.data});

  PresensiHadirModel.fromJson(Map<String, dynamic> json) {
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
    data['total'] = total;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? nama;
  String? npm;
  String? image;
  String? status;
  int? nilai;

  Data({this.nama, this.npm, this.image, this.status, this.nilai});

  Data.fromJson(Map<String, dynamic> json) {
    nama = json['nama'];
    npm = json['npm'];
    image = json['image'];
    status = json['status'];
    nilai = json['nilai'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nama'] = nama;
    data['npm'] = npm;
    data['image'] = image;
    data['status'] = status;
    data['nilai'] = nilai;
    return data;
  }
}
