class DataDentist {
  int? id;
  String? avatar;
  String? nama;
  String? spesialis;
  String? rating;
  String? lokasi;
  String? hari;
  String? waktu;
  String? gender;

  DataDentist(
      {this.id,
      this.avatar,
      this.nama,
      this.spesialis,
      this.rating,
      this.lokasi,
      this.hari,
      this.waktu,
      this.gender});

  DataDentist.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    avatar = json['avatar'];
    nama = json['nama'];
    spesialis = json['spesialis'];
    rating = json['rating'];
    lokasi = json['lokasi'];
    hari = json['hari'];
    waktu = json['waktu'];
    gender = json['gender'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['avatar'] = this.avatar;
    data['nama'] = this.nama;
    data['spesialis'] = this.spesialis;
    data['rating'] = this.rating;
    data['lokasi'] = this.lokasi;
    data['hari'] = this.hari;
    data['waktu'] = this.waktu;
    data['gender'] = this.gender;
    return data;
  }
}