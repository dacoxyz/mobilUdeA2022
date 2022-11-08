class site {
  var _id;
  var _name;
  var _description;
  var _otrainfo;
  var _ciudad;
  var _departamento;
  var _temperature;
  var _phone;
  var _urlPicture;
  var _latitud;
  var _longitude;
  var _address;
  var _rating;


  set rating(value) {
    _rating = value;
  }

  site.Empty();


  Map <String, dynamic> toJson() =>{
    'id' : _id,
    'name': _name,
    'description': _description,
    'otrainfo' : _otrainfo,
    'ciudad' : _ciudad,
    'departamento' : _departamento,
    'temperature' : _temperature,
    'phone' : _phone,
    'urlPicture' : _urlPicture,
    'latitud' : _latitud,
    'longitud' : _longitude,
    'address' : _address,
    'rating': _rating,
  };

  site.fromJson(Map<String, dynamic> json)
      : _id=json['id'],
        _name=json['name'],
        _description=json['description'],
        _otrainfo=json['otrainfo'],
        _ciudad=json['ciudad'],
        _departamento=json['departamento'],
        _temperature=json['temperature'],
        _phone=json['phone'],
        _urlPicture=json['urlPicture'],
        _latitud=json['latitud'],
        _longitude=json['longitude'],
        _address=json['address'],
        _rating=json['rating'];



  get id => _id;

  set id(value) {
    _id = value;
  }
  get description => _description;

  set description(value) {
    _description = value;
  }
  get address => _address;

  set address(value) {
    _address = value;
  }

  get longitude => _longitude;

  set longitude(value) {
    _longitude = value;
  }

  get latitud => _latitud;

  set latitud(value) {
    _latitud = value;
  }

  get urlPicture => _urlPicture;

  set urlPicture(value) {
    _urlPicture = value;
  }

    get phone => _phone;

  set phone(value) {
    _phone = value;
  }

  get name => _name;

  set name(value) {
    _name = value;
  }

  get otrainfo => _otrainfo;

  set otrainfo(value) {
    _otrainfo = value;
  }

  get ciudad => _ciudad;

  set ciudad(value) {
    _ciudad = value;
  }

  get departamento => _departamento;

  set departamento(value) {
    _departamento = value;
  }

  get temperature => _temperature;

  set temperature(value) {
    _temperature = value;
  }

  site(this._id, this._name,  this._description,  this._otrainfo,    this._ciudad,
      this._departamento,      this._temperature,      this._phone,  this._urlPicture,
      this._latitud,      this._longitude,      this._address,this._rating);
}