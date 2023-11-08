class totalAbsenModel {
  String? message;
  bool? success;
  Data? data;

  totalAbsenModel({this.message, this.success, this.data});

  totalAbsenModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    success = json['success'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['success'] = success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? hadir;
  int? izin;
  int? sakit;
  int? alpa;

  Data({this.hadir, this.izin, this.sakit, this.alpa});

  Data.fromJson(Map<String, dynamic> json) {
    hadir = json['hadir'];
    izin = json['izin'];
    sakit = json['sakit'];
    alpa = json['alpa'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['hadir'] = hadir;
    data['izin'] = izin;
    data['sakit'] = sakit;
    data['alpa'] = alpa;
    return data;
  }
}
