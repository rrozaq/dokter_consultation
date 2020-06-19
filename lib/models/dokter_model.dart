class DokterModel {
    final int id;
    final String nama; 
    final String posisi;
    final String gambar;
    final String deskripsi;
    final String nohp;
    final String wa;
    final String alamat;
    final String status;

    DokterModel({this.id, this.nama, this.posisi, this.gambar, this.deskripsi, this.nohp, this.wa, this.alamat, this.status});

    // Format to JSON
    factory DokterModel.fromJson(Map<String, dynamic> json) => DokterModel(
        id: json['id'],
        nama: json['nama'],
        posisi: json['posisi'],
        gambar: json['gambar'],
        deskripsi: json['deskripsi'],
        nohp: json['nohp'],
        wa: json['wa'],
        alamat: json['alamat'],
        status: json['status']
      );
    }