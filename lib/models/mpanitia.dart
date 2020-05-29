class Panitia {
  int _id;
  String _name;
  String _jurusan;
  String _fakultas;
  String _panitia;
  // konstruktor versi 1
  Panitia(this._name, this._jurusan, this._fakultas, this._panitia);

  // konstruktor versi 2: konversi dari Map ke Contact
  Panitia.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._name = map['name'];
    this._jurusan = map['jurusan'];
    this._fakultas = map['fakultas'];
    this._panitia = map['panitia'];
  }
  //getter dan setter (mengambil dan mengisi data kedalam object)
  // getter
  int get id => _id;
  String get name => _name;
  String get jurusan => _jurusan;
  String get fakultas => _fakultas;
  String get panitia => _panitia;

  // setter
  set name(String value) {
    _name = value;
  }

  set jurusan(String value) {
    _jurusan = value;
  }

  set fakultas(String value) {
    _fakultas = value;
  }

  set panitia(String value) {
    _panitia = value;
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['id'] = this._id;
    map['name'] = name;
    map['jurusan'] = jurusan;
    map['fakultas']= fakultas;
    map['panitia'] = panitia;
    return map;
  }

}