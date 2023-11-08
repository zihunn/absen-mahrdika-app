class historyModel {
  int? currentPage;
  List<Data>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Links>? links;
  String? nextPageUrl;
  String? path;
  int? perPage;
  String? prevPageUrl;
  int? to;
  int? total;

  historyModel(
      {this.currentPage,
      this.data,
      this.firstPageUrl,
      this.from,
      this.lastPage,
      this.lastPageUrl,
      this.links,
      this.nextPageUrl,
      this.path,
      this.perPage,
      this.prevPageUrl,
      this.to,
      this.total});

  historyModel.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links!.add(Links.fromJson(v));
      });
    }
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['current_page'] = currentPage;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = firstPageUrl;
    data['from'] = from;
    data['last_page'] = lastPage;
    data['last_page_url'] = lastPageUrl;
    if (links != null) {
      data['links'] = links!.map((v) => v.toJson()).toList();
    }
    data['next_page_url'] = nextPageUrl;
    data['path'] = path;
    data['per_page'] = perPage;
    data['prev_page_url'] = prevPageUrl;
    data['to'] = to;
    data['total'] = total;
    return data;
  }
}

class Data {
  int? id;
  String? namaMhsw;
  String? mhswId;
  String? matkul;
  String? tanggal;
  String? jamMulai;
  String? jamSelesai;
  String? pertemuan;
  String? status;
  int? nilai;
  String? dosen;
  String? dosenId;
  String? jadwalId;
  String? tahunId;
  String? prodiId;
  String? semester;
  // ignore: prefer_void_to_null
  Null createdAt;
  // ignore: prefer_void_to_null
  Null updatedAt;

  Data(
      {this.id,
      this.namaMhsw,
      this.mhswId,
      this.matkul,
      this.tanggal,
      this.jamMulai,
      this.jamSelesai,
      this.pertemuan,
      this.status,
      this.nilai,
      this.dosen,
      this.dosenId,
      this.jadwalId,
      this.tahunId,
      this.prodiId,
      this.semester,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    namaMhsw = json['nama_mhsw'];
    mhswId = json['mhsw_id'];
    matkul = json['matkul'];
    tanggal = json['tanggal'];
    jamMulai = json['jam_mulai'];
    jamSelesai = json['jam_selesai'];
    pertemuan = json['pertemuan'];
    status = json['status'];
    nilai = json['nilai'];
    dosen = json['dosen'];
    dosenId = json['dosen_id'];
    jadwalId = json['jadwal_id'];
    tahunId = json['tahun_id'];
    prodiId = json['prodi_id'];
    semester = json['semester'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nama_mhsw'] = namaMhsw;
    data['mhsw_id'] = mhswId;
    data['matkul'] = matkul;
    data['tanggal'] = tanggal;
    data['jam_mulai'] = jamMulai;
    data['jam_selesai'] = jamSelesai;
    data['pertemuan'] = pertemuan;
    data['status'] = status;
    data['nilai'] = nilai;
    data['dosen'] = dosen;
    data['dosen_id'] = dosenId;
    data['jadwal_id'] = jadwalId;
    data['tahun_id'] = tahunId;
    data['prodi_id'] = prodiId;
    data['semester'] = semester;
    // ignore: unnecessary_this
    data['created_at'] = this.createdAt;
    // ignore: unnecessary_this
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Links {
  String? url;
  String? label;
  bool? active;

  Links({this.url, this.label, this.active});

  Links.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    data['label'] = label;
    data['active'] = active;
    return data;
  }
}
